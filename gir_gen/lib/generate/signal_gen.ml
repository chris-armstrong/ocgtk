(* Signal code generation — pure-data API.
   Provides classify / emit_l1_val / emit_l1_let / emit_l2_method.
   No file I/O: all functions return strings. *)

open StdLabels
open Printf
open Types

(* ================================================================= *)
(* OCaml keyword list (shared with parameter sanitization)           *)
(* ================================================================= *)

let ocaml_keywords =
  [
    "and";
    "as";
    "assert";
    "begin";
    "class";
    "constraint";
    "do";
    "done";
    "downto";
    "else";
    "end";
    "exception";
    "external";
    "false";
    "for";
    "fun";
    "function";
    "functor";
    "if";
    "in";
    "include";
    "inherit";
    "initializer";
    "land";
    "lazy";
    "let";
    "lor";
    "lsl";
    "lsr";
    "lxor";
    "match";
    "method";
    "mod";
    "module";
    "mutable";
    "new";
    "nonrec";
    "object";
    "of";
    "open";
    "or";
    "private";
    "rec";
    "sig";
    "struct";
    "then";
    "to";
    "true";
    "try";
    "type";
    "val";
    "virtual";
    "when";
    "while";
    "with";
  ]

(* ================================================================= *)
(* Name sanitization                                                  *)
(* ================================================================= *)

let sanitize_signal_name name =
  let base =
    name
    |> String.map ~f:(function '-' -> '_' | c -> c)
    |> Utils.to_snake_case
  in
  "on_"
  ^
  if List.exists ocaml_keywords ~f:(String.equal base) then base ^ "_" else base

let sanitize_param_name name =
  let base =
    name
    |> String.map ~f:(function '-' -> '_' | c -> c)
    |> Utils.to_snake_case
  in
  if List.exists ocaml_keywords ~f:(String.equal base) then base ^ "_" else base

(* ================================================================= *)
(* signal_emission record                                             *)
(* ================================================================= *)

type signal_emission = {
  signal : gir_signal;
  method_name : string;
  raw_signal_name : string;
  param_marshallers : (gir_param * Signal_marshaller.marshaller) list;
  return_marshaller : Signal_marshaller.marshaller option;
  ocaml_callback_type : string;
  strategy : [ `Connect_simple | `Closure ];
}

(* ================================================================= *)
(* classify                                                           *)
(* ================================================================= *)

(** Classify a single [gir_param], returning [Ok marshaller] or [Error reason].
    Only [In]-direction parameters are supported. *)
let classify_param ~ctx (param : gir_param) :
    (gir_param * Signal_marshaller.marshaller, string) result =
  match param.direction with
  | Out | InOut ->
      Error (sprintf "non-In direction parameter '%s'" param.param_name)
  | In -> (
      match Signal_marshaller.classify ~ctx ~gir_type:param.param_type with
      | Signal_marshaller.Unsupported reason ->
          Error
            (sprintf "unsupported parameter type for '%s': %s" param.param_name
               reason)
      | Signal_marshaller.Supported m -> Ok (param, m))

(** Derive the callback type string from the param/return marshallers. *)
let build_callback_type
    (param_marshallers : (gir_param * Signal_marshaller.marshaller) list)
    (return_marshaller : Signal_marshaller.marshaller option) : string =
  let param_parts =
    List.map param_marshallers
      ~f:(fun (param, (m : Signal_marshaller.marshaller)) ->
        sprintf "%s:%s" (sanitize_param_name param.param_name) m.ocaml_type)
  in
  let return_type =
    match return_marshaller with None -> "unit" | Some m -> m.ocaml_type
  in
  match param_parts with
  | [] -> sprintf "unit -> %s" return_type
  | _ -> sprintf "%s -> %s" (String.concat ~sep:" -> " param_parts) return_type

(** Check whether any parameter classification failed; return the first error or
    the list of supported (param, marshaller) pairs. *)
let collect_param_results param_results :
    ((gir_param * Signal_marshaller.marshaller) list, string) result =
  let first_error =
    List.find_opt ~f:(function Error _ -> true | Ok _ -> false) param_results
  in
  match first_error with
  | Some (Error reason) -> Error reason
  | Some (Ok _) -> assert false
  | None ->
      let supported =
        List.filter_map
          ~f:(function Ok pair -> Some pair | Error _ -> None)
          param_results
      in
      Ok supported

(** Classify the return type, converting void/unit to [None] and other supported
    types to [Some marshaller]. *)
let classify_return ~ctx (return_type : gir_type) :
    (Signal_marshaller.marshaller option, string) result =
  match Signal_marshaller.classify ~ctx ~gir_type:return_type with
  | Signal_marshaller.Supported m when String.equal m.ocaml_type "unit" ->
      Ok None
  | Signal_marshaller.Supported m -> Ok (Some m)
  | Signal_marshaller.Unsupported reason ->
      Error (sprintf "unsupported return type: %s" reason)

let classify ~ctx (signal : gir_signal) : (signal_emission, string) result =
  let ( let* ) = Result.bind in
  (* Collect In-direction parameters; fail on Out/InOut or unsupported type *)
  let param_results = List.map signal.sig_parameters ~f:(classify_param ~ctx) in
  let* supported_params = collect_param_results param_results in
  (* Classify the return type *)
  let* return_marshaller = classify_return ~ctx signal.return_type in
  let strategy =
    match (supported_params, return_marshaller) with
    | [], None -> `Connect_simple
    | _ -> `Closure
  in
  let method_name = sanitize_signal_name signal.signal_name in
  let ocaml_callback_type =
    build_callback_type supported_params return_marshaller
  in
  Ok
    {
      signal;
      method_name;
      raw_signal_name = signal.signal_name;
      param_marshallers = supported_params;
      return_marshaller;
      ocaml_callback_type;
      strategy;
    }

(* ================================================================= *)
(* emit_l1_val                                                        *)
(* ================================================================= *)

let emit_l1_val (e : signal_emission) : string =
  sprintf "val %s : ?after:bool -> t -> callback:(%s) -> Gobject.handler_id\n"
    e.method_name e.ocaml_callback_type

(* ================================================================= *)
(* emit_l1_let                                                        *)
(* ================================================================= *)

(** Substitute the placeholder [v] in a [getter_expr] with the actual
    [Gobject.Closure.nth argv ~pos:N] expression for position [pos]. *)
let substitute_getter_expr (getter_expr : string) (pos : int) : string =
  let nth_expr = sprintf "(Gobject.Closure.nth argv ~pos:%d)" pos in
  sprintf "(let v = %s in %s)" nth_expr getter_expr

(** Emit the closure body for signals with parameters and/or a return value. *)
let emit_closure_body (e : signal_emission) : string =
  let buf = Buffer.create 256 in
  Buffer.add_string buf "Gobject.Closure.create (fun argv ->\n";
  (* Extract each parameter from the closure argv (positions start at 1) *)
  List.iteri e.param_marshallers
    ~f:(fun i (param, (m : Signal_marshaller.marshaller)) ->
      let pos = i + 1 in
      let pname = sanitize_param_name param.param_name in
      bprintf buf "    let %s = %s in\n" pname
        (substitute_getter_expr m.getter_expr pos));
  (* Build the callback application *)
  let callback_args =
    List.map e.param_marshallers ~f:(fun (param, _) ->
        sprintf "~%s" (sanitize_param_name param.param_name))
  in
  let callback_call =
    match callback_args with
    | [] -> "callback ()"
    | args -> sprintf "callback %s" (String.concat ~sep:" " args)
  in
  (match e.return_marshaller with
  | None -> bprintf buf "    %s)\n" callback_call
  | Some m ->
      bprintf buf "    let result = %s in\n" callback_call;
      (* setter_expr uses x as placeholder for the value to set *)
      let setter =
        (* The setter_expr pattern is like "Gobject.Value.set_boolean v x"
           where v is the target GValue (Gobject.Closure.result argv) and x is
           the OCaml value.  Replace v with the result value argument and x
           with result. *)
        sprintf
          "let v = Gobject.Closure.result argv in\n\
          \    let x = result in\n\
          \    %s"
          m.setter_expr
      in
      bprintf buf "    %s)" setter);
  Buffer.contents buf

let emit_l1_let (e : signal_emission) : string =
  match e.strategy with
  | `Connect_simple ->
      sprintf
        "let %s ?after obj ~callback =\n\
        \  Gobject.Signal.connect_simple obj ~name:\"%s\" ~callback\n\
        \    ~after:(Option.value after ~default:false)\n\n"
        e.method_name e.raw_signal_name
  | `Closure ->
      let buf = Buffer.create 256 in
      bprintf buf "let %s ?after obj ~callback =\n" e.method_name;
      bprintf buf "  let closure = %s in\n" (emit_closure_body e);
      bprintf buf "  Gobject.Signal.connect obj ~name:\"%s\" ~closure\n"
        e.raw_signal_name;
      bprintf buf "    ~after:(Option.value after ~default:false)\n\n";
      Buffer.contents buf

(* ================================================================= *)
(* emit_l2_method                                                     *)
(* ================================================================= *)

let emit_l2_method (e : signal_emission) ~layer1_module_name ~class_snake :
    string =
  sprintf
    "  method %s ?after ~callback =\n    %s.%s ?after self#as_%s ~callback\n\n"
    e.method_name layer1_module_name e.method_name class_snake

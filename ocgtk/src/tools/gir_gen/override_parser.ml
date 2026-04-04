(* S-expression parser for GIR override files. *)

open Override_types

type parse_error =
  | Invalid_format of { location : string; message : string }
  | Unknown_entity_kind of string
  | Duplicate_entity of { kind : string; name : string }
  | Duplicate_component of { entity : string; component_kind : string; name : string }
  | Invalid_version of { name : string; version : string; reason : string }

let format_error = function
  | Invalid_format { location; message } ->
      Printf.sprintf "%s: %s" location message
  | Unknown_entity_kind kind ->
      Printf.sprintf "Unknown entity kind: %s" kind
  | Duplicate_entity { kind; name } ->
      Printf.sprintf "Duplicate %s '%s'" kind name
  | Duplicate_component { entity; component_kind; name } ->
      Printf.sprintf "Duplicate %s '%s' in %s" component_kind name entity
  | Invalid_version { name; version; reason } ->
      Printf.sprintf "Invalid version '%s' for '%s': %s" version name reason

module Sexp = Sexplib.Sexp

let ( let* ) = Result.bind

let validate_version name version_str =
  match Version_guard.parse_version version_str with
  | Ok _ -> Ok ()
  | Error reason -> Error (Invalid_version { name; version = version_str; reason })

let parse_component ~entity_name sexp =
  match sexp with
  | Sexp.List [ Sexp.Atom _comp_kind; Sexp.Atom comp_name; Sexp.Atom "ignore" ]
  | Sexp.List [ Sexp.Atom _comp_kind; Sexp.Atom comp_name; Sexp.List [ Sexp.Atom "ignore" ] ]
    ->
      Ok { component_name = comp_name; action = Ignore }
  | Sexp.List
      [ Sexp.Atom _comp_kind; Sexp.Atom comp_name; Sexp.List [ Sexp.Atom "version"; Sexp.Atom v ] ]
    -> (
      match validate_version comp_name v with
      | Error e -> Error e
      | Ok () -> Ok { component_name = comp_name; action = Set_version v })
  | Sexp.List (Sexp.Atom _comp_kind :: Sexp.Atom comp_name :: _) ->
      Error
        (Invalid_format
           {
             location = Printf.sprintf "%s %s" entity_name comp_name;
             message = "Expected (ignore) or (version \"...\")";
           })
  | _ ->
      Error
        (Invalid_format
           { location = entity_name; message = "Malformed component override" })

let parse_components_of_kind ~entity_name ~kind sexps =
  let rec parse acc = function
    | [] -> Ok (List.rev acc)
    | sexp :: rest -> (
        match sexp with
        | Sexp.List (Sexp.Atom k :: _) when String.equal k kind -> (
            match parse_component ~entity_name sexp with
            | Ok comp -> parse (comp :: acc) rest
            | Error e -> Error e)
        | _ -> parse acc rest)
  in
  parse [] sexps

let has_ignore_marker body =
  List.exists
    (function
      | Sexp.Atom "ignore" -> true
      | Sexp.List [ Sexp.Atom "ignore" ] -> true
      | _ -> false)
    body

let parse_class_override sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "class" :: Sexp.Atom name :: body) ->
      let class_action = if has_ignore_marker body then Some Ignore else None in
      let* constructors = parse_components_of_kind ~entity_name:name ~kind:"constructor" body in
      let* methods = parse_components_of_kind ~entity_name:name ~kind:"method" body in
      let* properties = parse_components_of_kind ~entity_name:name ~kind:"property" body in
      let* signals = parse_components_of_kind ~entity_name:name ~kind:"signal" body in
      Ok
        {
          class_name = name;
          class_action;
          constructors;
          methods;
          properties;
          signals;
        }
  | _ ->
      Error (Invalid_format { location = "class"; message = "Expected (class Name ...)" })

let parse_interface_override sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "interface" :: Sexp.Atom name :: body) ->
      let interface_action = if has_ignore_marker body then Some Ignore else None in
      let* methods = parse_components_of_kind ~entity_name:name ~kind:"method" body in
      let* properties = parse_components_of_kind ~entity_name:name ~kind:"property" body in
      let* signals = parse_components_of_kind ~entity_name:name ~kind:"signal" body in
      Ok
        {
          interface_name = name;
          interface_action;
          methods;
          properties;
          signals;
        }
  | _ ->
      Error
        (Invalid_format { location = "interface"; message = "Expected (interface Name ...)" })

let parse_record_override sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "record" :: Sexp.Atom name :: body) ->
      let record_action = if has_ignore_marker body then Some Ignore else None in
      let* fields = parse_components_of_kind ~entity_name:name ~kind:"field" body in
      let* constructors = parse_components_of_kind ~entity_name:name ~kind:"constructor" body in
      let* methods = parse_components_of_kind ~entity_name:name ~kind:"method" body in
      let* functions = parse_components_of_kind ~entity_name:name ~kind:"function" body in
      Ok
        {
          record_name = name;
          record_action;
          fields;
          constructors;
          methods;
          functions;
        }
  | _ ->
      Error
        (Invalid_format { location = "record"; message = "Expected (record Name ...)" })

let parse_enum_override sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "enumeration" :: Sexp.Atom name :: body) ->
      let enum_action = if has_ignore_marker body then Some Ignore else None in
      let* members = parse_components_of_kind ~entity_name:name ~kind:"member" body in
      let* functions = parse_components_of_kind ~entity_name:name ~kind:"function" body in
      Ok { enum_name = name; enum_action; members; functions }
  | _ ->
      Error
        (Invalid_format
           { location = "enumeration"; message = "Expected (enumeration Name ...)" })

let parse_bitfield_override sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "bitfield" :: Sexp.Atom name :: body) ->
      let bitfield_action = if has_ignore_marker body then Some Ignore else None in
      let* flags = parse_components_of_kind ~entity_name:name ~kind:"member" body in
      Ok { bitfield_name = name; bitfield_action; flags }
  | _ ->
      Error
        (Invalid_format
           { location = "bitfield"; message = "Expected (bitfield Name ...)" })


let extract_library_name body =
  List.find_map
    (function
      | Sexp.List [ Sexp.Atom "library"; Sexp.Atom name ] -> Some name
      | _ -> None)
    body
  |> Option.value ~default:""

(** Process one element of the overrides body.
    For standalone functions: parses directly (no duplicate check).
    For entities: validates kind, checks for duplicates, type-specific parse + accumulate.
    For library declarations: skipped. *)
let process_element ~seen ~errors ~classes ~interfaces ~records ~enums ~bitfields
    ~functions sexp =
  match sexp with
  | Sexp.List [ Sexp.Atom "library"; _ ] -> ()
  | Sexp.List (Sexp.Atom "function" :: Sexp.Atom name :: _) ->
      let key = ("function", name) in
      if Hashtbl.mem seen key then
        errors := Duplicate_entity { kind = "function"; name } :: !errors
      else begin
        Hashtbl.add seen key true;
        match parse_component ~entity_name:"top-level" sexp with
        | Ok f -> functions := f :: !functions
        | Error e -> errors := e :: !errors
      end
  | Sexp.List (Sexp.Atom ("class" | "interface" | "record" | "enumeration"
    | "bitfield" as kind) :: Sexp.Atom name :: _) ->
      let key = (kind, name) in
      if Hashtbl.mem seen key then
        errors := Duplicate_entity { kind; name } :: !errors
      else begin
        Hashtbl.add seen key true;
        match kind with
        | "class" -> (
            match parse_class_override sexp with
            | Ok v -> classes := v :: !classes
            | Error e -> errors := e :: !errors)
        | "interface" -> (
            match parse_interface_override sexp with
            | Ok v -> interfaces := v :: !interfaces
            | Error e -> errors := e :: !errors)
        | "record" -> (
            match parse_record_override sexp with
            | Ok v -> records := v :: !records
            | Error e -> errors := e :: !errors)
        | "enumeration" -> (
            match parse_enum_override sexp with
            | Ok v -> enums := v :: !enums
            | Error e -> errors := e :: !errors)
        | "bitfield" -> (
            match parse_bitfield_override sexp with
            | Ok v -> bitfields := v :: !bitfields
            | Error e -> errors := e :: !errors)
        | _ -> assert false
      end
  | Sexp.List (Sexp.Atom kind :: _) ->
      errors := Unknown_entity_kind kind :: !errors
  | _ ->
      errors :=
        Invalid_format
          { location = "top level"; message = "Malformed entity override" }
        :: !errors

(** Walk all elements in the overrides body, stopping at the first error. *)
let collect_overrides ~seen ~errors ~classes ~interfaces ~records ~enums
    ~bitfields ~functions body =
  List.iter
    (fun sexp ->
      if List.length !errors > 0 then ()
      else
        process_element ~seen ~errors ~classes ~interfaces ~records ~enums
          ~bitfields ~functions sexp)
    body

let parse_overrides_sexp sexp =
  match sexp with
  | Sexp.List (Sexp.Atom "overrides" :: body) ->
      let library_name = extract_library_name body in
      let classes = ref [] in
      let interfaces = ref [] in
      let records = ref [] in
      let enums = ref [] in
      let bitfields = ref [] in
      let functions = ref [] in
      let errors = ref [] in
      let seen = Hashtbl.create 16 in
      collect_overrides ~seen ~errors ~classes ~interfaces ~records ~enums
        ~bitfields ~functions body;
      (match !errors with
      | e :: _ -> Error e
      | [] ->
          Ok
            {
              library_name;
              classes = List.rev !classes;
              interfaces = List.rev !interfaces;
              records = List.rev !records;
              enums = List.rev !enums;
              bitfields = List.rev !bitfields;
              functions = List.rev !functions;
            })
  | _ ->
      Error
        (Invalid_format
           { location = "root"; message = "Expected (overrides ...)" })

let parse_overrides filename =
  try
    let sexp = Sexp.load_sexp filename in
    parse_overrides_sexp sexp
  with
  | Sexplib.Sexp.Parse_error e ->
      Error
        (Invalid_format
           {
             location = filename;
             message = e.err_msg;
           })
  | Failure msg -> Error (Invalid_format { location = filename; message = msg })
  | Sys_error msg -> Error (Invalid_format { location = filename; message = msg })

let parse_overrides_from_string content =
  (* Write to temp file and use load_sexp to reuse the same parsing path *)
  let filename = Filename.temp_file "override" ".sexp" in
  Fun.protect
    ~finally:(fun () -> try Sys.remove filename with _ -> ())
    (fun () ->
      let oc = open_out filename in
      Fun.protect
        ~finally:(fun () -> close_out_noerr oc)
        (fun () -> output_string oc content);
      parse_overrides filename)

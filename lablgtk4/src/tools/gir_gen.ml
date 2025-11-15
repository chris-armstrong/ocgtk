(* GIR-based Event Controller Code Generator for LablGTK4 Phase 3
 *
 * This tool parses Gtk-4.0.gir and generates C FFI bindings and OCaml
 * modules for GTK4 event controllers.
 *
 * Follows patterns from varcc.ml and propcc.ml.
 *)

open Printf
open StdLabels

(* ========================================================================= *)
(* Type Definitions *)
(* ========================================================================= *)

type gir_type = {
  name : string;
  c_type : string;
}

type gir_param = {
  param_name : string;
  param_type : gir_type;
}

type gir_method = {
  method_name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_param list;
  doc : string option;
}

type gir_signal = {
  signal_name : string;
  return_type : gir_type;
  sig_parameters : gir_param list;
  doc : string option;
}

type gir_constructor = {
  ctor_name : string;
  c_identifier : string;
  ctor_doc : string option;
}

type gir_class = {
  class_name : string;
  c_type : string;
  parent : string option;
  constructors : gir_constructor list;
  methods : gir_method list;
  signals : gir_signal list;
  class_doc : string option;
}

(* ========================================================================= *)
(* Type Mappings *)
(* ========================================================================= *)

type type_mapping = {
  ocaml_type : string;
  c_to_ml : string;
  ml_to_c : string;
  needs_copy : bool;
}

let type_mappings = [
  ("guint", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("gint", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("gdouble", {
    ocaml_type = "float";
    c_to_ml = "caml_copy_double";
    ml_to_c = "Double_val";
    needs_copy = true;
  });
  ("gboolean", {
    ocaml_type = "bool";
    c_to_ml = "Val_bool";
    ml_to_c = "Bool_val";
    needs_copy = false;
  });
  ("gchararray", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
  });
  ("GdkModifierType", {
    ocaml_type = "Gdk.modifier_type list";
    c_to_ml = "Val_ModifierType";
    ml_to_c = "ModifierType_val";
    needs_copy = false;
  });
  ("GdkEvent*", {
    ocaml_type = "Gdk.Event.t";
    c_to_ml = "Val_GdkEvent";
    ml_to_c = "GdkEvent_val";
    needs_copy = false;
  });
  ("GtkWidget*", {
    ocaml_type = "Gtk.Widget.t";
    c_to_ml = "Val_GtkWidget";
    ml_to_c = "GtkWidget_val";
    needs_copy = false;
  });
]

let find_type_mapping c_type =
  try
    Some (List.assoc c_type type_mappings)
  with Not_found -> None

(* ========================================================================= *)
(* Utility Functions *)
(* ========================================================================= *)

(* Convert GtkEventControllerKey to event_controller_key *)
let to_snake_case s =
  let b = Buffer.create (String.length s + 10) in
  String.iteri (fun i c ->
    if i > 0 && c >= 'A' && c <= 'Z' then
      Buffer.add_char b '_';
    Buffer.add_char b (Char.lowercase_ascii c)
  ) s;
  Buffer.contents b

(* Extract attribute value from XML tag *)
let extract_attr line attr =
  let pattern = sprintf "%s=\"\\([^\"]*\\)\"" (Str.quote attr) in
  try
    ignore (Str.search_forward (Str.regexp pattern) line 0);
    Some (Str.matched_group 1 line)
  with Not_found -> None

(* Check if line contains pattern *)
let contains line pattern =
  try
    ignore (Str.search_forward (Str.regexp pattern) line 0);
    true
  with Not_found -> false

(* ========================================================================= *)
(* GIR Parser *)
(* ========================================================================= *)

(* Simple line-by-line parser for GIR files *)
let parse_gir_file filename =
  let ic = open_in filename in
  let controllers = ref [] in
  let current_class = ref None in
  let in_class = ref false in
  let current_method = ref None in
  let current_signal = ref None in
  let method_params = ref [] in
  let signal_params = ref [] in

  try
    while true do
      let line = input_line ic in

      (* Detect class start *)
      if contains line "<class name=\"" then begin
        match extract_attr line "name" with
        | Some name when
            name = "EventController" ||
            contains name "EventController" ||
            contains name "Gesture" ->
          let c_type = match extract_attr line "c:type" with
            | Some t -> t
            | None -> "Gtk" ^ name
          in
          let parent = extract_attr line "parent" in
          in_class := true;
          current_class := Some {
            class_name = name;
            c_type = c_type;
            parent = parent;
            constructors = [];
            methods = [];
            signals = [];
            class_doc = None;
          }
        | _ -> in_class := false
      end

      (* Detect class end *)
      else if contains line "</class>" then begin
        (match !current_class with
        | Some cls -> controllers := cls :: !controllers
        | None -> ());
        current_class := None;
        in_class := false
      end

      (* Parse constructor *)
      else if !in_class && contains line "<constructor name=\"" then begin
        match extract_attr line "name", extract_attr line "c:identifier" with
        | Some name, Some c_id ->
          (match !current_class with
          | Some cls ->
            current_class := Some {
              cls with
              constructors = {
                ctor_name = name;
                c_identifier = c_id;
                ctor_doc = None;
              } :: cls.constructors
            }
          | None -> ())
        | _ -> ()
      end

      (* Parse method *)
      else if !in_class && contains line "<method name=\"" then begin
        match extract_attr line "name", extract_attr line "c:identifier" with
        | Some name, Some c_id ->
          method_params := [];
          current_method := Some (name, c_id)
        | _ -> ()
      end

      (* Parse method return type *)
      else if !in_class && !current_method <> None && contains line "<return-value" then begin
        (* Will parse type on next line *)
        ()
      end

      (* Parse signal *)
      else if !in_class && contains line "<glib:signal name=\"" then begin
        match extract_attr line "name" with
        | Some name ->
          signal_params := [];
          current_signal := Some name
        | _ -> ()
      end;

    done;
    []
  with
  | End_of_file ->
    close_in ic;
    List.rev !controllers
  | e ->
    close_in ic;
    raise e

(* ========================================================================= *)
(* C Code Generation *)
(* ========================================================================= *)

let generate_c_header () =
  "/* GENERATED CODE - DO NOT EDIT */\n\
/* Generated from Gtk-4.0.gir for Phase 3 Event Controllers */\n\
\n\
#include <gtk/gtk.h>\n\
#include <caml/mlvalues.h>\n\
#include <caml/memory.h>\n\
#include <caml/alloc.h>\n\
#include <caml/callback.h>\n\
#include <caml/fail.h>\n\
#include \"wrappers.h\"\n\
#include \"ml_gobject.h\"\n\
\n\
/* Event controller type conversion - use direct cast (GObjects) */\n\
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))\n\
#define Val_GtkEventController(obj) ((value)(obj))\n\
\n"

let generate_c_constructor ctor =
  let c_name = ctor.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
  sprintf "\nCAMLprim value %s(value unit)\n\
{\n\
    CAMLparam1(unit);\n\
    GtkEventController *controller = %s();\n\
    CAMLreturn(Val_GtkEventController(controller));\n\
}\n" ml_name c_name

let generate_c_method meth =
  let c_name = meth.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
  let param_count = 1 + List.length meth.parameters in
  let params = "value self" ::
    List.mapi (fun i _ -> sprintf "value arg%d" (i + 1)) meth.parameters in

  (* Build C call *)
  let c_args = "GtkEventController_val(self)" ::
    List.mapi (fun i p ->
      match find_type_mapping p.param_type.c_type with
      | Some mapping -> sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
      | None -> sprintf "arg%d" (i + 1)
    ) meth.parameters in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let (c_call, ret_conv) =
    if ret_type = "void" then
      (sprintf "%s(%s);" c_name (String.concat ", " c_args),
       "CAMLreturn(Val_unit);")
    else
      match find_type_mapping ret_type with
      | Some mapping ->
        (sprintf "%s result = %s(%s);" ret_type c_name (String.concat ", " c_args),
         sprintf "CAMLreturn(%s(result));" mapping.c_to_ml)
      | None ->
        (sprintf "void *result = %s(%s);" c_name (String.concat ", " c_args),
         "CAMLreturn((value)result);")
  in

  sprintf "\nCAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s\n\
    %s\n\
}\n"
    ml_name
    (String.concat ", " params)
    param_count
    (String.concat ", " params)
    c_call
    ret_conv

(* ========================================================================= *)
(* OCaml Code Generation *)
(* ========================================================================= *)

let generate_ml_interface cls =
  let buf = Buffer.create 1024 in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Event controller: %s *)\n\n" cls.class_name;

  (match cls.class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" doc
  | None -> ());

  bprintf buf "type t = EventController.t\n\n";

  (* Constructors *)
  List.iter (fun ctor ->
    bprintf buf "(** Create a new %s *)\n" cls.class_name;
    let c_name = ctor.c_identifier in
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
    bprintf buf "external new_ : unit -> t = \"%s\"\n\n" ml_name;
  ) cls.constructors;

  (* Methods *)
  List.iter (fun meth ->
    (match meth.doc with
    | Some doc -> bprintf buf "(** %s *)\n" doc
    | None -> ());

    let c_name = meth.c_identifier in
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
    let ocaml_name = to_snake_case (
      Str.global_replace (Str.regexp (sprintf "gtk_%s_"
        (to_snake_case cls.class_name))) "" c_name
    ) in

    (* Build OCaml type signature *)
    let param_types = List.map (fun p ->
      match find_type_mapping p.param_type.c_type with
      | Some mapping -> mapping.ocaml_type
      | None -> "unit" (* fallback *)
    ) meth.parameters in

    let ret_type_ocaml =
      if meth.return_type.c_type = "void" then
        "unit"
      else
        match find_type_mapping meth.return_type.c_type with
        | Some mapping -> mapping.ocaml_type
        | None -> "unit"
    in

    let full_type =
      String.concat " -> " (["t"] @ param_types @ [ret_type_ocaml])
    in

    bprintf buf "external %s : %s = \"%s\"\n\n"
      ocaml_name full_type ml_name;
  ) (List.rev cls.methods);

  Buffer.contents buf

(* ========================================================================= *)
(* Main *)
(* ========================================================================= *)

let () =
  if Array.length Sys.argv < 3 then begin
    eprintf "Usage: %s <gir-file> <output-dir>\n" Sys.argv.(0);
    exit 1
  end;

  let gir_file = Sys.argv.(1) in
  let output_dir = Sys.argv.(2) in

  printf "Parsing %s...\n" gir_file;

  let controllers = parse_gir_file gir_file in

  printf "Found %d event controller classes\n" (List.length controllers);

  (* Generate C code *)
  let c_buf = Buffer.create 10240 in
  Buffer.add_string c_buf (generate_c_header ());

  List.iter (fun cls ->
    printf "  - %s\n" cls.class_name;

    (* Constructors *)
    List.iter (fun ctor ->
      Buffer.add_string c_buf (generate_c_constructor ctor)
    ) cls.constructors;

    (* Methods (limit to first 5 for testing) *)
    List.iter (fun meth ->
      Buffer.add_string c_buf (generate_c_method meth)
    ) (List.rev cls.methods |> fun l ->
        if List.length l > 5 then
          let rec take n = function
            | [] -> []
            | x :: xs -> if n > 0 then x :: take (n-1) xs else []
          in take 5 l
        else l);
  ) controllers;

  (* Write C output *)
  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  printf "\nWriting %s...\n" c_file;
  let oc = open_out c_file in
  Buffer.output_buffer oc c_buf;
  close_out oc;

  (* Generate OCaml modules *)
  List.iter (fun cls ->
    let ml_file = Filename.concat output_dir
      (sprintf "%s.mli" (to_snake_case cls.class_name)) in
    printf "Writing %s...\n" ml_file;
    let oc = open_out ml_file in
    output_string oc (generate_ml_interface cls);
    close_out oc;
  ) controllers;

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %s\n" c_file;
  printf "  Generated: %d OCaml interface files\n" (List.length controllers)

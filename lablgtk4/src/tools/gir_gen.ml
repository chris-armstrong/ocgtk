(* GIR-based Code Generator for LablGTK4 Phase 3 & Phase 5
 *
 * This tool parses Gtk-4.0.gir and generates C FFI bindings and OCaml
 * modules for GTK4 event controllers and widgets.
 *
 * Phase 3: Event controllers
 * Phase 5: Widget classes with properties and signals
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

(* Phase 5: Property support *)
type gir_property = {
  prop_name : string;
  prop_type : gir_type;
  readable : bool;
  writable : bool;
  construct_only : bool;
  prop_doc : string option;
}

type gir_class = {
  class_name : string;
  c_type : string;
  parent : string option;
  implements : string list;  (* Phase 5: interface support *)
  constructors : gir_constructor list;
  methods : gir_method list;
  properties : gir_property list;  (* Phase 5: properties *)
  signals : gir_signal list;
  class_doc : string option;
}

(* ========================================================================= *)
(* Generation Modes (Phase 5) *)
(* ========================================================================= *)

type generation_mode =
  | EventControllers  (* Phase 3: Event controllers only *)
  | Widgets           (* Phase 5: Widget classes *)
  | All               (* Both controllers and widgets *)

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
  (* Phase 5: Widget-specific types *)
  ("GtkOrientation", {
    ocaml_type = "Gtk.orientation";
    c_to_ml = "Val_orientation";
    ml_to_c = "Orientation_val";
    needs_copy = false;
  });
  ("GtkAlign", {
    ocaml_type = "Gtk.align";
    c_to_ml = "Val_align";
    ml_to_c = "Align_val";
    needs_copy = false;
  });
  ("GtkJustification", {
    ocaml_type = "Gtk.justification";
    c_to_ml = "Val_justification";
    ml_to_c = "Justification_val";
    needs_copy = false;
  });
  ("PangoWrapMode", {
    ocaml_type = "Pango.wrap_mode";
    c_to_ml = "Val_PangoWrapMode";
    ml_to_c = "PangoWrapMode_val";
    needs_copy = false;
  });
  ("const gchar*", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
  });
  ("utf8", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
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
  for i = 0 to String.length s - 1 do
    let c = String.get s i in
    if i > 0 && c >= 'A' && c <= 'Z' then
      Buffer.add_char b '_';
    Buffer.add_char b (Char.lowercase_ascii c)
  done;
  Buffer.contents b

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  try
    List.assoc ("", name) attrs |> fun x -> Some x
  with Not_found ->
    (* Try with c: namespace *)
    try
      List.assoc ("http://www.gtk.org/introspection/c/1.0", String.sub ~pos:2 ~len:(String.length name - 2) name) attrs |> fun x -> Some x
    with Not_found -> None

(* ========================================================================= *)
(* Filter File Support (Phase 5) *)
(* ========================================================================= *)

(* Read filter file and return set of class names to generate *)
let read_filter_file filename =
  if not (Sys.file_exists filename) then
    []
  else
    let ic = open_in filename in
    let rec read_lines acc =
      try
        let line = input_line ic in
        let trimmed = String.trim line in
        (* Skip empty lines and comments *)
        if trimmed = "" || String.length trimmed > 0 && trimmed.[0] = '#' then
          read_lines acc
        else
          (* Extract class name (first word) *)
          let class_name =
            try
              let space_idx = String.index trimmed ' ' in
              String.sub trimmed ~pos:0 ~len:space_idx
            with Not_found -> trimmed
          in
          read_lines (class_name :: acc)
      with End_of_file ->
        close_in ic;
        List.rev acc
    in
    read_lines []

(* ========================================================================= *)
(* GIR Parser using xmlm *)
(* ========================================================================= *)

let parse_gir_file filename mode filter_classes =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let controllers = ref [] in

  (* Check if class name is an event controller *)
  let is_event_controller name =
    name = "EventController" ||
    (String.length name > 15 && String.sub ~pos:0 ~len:15 name = "EventController") ||
    (String.length name > 7 && String.sub ~pos:0 ~len:7 name = "Gesture")
  in

  (* Check if class should be included based on mode and filter *)
  let should_include_class name =
    match mode with
    | EventControllers -> is_event_controller name
    | Widgets ->
      (match filter_classes with
       | [] -> not (is_event_controller name)  (* No filter = all widgets *)
       | classes -> List.mem name classes)     (* Filter specified *)
    | All ->
      (match filter_classes with
       | [] -> true                             (* No filter = everything *)
       | classes ->
         is_event_controller name || List.mem name classes)
  in

  (* Skip to end of current element *)
  let rec skip_element depth =
    if depth = 0 then ()
    else
      match Xmlm.input input with
      | `El_start _ -> skip_element (depth + 1)
      | `El_end -> skip_element (depth - 1)
      | `Data _ -> skip_element depth
      | `Dtd _ -> skip_element depth
  in

  (* Parse a class element *)
  let rec parse_class attrs =
    match get_attr "name" attrs with
    | Some name when should_include_class name ->
      let c_type = match get_attr "c:type" attrs with
        | Some t -> t
        | None -> "Gtk" ^ name
      in
      let parent = get_attr "parent" attrs in
      let constructors = ref [] in
      let methods = ref [] in

      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
          (match tag with
          | "constructor" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some ctor_name, Some c_id ->
              constructors := {
                ctor_name = ctor_name;
                c_identifier = c_id;
                ctor_doc = None;
              } :: !constructors;
              skip_element 1;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
              let (return_type, params) = parse_method () in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = None;
              } :: !methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | _ ->
            skip_element 1;
            parse_class_contents ())

        | `El_end ->
          ()  (* End of class *)

        | `Data _ ->
          parse_class_contents ()

        | `Dtd _ ->
          parse_class_contents ()
      in

      parse_class_contents ();
      Some {
        class_name = name;
        c_type = c_type;
        parent = parent;
        implements = [];  (* Phase 5: TODO - parse interfaces *)
        constructors = List.rev !constructors;
        methods = List.rev !methods;
        properties = [];  (* Phase 5: TODO - parse properties *)
        signals = [];
        class_doc = None;
      }

    | _ ->
      skip_element 1;
      None

  (* Parse method contents to extract return type and parameters *)
  and parse_method () =
    let return_type = ref { name = "void"; c_type = "void" } in
    let params = ref [] in

    let rec parse_method_contents () =
      match Xmlm.input input with
      | `El_start ((_, tag), _tag_attrs) ->
        (match tag with
        | "return-value" ->
          return_type := parse_return_value ();
          parse_method_contents ()

        | "parameters" ->
          params := parse_parameters ();
          parse_method_contents ()

        | _ ->
          skip_element 1;
          parse_method_contents ())

      | `El_end ->
        ()  (* End of method *)

      | `Data _ ->
        parse_method_contents ()

      | `Dtd _ ->
        parse_method_contents ()
    in

    parse_method_contents ();
    (!return_type, List.rev !params)

  (* Parse return value type *)
  and parse_return_value () =
    let type_info = ref { name = "void"; c_type = "void" } in

    let rec parse_rv_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), attrs) ->
        let type_name = match get_attr "name" attrs with Some n -> n | None -> "void" in
        let c_type_name = match get_attr "c:type" attrs with Some t -> t | None -> type_name in
        type_info := { name = type_name; c_type = c_type_name };
        skip_element 1;
        parse_rv_contents ()

      | `El_start _ ->
        skip_element 1;
        parse_rv_contents ()

      | `El_end ->
        ()

      | `Data _ ->
        parse_rv_contents ()

      | `Dtd _ ->
        parse_rv_contents ()
    in

    parse_rv_contents ();
    !type_info

  (* Parse parameters list *)
  and parse_parameters () =
    let params = ref [] in

    let rec parse_params_contents () =
      match Xmlm.input input with
      | `El_start ((_, "parameter"), attrs) ->
        let param_name = match get_attr "name" attrs with Some n -> n | None -> "arg" in
        let param_type = parse_parameter_type () in
        params := { param_name = param_name; param_type = param_type } :: !params;
        parse_params_contents ()

      | `El_start ((_, "instance-parameter"), _) ->
        skip_element 1;
        parse_params_contents ()

      | `El_start _ ->
        skip_element 1;
        parse_params_contents ()

      | `El_end ->
        ()

      | `Data _ ->
        parse_params_contents ()

      | `Dtd _ ->
        parse_params_contents ()
    in

    parse_params_contents ();
    !params

  (* Parse parameter type *)
  and parse_parameter_type () =
    let type_info = ref { name = "void"; c_type = "void" } in

    let rec parse_param_type_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), attrs) ->
        let type_name = match get_attr "name" attrs with Some n -> n | None -> "void" in
        let c_type_name = match get_attr "c:type" attrs with Some t -> t | None -> type_name in
        type_info := { name = type_name; c_type = c_type_name };
        skip_element 1;
        parse_param_type_contents ()

      | `El_start _ ->
        skip_element 1;
        parse_param_type_contents ()

      | `El_end ->
        ()

      | `Data _ ->
        parse_param_type_contents ()

      | `Dtd _ ->
        parse_param_type_contents ()
    in

    parse_param_type_contents ();
    !type_info
  in

  (* Main parsing loop *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, "class"), attrs) ->
        (match parse_class attrs with
        | Some cls -> controllers := cls :: !controllers
        | None -> ());
        parse_document ()

      | `El_start ((_, tag), _) when tag = "repository" || tag = "namespace" ->
        (* Continue parsing into container elements *)
        parse_document ()

      | `El_start _ ->
        (* Skip non-class, non-container elements *)
        skip_element 1;
        parse_document ()

      | `El_end ->
        parse_document ()

      | `Data _ ->
        parse_document ()

      | `Dtd _ ->
        parse_document ()
  in

  parse_document ();
  close_in ic;
  List.rev !controllers

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

let generate_c_method (meth : gir_method) =
  let c_name = meth.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
  let param_count = 1 + List.length meth.parameters in
  let params = "value self" ::
    List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) meth.parameters in

  (* Build C call *)
  let c_args = "GtkEventController_val(self)" ::
    List.mapi ~f:(fun i p ->
      match find_type_mapping p.param_type.c_type with
      | Some mapping -> sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
      | None -> sprintf "arg%d" (i + 1)
    ) meth.parameters in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let (c_call, ret_conv) =
    if ret_type = "void" then
      (sprintf "%s(%s);" c_name (String.concat ~sep:", " c_args),
       "CAMLreturn(Val_unit);")
    else
      match find_type_mapping ret_type with
      | Some mapping ->
        (sprintf "%s result = %s(%s);" ret_type c_name (String.concat ~sep:", " c_args),
         sprintf "CAMLreturn(%s(result));" mapping.c_to_ml)
      | None ->
        (sprintf "void *result = %s(%s);" c_name (String.concat ~sep:", " c_args),
         "CAMLreturn((value)result);")
  in

  sprintf "\nCAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s\n\
    %s\n\
}\n"
    ml_name
    (String.concat ~sep:", " params)
    param_count
    (String.concat ~sep:", " params)
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
  List.iter ~f:(fun ctor ->
    bprintf buf "(** Create a new %s *)\n" cls.class_name;
    let c_name = ctor.c_identifier in
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
    bprintf buf "external new_ : unit -> t = \"%s\"\n\n" ml_name;
  ) cls.constructors;

  (* Methods *)
  List.iter ~f:(fun (meth : gir_method) ->
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
    let param_types = List.map ~f:(fun p ->
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
      String.concat ~sep:" -> " (["t"] @ param_types @ [ret_type_ocaml])
    in

    bprintf buf "external %s : %s = \"%s\"\n\n"
      ocaml_name full_type ml_name;
  ) (List.rev cls.methods);

  Buffer.contents buf

(* ========================================================================= *)
(* Main *)
(* ========================================================================= *)

let () =
  (* Phase 5: Enhanced command-line parsing *)
  let gir_file = ref "" in
  let output_dir = ref "." in
  let mode = ref EventControllers in
  let filter_file = ref None in

  let usage = sprintf "Usage: %s [options] <gir-file> <output-dir>\n\
    \nOptions:\n\
    \  -mode <controllers|widgets|all>  Generation mode (default: controllers)\n\
    \  -filter <file>                   Filter file for widget selection\n"
    Sys.argv.(0) in

  let rec parse_args i =
    if i >= Array.length Sys.argv then ()
    else
      match Sys.argv.(i) with
      | "-mode" ->
        if i + 1 < Array.length Sys.argv then begin
          (match Sys.argv.(i + 1) with
          | "controllers" -> mode := EventControllers
          | "widgets" -> mode := Widgets
          | "all" -> mode := All
          | m -> eprintf "Unknown mode: %s\n" m; exit 1);
          parse_args (i + 2)
        end else begin
          eprintf "Missing argument for -mode\n"; exit 1
        end
      | "-filter" ->
        if i + 1 < Array.length Sys.argv then begin
          filter_file := Some Sys.argv.(i + 1);
          parse_args (i + 2)
        end else begin
          eprintf "Missing argument for -filter\n"; exit 1
        end
      | arg when arg.[0] <> '-' ->
        if !gir_file = "" then begin
          gir_file := arg;
          parse_args (i + 1)
        end else if !output_dir = "." then begin
          output_dir := arg;
          parse_args (i + 1)
        end else begin
          eprintf "Too many arguments\n"; exit 1
        end
      | arg ->
        eprintf "Unknown option: %s\n" arg; exit 1
  in

  parse_args 1;

  if !gir_file = "" then begin
    eprintf "%s" usage;
    exit 1
  end;

  printf "Parsing %s (mode: %s)...\n" !gir_file
    (match !mode with
     | EventControllers -> "controllers"
     | Widgets -> "widgets"
     | All -> "all");

  (* Read filter file if specified *)
  let filter_classes = match !filter_file with
    | Some f ->
      printf "Reading filter file: %s\n" f;
      let classes = read_filter_file f in
      printf "Filter includes %d classes\n" (List.length classes);
      classes
    | None -> []
  in

  let controllers = parse_gir_file !gir_file !mode filter_classes in

  let class_type_name = match !mode with
    | EventControllers -> "event controller"
    | Widgets -> "widget"
    | All -> "controller/widget"
  in
  printf "Found %d %s classes\n" (List.length controllers) class_type_name;

  (* Generate C code *)
  let c_buf = Buffer.create 10240 in
  Buffer.add_string c_buf (generate_c_header ());

  List.iter ~f:(fun cls ->
    printf "  - %s\n" cls.class_name;

    (* Constructors *)
    List.iter ~f:(fun ctor ->
      Buffer.add_string c_buf (generate_c_constructor ctor)
    ) cls.constructors;

    (* Methods (limit to first 5 for testing) *)
    List.iter ~f:(fun meth ->
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
  let c_file = Filename.concat !output_dir "ml_event_controllers_gen.c" in
  printf "\nWriting %s...\n" c_file;
  let oc = open_out c_file in
  Buffer.output_buffer oc c_buf;
  close_out oc;

  (* Generate OCaml modules *)
  List.iter ~f:(fun cls ->
    let ml_file = Filename.concat !output_dir
      (sprintf "%s.mli" (to_snake_case cls.class_name)) in
    printf "Writing %s...\n" ml_file;
    let oc = open_out ml_file in
    output_string oc (generate_ml_interface cls);
    close_out oc;
  ) controllers;

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %s\n" c_file;
  printf "  Generated: %d OCaml interface files\n" (List.length controllers)

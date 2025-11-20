[@@@warning "-27"]
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
open Cmdliner

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
  nullable : bool;  (* Phase 5.3: Support nullable parameters *)
  varargs: bool;
}

type gir_method = {
  method_name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_param list;
  doc : string option;
  throws: bool;
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
  ctor_parameters : gir_param list;  (* Added: constructor parameters *)
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

(* Enum support *)
type gir_enum_member = {
  member_name : string;
  member_value : int;
  c_identifier : string;
  member_doc : string option;
}

type gir_enum = {
  enum_name : string;
  enum_c_type : string;
  members : gir_enum_member list;
  enum_doc : string option;
}

(* Bitfield/Flags support *)
type gir_bitfield_member = {
  flag_name : string;
  flag_value : int;
  flag_c_identifier : string;
  flag_doc : string option;
}

type gir_bitfield = {
  bitfield_name : string;
  bitfield_c_type : string;
  flags : gir_bitfield_member list;
  bitfield_doc : string option;
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

type gir_interface = {
  interface_name : string;
  c_type : string;
  c_symbol_prefix : string;
  methods: gir_method list;
  properties: gir_property list;
  signals: gir_signal list;
  interface_doc: string option;
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
  (* Bug fix #2: Add "double" mapping for c:type="double" in GIR *)
  ("double", {
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
  (* GdkModifierType is now generated from Gdk-4.0.gir *)
  ("GdkEvent*", {
    ocaml_type = "_ Gdk.event";
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
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("PangoWrapMode", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("const gchar*", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
  });
  (* Bug fix: Add "gchar*" mapping for properties like placeholder-text *)
  ("gchar*", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
  });
  (* Bug fix: Add "utf8" mapping for GIR type name *)
  ("utf8", {
    ocaml_type = "string";
    c_to_ml = "caml_copy_string";
    ml_to_c = "String_val";
    needs_copy = true;
  });
  ("const char*", {
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
  (* Enum types - map to int for now *)
  ("GtkInputPurpose", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkInputHints", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkImageType", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkArrowType", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkSpinButtonUpdatePolicy", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkIconSize", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("GtkNaturalWrapMode", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  ("PangoEllipsizeMode", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  (* Primitive types *)
  ("gfloat", {
    ocaml_type = "float";
    c_to_ml = "caml_copy_double";
    ml_to_c = "Double_val";
    needs_copy = true;
  });
  (* Bug fix #2: Ensure both gfloat and float are mapped *)
  ("float", {
    ocaml_type = "float";
    c_to_ml = "caml_copy_double";
    ml_to_c = "Double_val";
    needs_copy = true;
  });
  (* Bug fix #2: Add int mapping for c:type="int" in GIR *)
  ("int", {
    ocaml_type = "int";
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  (* GdkEvent - pointer type *)
  ("GdkEvent*", {
    ocaml_type = "_ Gdk.event";
    c_to_ml = "Val_GdkEvent";
    ml_to_c = "GdkEvent_val";
    needs_copy = false;
  });
  (* GtkWrapMode - enum, use int for now *)
  ("GtkWrapMode", {
    ocaml_type = "int"; (* TODO: Should be proper enum type *)
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
  (* GtkTextWindowType - enum, use int for now *)
  ("GtkTextWindowType", {
    ocaml_type = "int"; (* TODO: Should be proper enum type *)
    c_to_ml = "Val_int";
    ml_to_c = "Int_val";
    needs_copy = false;
  });
]

(* Phase 5.3: Blacklist for variadic functions (can't be auto-generated) *)
let variadic_function_blacklist = [
  "gtk_text_buffer_insert_with_tags";
  "gtk_text_buffer_insert_with_tags_by_name";
  "gtk_text_buffer_create_tag";
  (* Add more variadic functions as discovered *)
]

let is_variadic_function c_identifier =
  List.mem c_identifier ~set:variadic_function_blacklist

(* Bug fix #4: Blacklist for types requiring platform-specific headers *)
let platform_specific_type_blacklist = [
  "PrintCapabilities";  (* Requires unix-print headers *)
  "PageSetup";          (* Print-related *)
  "PrintSettings";      (* Print-related *)
  "PrintContext";       (* Print-related *)
  "PrintOperation";     (* Print-related *)
  "License";            (* Has invalid identifier 0BSD *)
]

let is_platform_specific_type type_name =
  List.mem type_name ~set:platform_specific_type_blacklist

(* Phase 5.3: OCaml C FFI limitation - max 5 parameters *)
(* let max_caml_params = 5 *)

(* Extract namespace from C type name (e.g., "GtkAlign" -> "Gtk", "GdkGravity" -> "Gdk") *)
let extract_namespace_from_c_type c_type =
  (* Known namespace prefixes *)
  let prefixes = ["Gtk"; "Gdk"; "Pango"; "Gio"; "GLib"; "GObject"; "Graphene"; "GdkPixbuf"; "Gsk"] in
  List.find_opt ~f:(fun prefix ->
    String.length c_type >= String.length prefix &&
    String.sub c_type ~pos:0 ~len:(String.length prefix) = prefix
  ) prefixes

(* Bug fix #5: Try to find type mapping using both c_type and GIR name *)
let find_type_mapping_for_gir_type ?(enums=[]) ?(bitfields=[]) (gir_type : gir_type) =
  let try_lookup lookup_str =
    (* First, check if this is a known enum *)
    let enum_mapping =
      List.find_opt ~f:(fun (e : gir_enum) -> e.enum_c_type = lookup_str) enums in
    match enum_mapping with
    | Some enum ->
      (* Extract namespace from C type to prefix converter functions *)
      let namespace = Option.value (extract_namespace_from_c_type enum.enum_c_type) ~default:"" in
      Some {
        ocaml_type = String.lowercase_ascii enum.enum_name;
        c_to_ml = sprintf "Val_%s%s" namespace enum.enum_name;
        ml_to_c = sprintf "%s%s_val" namespace enum.enum_name;
        needs_copy = false;
      }
    | None ->
      (* Check if this is a known bitfield *)
      let bitfield_mapping =
        List.find_opt ~f:(fun (b : gir_bitfield) -> b.bitfield_c_type = lookup_str) bitfields in
      (match bitfield_mapping with
      | Some bitfield ->
        (* Extract namespace from C type to prefix converter functions *)
        let namespace = Option.value (extract_namespace_from_c_type bitfield.bitfield_c_type) ~default:"" in
        Some {
          ocaml_type = String.lowercase_ascii bitfield.bitfield_name;
          c_to_ml = sprintf "Val_%s%s" namespace bitfield.bitfield_name;
          ml_to_c = sprintf "%s%s_val" namespace bitfield.bitfield_name;
          needs_copy = false;
        }
      | None ->
        (* Fall back to hardcoded type mappings *)
        try
          Some (List.assoc lookup_str type_mappings)
        with Not_found ->
          (* Phase 5.3: Handle any Gtk widget pointer type generically *)
          if String.length lookup_str > 3 &&
             String.sub lookup_str ~pos:0 ~len:3 = "Gtk" &&
             String.sub lookup_str ~pos:(String.length lookup_str - 1) ~len:1 = "*" then
            Some {
              ocaml_type = "Gtk.Widget.t";
              c_to_ml = "Val_GtkWidget";
              ml_to_c = "GtkWidget_val";
              needs_copy = false;
            }
          else
            None)
  in
  (* Try c_type first, then GIR name if c_type fails *)
  match try_lookup gir_type.c_type with
  | Some mapping -> Some mapping
  | None -> try_lookup gir_type.name

(* Keep old function signature for compatibility *)
let find_type_mapping ?(enums=[]) ?(bitfields=[]) c_type =
  find_type_mapping_for_gir_type ~enums ~bitfields { name = c_type; c_type = c_type }

(* Bug fix #3: Add module qualification based on GIR namespace *)
let qualify_ocaml_type ?(gir_type_name=None) ocaml_type =
  (* Check if type is already qualified (contains a dot) *)
  if String.contains ocaml_type '.' then
    ocaml_type
  else
    (* Extract namespace from GIR type name (e.g., "Pango.EllipsizeMode" -> "Pango") *)
    let namespace = match gir_type_name with
      | Some name when String.contains name '.' ->
        let dot_pos = String.index name '.' in
        Some (String.sub ~pos:0 ~len:dot_pos name)
      | _ -> None
    in

    (* Qualify based on namespace *)
    match namespace with
    | Some "Pango" -> sprintf "Pango.%s" ocaml_type
    | Some "Gdk" -> sprintf "Gdk.%s" ocaml_type
    | Some "Gtk" ->
      (* Check if it's a core Gtk type or an enum *)
      let gtk_core_types = [
        "orientation"; "align"; "baseline_position"; "position_type";
        "size_request_mode"; "state_flags";
      ] in
      if List.mem ocaml_type ~set:gtk_core_types then
        sprintf "Gtk.%s" ocaml_type
      else
        sprintf "Gtk_enums.%s" ocaml_type  (* Gtk enums in Gtk_enums module *)
    | _ ->
      (* No namespace - don't qualify built-in OCaml types *)
      let builtin_types = [
        "unit"; "bool"; "int"; "float"; "string"; "char";
        "list"; "array"; "option"; "result";
      ] in
      if List.mem ocaml_type ~set:builtin_types then
        ocaml_type  (* Don't qualify built-in types *)
      else if String.contains ocaml_type '.' then
        ocaml_type  (* Already qualified *)
      else
        sprintf "Gtk_enums.%s" ocaml_type  (* Likely a Gtk enum without namespace *)

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

let parse_bool ?(default = false) attr =
  match attr with
  | Some "true" | Some "1"-> true
  | Some "false" | Some "0"-> false
  | Some "" -> default
  | Some x -> failwith (sprintf "Invalid boolean attribute value: %s" x)
  | None -> default

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

(* Parse only enums and bitfields from a GIR file (for external namespaces) *)
let parse_gir_enums_only filename =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let enums = ref [] in
  let bitfields = ref [] in

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

  (* Parse enumeration element - same as in parse_gir_file *)
  let parse_enumeration attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let members = ref [] in

        let rec parse_enum_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some member_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              members := {
                member_name = member_name;
                member_value = value;
                c_identifier = c_id;
                member_doc = None;
              } :: !members;
              skip_element 1;
              parse_enum_contents ()
            | _ ->
              skip_element 1;
              parse_enum_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_enum_contents ()

          | `El_end -> ()
          | `Data _ -> parse_enum_contents ()
          | `Dtd _ -> parse_enum_contents ()
        in

        parse_enum_contents ();
        Some {
          enum_name = name;
          enum_c_type = c_type;
          members = List.rev !members;
          enum_doc = None;
        }
      end
    | _ ->
      skip_element 1;
      None
  in

  (* Parse bitfield element - same as in parse_gir_file *)
  let parse_bitfield attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let flags = ref [] in

        let rec parse_bitfield_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some flag_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              flags := {
                flag_name = flag_name;
                flag_value = value;
                flag_c_identifier = c_id;
                flag_doc = None;
              } :: !flags;
              skip_element 1;
              parse_bitfield_contents ()
            | _ ->
              skip_element 1;
              parse_bitfield_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_bitfield_contents ()

          | `El_end -> ()
          | `Data _ -> parse_bitfield_contents ()
          | `Dtd _ -> parse_bitfield_contents ()
        in

        parse_bitfield_contents ();
        Some {
          bitfield_name = name;
          bitfield_c_type = c_type;
          flags = List.rev !flags;
          bitfield_doc = None;
        }
      end
    | _ ->
      skip_element 1;
      None
  in

  (* Main parsing loop - only look for enums and bitfields *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, "enumeration"), attrs) ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, "bitfield"), attrs) ->
        (match parse_bitfield attrs with
        | Some bitfield -> bitfields := bitfield :: !bitfields
        | None -> ());
        parse_document ()

      | `El_start ((_, tag), _) when tag = "repository" || tag = "namespace" ->
        parse_document ()

      | `El_start _ ->
        skip_element 1;
        parse_document ()

      | `El_end -> parse_document ()
      | `Data _ -> parse_document ()
      | `Dtd _ -> parse_document ()
  in

  parse_document ();
  close_in ic;
  (List.rev !enums, List.rev !bitfields)

let parse_gir_file filename mode filter_classes =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let controllers = ref [] in
  let interfaces : gir_interface list ref = ref [] in
  let enums = ref [] in
  let bitfields = ref [] in

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
       | classes -> List.mem name ~set:classes)     (* Filter specified *)
    | All ->
      (match filter_classes with
       | [] -> true                             (* No filter = everything *)
       | classes ->
         is_event_controller name || List.mem name ~set:classes)
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
      let properties = ref [] in

      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
          (match tag with
          | "constructor" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some ctor_name, Some c_id ->
              let (_return_type, params) = parse_method () in
              constructors := {
                ctor_name = ctor_name;
                c_identifier = c_id;
                ctor_parameters = params;
                ctor_doc = None;
              } :: !constructors;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
              let  throws = get_attr "throws" tag_attrs |> parse_bool in
              let (return_type, params) = parse_method () in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = None;
                throws = throws;
              } :: !methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "property" ->
            (match get_attr "name" tag_attrs with
            | Some prop_name ->
              let prop = parse_property prop_name tag_attrs in
              properties := prop :: !properties;
              parse_class_contents ()
            | None ->
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
        properties = List.rev !properties;
        signals = [];
        class_doc = None;
      }

    | _ ->
      skip_element 1;
      None

  (* Parse property element *)
  and parse_property prop_name attrs =
    let writable = match get_attr "writable" attrs with
      | Some "1" -> true
      | _ -> false
    in
    let construct_only = match get_attr "construct-only" attrs with
      | Some "1" -> true
      | _ -> false
    in

    (* Parse property type from child element *)
    let prop_type = ref { name = "unknown"; c_type = "unknown" } in

    let rec parse_prop_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), type_attrs) ->
        let type_name = match get_attr "name" type_attrs with Some n -> n | None -> "unknown" in
        let c_type_name = match get_attr "c:type" type_attrs with Some t -> t | None -> type_name in
        prop_type := { name = type_name; c_type = c_type_name };
        skip_element 1;
        parse_prop_contents ()
      | `El_start _ ->
        skip_element 1;
        parse_prop_contents ()
      | `El_end ->
        ()
      | `Data _ ->
        parse_prop_contents ()
      | `Dtd _ ->
        parse_prop_contents ()
    in

    parse_prop_contents ();
    {
      prop_name = prop_name;
      prop_type = !prop_type;
      readable = true;  (* Assume readable unless writable=0 and no getter *)
      writable = writable;
      construct_only = construct_only;
      prop_doc = None;
    }

  (* Parse enumeration element *)
  and parse_enumeration attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      (* Bug fix #4: Skip platform-specific types *)
      if is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let members = ref [] in

        let rec parse_enum_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some member_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              members := {
                member_name = member_name;
                member_value = value;
                c_identifier = c_id;
                member_doc = None;
              } :: !members;
              skip_element 1;
              parse_enum_contents ()
            | _ ->
              skip_element 1;
              parse_enum_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_enum_contents ()

          | `El_end ->
            ()  (* End of enumeration *)

          | `Data _ ->
            parse_enum_contents ()

          | `Dtd _ ->
            parse_enum_contents ()
        in

        parse_enum_contents ();
        Some {
          enum_name = name;
          enum_c_type = c_type;
          members = List.rev !members;
          enum_doc = None;
        }
      end

    | _ ->
      skip_element 1;
      None

  (* Parse bitfield element *)
  and parse_bitfield attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      (* Bug fix #4: Skip platform-specific types *)
      if is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let flags = ref [] in

        let rec parse_bitfield_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some flag_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              flags := {
                flag_name = flag_name;
                flag_value = value;
                flag_c_identifier = c_id;
                flag_doc = None;
              } :: !flags;
              skip_element 1;
              parse_bitfield_contents ()
            | _ ->
              skip_element 1;
              parse_bitfield_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_bitfield_contents ()

          | `El_end ->
            ()  (* End of bitfield *)

          | `Data _ ->
            parse_bitfield_contents ()

          | `Dtd _ ->
            parse_bitfield_contents ()
        in

        parse_bitfield_contents ();
        Some {
          bitfield_name = name;
          bitfield_c_type = c_type;
          flags = List.rev !flags;
          bitfield_doc = None;
        }
      end

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
        let nullable = match get_attr "nullable" attrs with Some "1" -> true | _ -> false in
        let varargs = ref false in
        let type_ = ref { name = "void"; c_type = "void"} in
        let rec parse_param_contents () =
          match Xmlm.input input with
          | `El_start ((_, "varargs"), attrs) ->
            varargs := true;
            skip_element 1;
            parse_param_contents ()
          | `El_start ((_, "type"), attrs) ->
            let type_name = match get_attr "name" attrs with Some n -> n | None -> "void" in
            let c_type_name = match get_attr "c:type" attrs with Some t -> t | None -> type_name in
            type_ := { name = type_name; c_type = c_type_name };
            skip_element 1;
            parse_param_contents ()
          | `El_start _ ->
            skip_element 1;
            parse_param_contents ()
          | `El_end -> (!type_, !varargs)
          | `Data _ | `Dtd _ ->
            parse_param_contents ()
        in
        let (param_type, varargs) = parse_param_contents () in
        params := { param_name = param_name; param_type = param_type; nullable = nullable ; varargs = varargs} :: !params;
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

  and parse_interface attrs () =
    let name  = get_attr "name" attrs  |> Option.get in
    let c_type = match get_attr "c:type" attrs with
      | Some t -> t
      | None -> "Gtk" ^ name
    in
    (* let parent = get_attr "parent" attrs in *)
    let methods = ref [] in
    let properties = ref [] in
      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
          (match tag with

          | "method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
                let  throws = get_attr "throws" tag_attrs |> parse_bool in
              let (return_type, params) = parse_method () in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = None;
                throws = throws;
              } :: !methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "property" ->
            (match get_attr "name" tag_attrs with
            | Some prop_name ->
              let prop = parse_property prop_name tag_attrs in
              properties := prop :: !properties;
              parse_class_contents ()
            | None ->
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
    Some { interface_name = name; c_type = c_type; c_symbol_prefix = name; methods = List.rev !methods; properties = List.rev !properties; signals = []; interface_doc = None }
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

      | `El_start ((_, "interface"), attrs) ->
        (match parse_interface attrs () with
        | Some cls -> interfaces := cls :: !interfaces
        | None -> ());
        parse_document ()

      | `El_start ((_, "enumeration"), attrs) ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, "bitfield"), attrs) ->
        (match parse_bitfield attrs with
        | Some bitfield -> bitfields := bitfield :: !bitfields
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
  (List.rev !controllers, List.rev !interfaces, List.rev !enums, List.rev !bitfields)

(* ========================================================================= *)
(* C Code Generation *)
(* ========================================================================= *)

let generate_c_header ?(external_enums=[]) ?(external_bitfields=[]) () =
  let buf = Buffer.create 1024 in
  Buffer.add_string buf "/* GENERATED CODE - DO NOT EDIT */\n";
  Buffer.add_string buf "/* Generated from Gtk-4.0.gir */\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "#include <gtk/gtk.h>\n";
  Buffer.add_string buf "#include <caml/mlvalues.h>\n";
  Buffer.add_string buf "#include <caml/memory.h>\n";
  Buffer.add_string buf "#include <caml/alloc.h>\n";
  Buffer.add_string buf "#include <caml/callback.h>\n";
  Buffer.add_string buf "#include <caml/fail.h>\n";
  Buffer.add_string buf "#include \"wrappers.h\"\n";
  Buffer.add_string buf "#include \"ml_gobject.h\"\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Type conversions - use direct cast (GObjects) */\n";
  Buffer.add_string buf "#define GtkEventController_val(val) ((GtkEventController*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GtkEventController(obj) ((value)(val_of_ext(obj)))\n";
  Buffer.add_string buf "/* Note: GtkWidget_val and Val_GtkWidget are defined in wrappers.h */\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Phase 5.3: Option type conversions for nullable parameters */\n";
  Buffer.add_string buf "#define GtkWidget_option_val(v) ((v) == Val_none ? NULL : GtkWidget_val(Some_val(v)))\n";
  Buffer.add_string buf "#define GtkEventController_option_val(v) ((v) == Val_none ? NULL : GtkEventController_val(Some_val(v)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* GdkEvent conversions - from ml_event_controller.c */\n";
  Buffer.add_string buf "#define GdkEvent_val(val) ((GdkEvent*)ext_of_val(val))\n";
  Buffer.add_string buf "#define Val_GdkEvent(obj) ((value)(val_of_ext(obj)))\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf "/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */\n";
  Buffer.add_string buf "\n";

  (* Add forward declarations for external namespace enum/bitfield converters *)
  if List.length external_enums > 0 || List.length external_bitfields > 0 then begin
    Buffer.add_string buf "/* Forward declarations for external namespace enum/bitfield converters */\n";
    List.iter ~f:(fun (ns, enum : string * gir_enum) ->
      bprintf buf "value Val_%s%s(%s val);\n" ns enum.enum_name enum.enum_c_type;
      bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type ns enum.enum_name;
    ) external_enums;
    List.iter ~f:(fun (ns, bitfield : string * gir_bitfield) ->
      bprintf buf "value Val_%s%s(%s flags);\n" ns bitfield.bitfield_name bitfield.bitfield_c_type;
      bprintf buf "%s %s%s_val(value list);\n" bitfield.bitfield_c_type ns bitfield.bitfield_name;
    ) external_bitfields;
    Buffer.add_string buf "\n";
  end;

  Buffer.contents buf

let generate_c_constructor ~enums ~bitfields (ctor : gir_constructor) class_name =
  let c_name = ctor.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in

  (* Determine widget or controller cast *)
  let is_widget = not (
    class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  ) in

  let (val_macro, c_type_name, var_name) =
    if is_widget then
      ("Val_GtkWidget", "GtkWidget", "widget")
    else
      ("Val_GtkEventController", "GtkEventController", "controller")
  in

  (* Generate parameters *)
  let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
  let params =
    if List.length ctor.ctor_parameters = 0 then
      ["value unit"]
    else
      List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) ctor.ctor_parameters
  in
  let param_names =
    if List.length ctor.ctor_parameters = 0 then
      ["unit"]
    else
      List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) ctor.ctor_parameters
  in

  (* Build C call arguments - handle nullable parameters *)
  let c_args =
    List.mapi ~f:(fun i p ->
      match find_type_mapping ~enums ~bitfields p.param_type.c_type with
      | Some mapping ->
        if p.nullable then
          (* For nullable parameters, use option conversion macro *)
          if p.param_type.c_type = "GtkWidget*" then
            sprintf "GtkWidget_option_val(arg%d)" (i + 1)
          else if String.length p.param_type.c_type > 3 &&
                  String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*" then
            (* Generic pointer type - check for NULL *)
            sprintf "(Is_some(arg%d) ? %s(Some_val(arg%d)) : NULL)" (i + 1) mapping.ml_to_c (i + 1)
          else
            sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
        else
          sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
      | None -> sprintf "arg%d" (i + 1)
    ) ctor.ctor_parameters
  in

  (* Bug fix #1: Handle >5 parameters with bytecode/native variants *)
  if param_count > 5 then begin
    (* Split param_names into first 5 and rest *)
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    (* Native code variant - individual parameters *)
    let native_func = sprintf "\nCAMLexport CAMLprim value %s_native(%s)\n\
{\n\
    CAMLparam5(%s);\n\
    CAMLxparam%d(%s);\n\
    %s *%s = %s(%s);\n\
    CAMLreturn(%s(%s));\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      (String.concat ~sep:", " first_five)
      (param_count - 5)
      (String.concat ~sep:", " rest)
      c_type_name var_name c_name (String.concat ~sep:", " c_args)
      val_macro var_name
    in

    (* Bytecode variant - array of values *)
    let bytecode_func = sprintf "\nCAMLexport CAMLprim value %s_bytecode(value * argv, int argn)\n\
{\n\
    return %s_native(%s);\n\
}\n"
      ml_name
      ml_name
      (String.concat ~sep:", " (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
    in

    native_func ^ bytecode_func
  end else begin
    (* Standard single function for <=5 parameters *)
    sprintf "\nCAMLexport CAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s *%s = %s(%s);\n\
    CAMLreturn(%s(%s));\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      c_type_name var_name c_name (String.concat ~sep:", " c_args)
      val_macro var_name
  end

let generate_c_method ~enums ~bitfields (meth : gir_method) class_name =
  let c_name = meth.c_identifier in
  let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
  let param_count = 1 + List.length meth.parameters in
  let params = "value self" ::
    List.mapi ~f:(fun i _ -> sprintf "value arg%d" (i + 1)) meth.parameters in
  let param_names = "self" ::
    List.mapi ~f:(fun i _ -> sprintf "arg%d" (i + 1)) meth.parameters in

  (* Determine widget or controller cast *)
  let is_widget = not (
    class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  ) in

  let self_cast =
    if is_widget then "GtkWidget_val(self)" else "GtkEventController_val(self)"
  in

  (* Build C call - handle nullable parameters *)
  let c_args = self_cast ::
    List.mapi ~f:(fun i p ->
      match find_type_mapping ~enums ~bitfields p.param_type.c_type with
      | Some mapping ->
        if p.nullable then
          (* For nullable parameters, use option conversion *)
          if p.param_type.c_type = "GtkWidget*" then
            sprintf "GtkWidget_option_val(arg%d)" (i + 1)
          else if p.param_type.c_type = "GtkCheckButton*" then
            sprintf "(Is_some(arg%d) ? GtkWidget_val(Some_val(arg%d)) : NULL)" (i + 1) (i + 1)
          else if String.length p.param_type.c_type > 3 &&
                  String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*" then
            (* Generic pointer type - check for NULL *)
            sprintf "(Is_some(arg%d) ? %s(Some_val(arg%d)) : NULL)" (i + 1) mapping.ml_to_c (i + 1)
          else
            sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
        else
          sprintf "%s(arg%d)" mapping.ml_to_c (i + 1)
      | None -> sprintf "arg%d" (i + 1)
    ) meth.parameters in

  (* Build return conversion *)
  let ret_type = meth.return_type.c_type in
  let locals = if meth.throws then
    sprintf "GError *error = NULL;\n"
  else "" in
  let (c_call, ret_conv) =
    let args = (String.concat ~sep:", " c_args) ^ (if meth.throws then ", &error" else "") in
    
    if ret_type = "void" then
      (sprintf "%s(%s);" c_name args,
       if meth.throws then 
         "if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));"
         else "CAMLreturn(Val_unit);")
    else
      match find_type_mapping ~enums ~bitfields ret_type with
      | Some mapping ->
        (sprintf "%s result = %s(%s);" ret_type c_name args,
         if meth.throws then 
            sprintf "if (error == NULL) CAMLreturn(Res_Ok(%s(result))); else CAMLreturn(Res_Error(Val_GError(error)));" mapping.c_to_ml
         else sprintf "CAMLreturn(%s(result));" mapping.c_to_ml)
      | None ->
        (sprintf "void *result = %s(%s);" c_name args,
         if meth.throws then 
           "if (error == NULL) CAMLreturn(Res_Ok((value)result)); else CAMLreturn(Res_Error(Val_GError(error)));"
         else "CAMLreturn((value)result);")
  in

  (* For functions with >5 parameters, generate both bytecode and native variants *)
  if param_count > 5 then
    (* Split param_names into first 5 and rest *)
    let first_five = List.filteri ~f:(fun i _ -> i < 5) param_names in
    let rest = List.filteri ~f:(fun i _ -> i >= 5) param_names in

    (* Native code variant - individual parameters *)
    let native_func = sprintf "\nCAMLexport CAMLprim value %s_native(%s)\n\
{\n\
    CAMLparam5(%s);\n\
    CAMLxparam%d(%s);\n\
    %s\n
    %s\n\
    %s\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      (String.concat ~sep:", " first_five)
      (param_count - 5)
      (String.concat ~sep:", " rest)
      locals
      c_call
      ret_conv
    in

    (* Bytecode variant - array of values *)
    let bytecode_func = sprintf "\nCAMLexport CAMLprim value %s_bytecode(value * argv, int argn)\n\
{\n\
    return %s_native(%s);\n\
}\n"
      ml_name
      ml_name
      (String.concat ~sep:", " (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
    in

    native_func ^ bytecode_func
  else
    (* Standard single function for <=5 parameters *)
    sprintf "\nCAMLexport CAMLprim value %s(%s)\n\
{\n\
    CAMLparam%d(%s);\n\
    %s\n
    %s\n\
    %s\n\
}\n"
      ml_name
      (String.concat ~sep:", " params)
      param_count
      (String.concat ~sep:", " param_names)
      locals
      c_call
      ret_conv

(* Phase 5.2: Generate C code for property getter *)
let generate_c_property_getter ~enums ~bitfields (prop : gir_property) class_name =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = to_snake_case prop_name_cleaned in
  let class_snake = to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_get_%s" class_snake prop_snake in

  (* Determine property type mapping *)
  let type_info = match find_type_mapping ~enums ~bitfields prop.prop_type.c_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
      }
  in

  (* Determine widget or controller cast *)
  let is_widget = not (
   class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  ) in

  let (c_cast, c_type_name) =
    if is_widget then
      ("GtkWidget_val", "GtkWidget")
    else
      ("GtkEventController_val", "GtkEventController")
  in

  sprintf "\nCAMLexport CAMLprim value %s(value self)\n\
{\n\
    CAMLparam1(self);\n\
    CAMLlocal1(result);\n\
    %s *obj = (%s *)%s(self);\n\
    %s prop_value;\n\
    g_object_get(G_OBJECT(obj), \"%s\", &prop_value, NULL);\n\
    result = %s(prop_value);\n\
    CAMLreturn(result);\n\
}\n"
    ml_name
    c_type_name c_type_name c_cast
    prop.prop_type.c_type
    prop.prop_name
    type_info.c_to_ml

(* Phase 5.2: Generate C code for property setter *)
let generate_c_property_setter ~enums ~bitfields (prop : gir_property) class_name =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = to_snake_case prop_name_cleaned in
  let class_snake = to_snake_case class_name in
  let ml_name = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in

  (* Determine property type mapping *)
  let type_info = match find_type_mapping ~enums ~bitfields prop.prop_type.c_type with
    | Some mapping -> mapping
    | None -> {
        ocaml_type = "unit";
        c_to_ml = "Val_unit";
        ml_to_c = "Unit_val";
        needs_copy = false;
      }
  in

  (* Determine widget or controller cast *)
  let is_widget = not (
    class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  ) in

  let (c_cast, c_type_name) =
    if is_widget then
      ("GtkWidget_val", "GtkWidget")
    else
      ("GtkEventController_val", "GtkEventController")
  in

  sprintf "\nCAMLexport CAMLprim value %s(value self, value new_value)\n\
{\n\
    CAMLexport CAMLparam2(self, new_value);\n\
    %s *obj = (%s *)%s(self);\n\
    %s c_value = %s(new_value);\n\
    g_object_set(G_OBJECT(obj), \"%s\", c_value, NULL);\n\
    CAMLreturn(Val_unit);\n\
}\n"
    ml_name
    c_type_name c_type_name c_cast
    prop.prop_type.c_type type_info.ml_to_c
    prop.prop_name

(* ========================================================================= *)
(* OCaml Code Generation *)
(* ========================================================================= *)

(* Generate OCaml enum type definition *)
let generate_ocaml_enum enum =
  let buf = Buffer.create 512 in

  bprintf buf "(* %s - enumeration *)\n" enum.enum_name;
  (match enum.enum_doc with
  | Some doc -> bprintf buf "(** %s *)\n" doc
  | None -> ());

  bprintf buf "type %s = [\n" (String.lowercase_ascii enum.enum_name);

  List.iteri ~f:(fun i member ->
    let variant_name = String.uppercase_ascii member.member_name in
    (match member.member_doc with
    | Some doc -> bprintf buf "  (** %s *)\n" doc
    | None -> ());
    bprintf buf "  | `%s" variant_name;
    if i < List.length enum.members - 1 then
      bprintf buf "\n"
    else
      bprintf buf "\n]\n\n"
  ) enum.members;

  Buffer.contents buf

(* Generate OCaml bitfield type definition *)
let generate_ocaml_bitfield bitfield =
  let buf = Buffer.create 512 in

  bprintf buf "(* %s - bitfield/flags *)\n" bitfield.bitfield_name;
  (match bitfield.bitfield_doc with
  | Some doc -> bprintf buf "(** %s *)\n" doc
  | None -> ());

  bprintf buf "type %s_flag = [\n" (String.lowercase_ascii bitfield.bitfield_name);

  List.iteri ~f:(fun i flag ->
    let variant_name = String.uppercase_ascii flag.flag_name in
    (match flag.flag_doc with
    | Some doc -> bprintf buf "  (** %s *)\n" doc
    | None -> ());
    bprintf buf "  | `%s" variant_name;
    if i < List.length bitfield.flags - 1 then
      bprintf buf "\n"
    else
      bprintf buf "\n]\n\n"
  ) bitfield.flags;

  bprintf buf "type %s = %s_flag list\n\n"
    (String.lowercase_ascii bitfield.bitfield_name)
    (String.lowercase_ascii bitfield.bitfield_name);

  Buffer.contents buf

(* Generate C conversion functions for enum *)
let generate_c_enum_converters ~namespace enum =
  (* Skip enums with no members *)
  if List.length enum.members = 0 then ""
  else begin
    let buf = Buffer.create 1024 in
    let val_func = sprintf "Val_%s%s" namespace enum.enum_name in
    let c_val_func = sprintf "%s%s_val" namespace enum.enum_name in
    let first_member = List.hd enum.members in

    (* Generate C to OCaml converter *)
    bprintf buf "/* Convert %s to OCaml value */\n" enum.enum_c_type;
    bprintf buf "value %s(%s val) {\n" val_func enum.enum_c_type;
    bprintf buf "  switch (val) {\n";

    (* Track seen values to avoid duplicate case statements (e.g., GTK_ALIGN_BASELINE = GTK_ALIGN_BASELINE_FILL) *)
    let seen_values = Hashtbl.create 10 in
    List.iter ~f:(fun enum_member ->
      if not (Hashtbl.mem seen_values enum_member.member_value) then begin
        Hashtbl.add seen_values enum_member.member_value true;
        let variant_name = String.uppercase_ascii enum_member.member_name in
        let hash = Hashtbl.hash variant_name in
        bprintf buf "    case %s: return Val_int(%d); /* `%s */\n"
          enum_member.c_identifier hash variant_name;
      end
    ) enum.members;

    bprintf buf "    default: return Val_int(%d); /* fallback to first variant */\n"
      (Hashtbl.hash (String.uppercase_ascii first_member.member_name));
    bprintf buf "  }\n";
    bprintf buf "}\n\n";

    (* Generate OCaml to C converter *)
    bprintf buf "/* Convert OCaml value to %s */\n" enum.enum_c_type;
    bprintf buf "%s %s(value val) {\n" enum.enum_c_type c_val_func;
    bprintf buf "  int tag = Int_val(val);\n";

    List.iteri ~f:(fun i enum_member ->
      let variant_name = String.uppercase_ascii enum_member.member_name in
      let hash = Hashtbl.hash variant_name in
      bprintf buf "  %sif (tag == %d) return %s; /* `%s */\n"
        (if i = 0 then "" else "else ") hash enum_member.c_identifier variant_name;
    ) enum.members;

    bprintf buf "  else return %s; /* fallback to first value */\n"
      first_member.c_identifier;
    bprintf buf "}\n\n";

    Buffer.contents buf
  end

(* Generate C conversion functions for bitfield *)
let generate_c_bitfield_converters ~namespace bitfield =
  (* Skip bitfields with no flags *)
  if List.length bitfield.flags = 0 then ""
  else begin
    let buf = Buffer.create 1024 in
    let val_func = sprintf "Val_%s%s" namespace bitfield.bitfield_name in
    let c_val_func = sprintf "%s%s_val" namespace bitfield.bitfield_name in

    (* Generate C to OCaml converter (int flags -> list of variants) *)
    bprintf buf "/* Convert %s to OCaml flag list */\n" bitfield.bitfield_c_type;
    bprintf buf "value %s(%s flags) {\n" val_func bitfield.bitfield_c_type;
    bprintf buf "  CAMLparam0();\n";
    bprintf buf "  CAMLlocal2(result, cons);\n";
    bprintf buf "  result = Val_emptylist;\n\n";

    (* Check each flag bit and add to list if set *)
    List.iter ~f:(fun flag ->
      let variant_name = String.uppercase_ascii flag.flag_name in
      let hash = Hashtbl.hash variant_name in
      bprintf buf "  if (flags & %s) {\n" flag.flag_c_identifier;
      bprintf buf "    cons = caml_alloc(2, 0);\n";
      bprintf buf "    Store_field(cons, 0, Val_int(%d)); /* `%s */\n" hash variant_name;
      bprintf buf "    Store_field(cons, 1, result);\n";
      bprintf buf "    result = cons;\n";
      bprintf buf "  }\n";
    ) bitfield.flags;

    bprintf buf "\n  CAMLreturn(result);\n";
    bprintf buf "}\n\n";

    (* Generate OCaml to C converter (list of variants -> int flags) *)
    bprintf buf "/* Convert OCaml flag list to %s */\n" bitfield.bitfield_c_type;
    bprintf buf "%s %s(value list) {\n" bitfield.bitfield_c_type c_val_func;
    bprintf buf "  %s result = 0;\n" bitfield.bitfield_c_type;
    bprintf buf "  while (list != Val_emptylist) {\n";
    bprintf buf "    int tag = Int_val(Field(list, 0));\n";

    List.iteri ~f:(fun i flag ->
      let variant_name = String.uppercase_ascii flag.flag_name in
      let hash = Hashtbl.hash variant_name in
      bprintf buf "    %sif (tag == %d) result |= %s; /* `%s */\n"
        (if i = 0 then "" else "else ") hash flag.flag_c_identifier variant_name;
    ) bitfield.flags;

    bprintf buf "    list = Field(list, 1);\n";
    bprintf buf "  }\n";
    bprintf buf "  return result;\n";
    bprintf buf "}\n\n";

    Buffer.contents buf
  end

let generate_ml_interface ~class_name ~class_doc ~enums ~bitfields ~constructors ~methods ~properties ~signals =
  let buf = Buffer.create 1024 in

  (* Determine if this is a controller or widget *)
  let is_controller =
    class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  in

  let (class_type_name, base_type) =
    if is_controller then
      ("Event controller", "EventController.t")
    else
      ("Widget", "Gtk.Widget.t")
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (* Note: Don't open enum modules to avoid shadowing built-in types like 'unit' *)
  (* All enum types are qualified: Gtk_enums.*, Pango.*, Gdk.* *)

  (match class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" doc
  | None -> ());

  bprintf buf "type t = %s\n\n" base_type;

  (* Constructors - generate unique names and proper signatures *)
  List.iter ~f:(fun (ctor : gir_constructor) ->
    bprintf buf "(** Create a new %s *)\n" class_name;
    let c_name = ctor.c_identifier in
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in

    (* Generate OCaml constructor name from C identifier *)
    let class_snake = to_snake_case class_name in
    let ocaml_ctor_name =
      let base = Str.global_replace (Str.regexp (sprintf "gtk_%s_" class_snake)) "" c_name in
      let snake = to_snake_case base in
      (* Use "new_" for basic constructor to avoid "new" keyword *)
      if snake = "new" then "new_" else snake
    in

    (* Build parameter types for constructor signature *)
    (* Bug fix #5: Use find_type_mapping_for_gir_type to try both c_type and name *)
    let param_types = List.map ~f:(fun p ->
      match find_type_mapping_for_gir_type ~enums ~bitfields p.param_type with
      | Some mapping ->
        (* Bug fix #3: Qualify type names using GIR namespace *)
        let base_type = qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in
        if p.nullable then
          sprintf "%s option" base_type
        else
          base_type
      | None ->
        (* Still can't find it - warn and fallback to unit *)
        eprintf "Warning: Unknown type for parameter: name=%s c_type=%s\n"
          p.param_type.name p.param_type.c_type;
        "unit"
    ) ctor.ctor_parameters in

    (* Generate signature: param1 -> param2 -> ... -> t *)
    let signature =
      if List.length param_types = 0 then
        "unit -> t"
      else
        String.concat ~sep:" -> " (param_types @ ["t"])
    in

    (* Bug fix #1: For >5 parameters, reference bytecode/native variants *)
    let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
    if param_count > 5 then
      bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
        ocaml_ctor_name signature ml_name ml_name
    else
      bprintf buf "external %s : %s = \"%s\"\n\n" ocaml_ctor_name signature ml_name;
  ) (constructors |> Option.value ~default:[]);

  (* Properties - generate get/set externals *)
  (* Track generated property names to avoid duplicates with methods *)
  let property_names = ref [] in

  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
    List.iter ~f:(fun (prop : gir_property) ->
      (* Skip object types (GtkWidget*, etc.) - use methods instead *)
      let type_mapping_opt = find_type_mapping ~enums ~bitfields prop.prop_type.c_type in
      match type_mapping_opt with
      | Some type_mapping ->
        (* Convert property name: replace hyphens with underscores, then snake_case *)
        let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
        let prop_snake = to_snake_case prop_name_cleaned in
        let class_snake = to_snake_case class_name in
        (* Bug fix #3: Qualify type names using GIR namespace *)
        let prop_ocaml_type = qualify_ocaml_type ~gir_type_name:(Some prop.prop_type.name) type_mapping.ocaml_type in

        (* Generate getter if readable *)
        if prop.readable then begin
          let getter_name = sprintf "get_%s" prop_snake in
          property_names := getter_name :: !property_names;
          let c_getter = sprintf "ml_gtk_%s_get_%s" class_snake prop_snake in
          bprintf buf "(** Get property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s = \"%s\"\n\n"
            getter_name prop_ocaml_type c_getter;
        end;

        (* Generate setter if writable and not construct-only *)
        if prop.writable && not prop.construct_only then begin
          let setter_name = sprintf "set_%s" prop_snake in
          property_names := setter_name :: !property_names;
          let c_setter = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in
          bprintf buf "(** Set property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n"
            setter_name prop_ocaml_type c_setter;
        end;
      | None ->
        (* Skip properties without type mapping (object types) *)
        ()
    ) properties;
  end;

  (* Methods - skip those that duplicate property getters/setters *)
  (* Phase 5.3: Also skip variadic functions and methods with >5 parameters *)
  List.iter ~f:(fun (meth : gir_method) ->
    let c_name = meth.c_identifier in
    let param_count = 1 + List.length meth.parameters in (* +1 for self *)
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
    let ocaml_name = to_snake_case (
      Str.global_replace (Str.regexp (sprintf "gtk_%s_"
        (to_snake_case class_name))) "" c_name
    ) in

    (* Skip if: variadic function or duplicates property *)
    (* Note: No longer skip methods with >5 params - we generate bytecode/native variants *)
    let should_skip =
      is_variadic_function c_name ||
      List.mem ocaml_name ~set:!property_names
    in
    if not should_skip then begin
      (match meth.doc with
      | Some doc -> bprintf buf "(** %s *)\n" doc
      | None -> ());

      (* Build OCaml type signature - handle nullable parameters *)
      (* Bug fix #5: Use find_type_mapping_for_gir_type to try both c_type and name *)
      let param_types = List.map ~f:(fun p ->
        match find_type_mapping_for_gir_type ~enums ~bitfields p.param_type with
        | Some mapping ->
          (* Bug fix #3: Qualify type names using GIR namespace *)
          let base_type = qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in
          if p.nullable then
            (* Wrap in option type *)
            sprintf "%s option" base_type
          else
            base_type
        | None ->
          (* Still can't find it - warn and fallback to unit *)
          eprintf "Warning: Unknown type for method '%s' parameter: name=%s c_type=%s\n" meth.method_name
            p.param_type.name p.param_type.c_type;
          "unit"
      ) meth.parameters in

      let ret_type_ocaml =
        if meth.return_type.c_type = "void" then
          "unit"
        else
          (* Bug fix #5: Use find_type_mapping_for_gir_type for return types *)
          match find_type_mapping_for_gir_type ~enums ~bitfields meth.return_type with
          | Some mapping ->
            (* Bug fix #3: Qualify type names using GIR namespace *)
            qualify_ocaml_type ~gir_type_name:(Some meth.return_type.name) mapping.ocaml_type
          | None ->
            eprintf "Warning: Unknown return type for method %s: name=%s c_type=%s\n"
              meth.method_name meth.return_type.name meth.return_type.c_type;
            "unit"
      in

      (* Wrap return type in result if method throws errors *)
      let final_ret_type =
        if meth.throws then
          sprintf "(%s, GError.t) result" ret_type_ocaml
        else
          ret_type_ocaml
      in

      let full_type =
        String.concat ~sep:" -> " (["t"] @ param_types @ [final_ret_type])
      in

      (* For methods with >5 parameters, use bytecode/native variant syntax *)
      if param_count > 5 then
        bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
          ocaml_name full_type ml_name ml_name
      else
        bprintf buf "external %s : %s = \"%s\"\n\n"
          ocaml_name full_type ml_name;
    end
  ) (List.rev methods);

  Buffer.contents buf

(* ========================================================================= *)
(* Main *)
(* ========================================================================= *)

(* Main generation function *)
let generate_bindings mode filter_file gir_file output_dir =
  printf "Parsing %s (mode: %s)...\n" gir_file
    (match mode with
     | EventControllers -> "controllers"
     | Widgets -> "widgets"
     | All -> "all");

  (* Read filter file if specified *)
  let filter_classes = match filter_file with
    | Some f ->
      printf "Reading filter file: %s\n" f;
      let classes = read_filter_file f in
      printf "Filter includes %d classes\n" (List.length classes);
      classes
    | None -> []
  in

  let (controllers, interfaces, gtk_enums, gtk_bitfields) = parse_gir_file gir_file mode filter_classes in

  let class_type_name = match mode with
    | EventControllers -> "event controller"
    | Widgets -> "widget"
    | All -> "controller/widget"
  in
  printf "Found %d %s classes\n" (List.length controllers) class_type_name;
  printf "Found %d %s interfaces\n" (List.length interfaces) class_type_name;
  printf "Found %d Gtk enumerations\n" (List.length gtk_enums);
  printf "Found %d Gtk bitfields\n" (List.length gtk_bitfields);

  (* Parse external namespace GIR files for enums/bitfields *)
  let external_namespaces = [
    ("Gdk", "/usr/share/gir-1.0/Gdk-4.0.gir");
    ("Pango", "/usr/share/gir-1.0/Pango-1.0.gir");
  ] in

  let external_enums_bitfields = List.map ~f:(fun (ns_name, gir_path) ->
    if Sys.file_exists gir_path then begin
      printf "Parsing %s for enums/bitfields...\n" gir_path;
      let (ns_enums, ns_bitfields) = parse_gir_enums_only gir_path in
      printf "Found %d %s enumerations, %d %s bitfields\n"
        (List.length ns_enums) ns_name (List.length ns_bitfields) ns_name;
      Some (ns_name, ns_enums, ns_bitfields)
    end else begin
      eprintf "Warning: %s not found, skipping external namespace %s\n" gir_path ns_name;
      None
    end
  ) external_namespaces |> List.filter_map ~f:(fun x -> x) in

  (* Combine all enums and bitfields for type mapping lookups *)
  let all_enums = gtk_enums @ (external_enums_bitfields |> List.concat_map ~f:(fun (_, enums, _) -> enums)) in
  let all_bitfields = gtk_bitfields @ (external_enums_bitfields |> List.concat_map ~f:(fun (_, _, bitfields) -> bitfields)) in

  (* Use combined enums/bitfields for all type lookups *)
  let enums = all_enums in
  let bitfields = all_bitfields in

  (* Prepare external namespace enum/bitfield list with namespace prefixes for declarations *)
  let external_enums_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, ns_enums, _) ->
    List.map ~f:(fun enum -> (ns, enum)) ns_enums
  ) in
  let external_bitfields_with_ns = external_enums_bitfields |> List.concat_map ~f:(fun (ns, _, ns_bitfields) ->
    List.map ~f:(fun bitfield -> (ns, bitfield)) ns_bitfields
  ) in

  (* Generate C code *)
  let c_buf = Buffer.create 10240 in
  Buffer.add_string c_buf (generate_c_header ~external_enums:external_enums_with_ns ~external_bitfields:external_bitfields_with_ns ());

  (* Generate enum converters - only for GTK-specific enums *)
  (* External namespace enums are generated in their own files *)
  List.iter ~f:(fun enum ->
    Buffer.add_string c_buf (generate_c_enum_converters ~namespace:"Gtk" enum);
  ) gtk_enums;

  (* Generate bitfield converters - only for GTK-specific bitfields *)
  List.iter ~f:(fun bitfield ->
    Buffer.add_string c_buf (generate_c_bitfield_converters ~namespace:"Gtk" bitfield);
  ) gtk_bitfields;

  let print_class_or_interface class_name constructors methods properties =
    printf "  - %s (%d methods, %d properties)\n"
      class_name (List.length methods) (List.length properties);

    (* Constructors *)
    List.iter ~f:(fun ctor ->
      Buffer.add_string c_buf (generate_c_constructor ~enums ~bitfields ctor class_name)
    ) (constructors |> Option.value ~default:[]);

    (* Phase 5.2: Build list of property names to avoid duplicates *)
    let property_method_names = ref [] in
    List.iter ~f:(fun (prop : gir_property) ->
      (* Only track properties with type mappings (simple types) *)
      let has_type_mapping = match find_type_mapping ~enums ~bitfields prop.prop_type.c_type with
        | Some _ -> true
        | None -> false
      in
      if has_type_mapping then begin
        let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
        let prop_snake = to_snake_case prop_name_cleaned in
        if prop.readable then
          property_method_names := (sprintf "get_%s" prop_snake) :: !property_method_names;
        if prop.writable && not prop.construct_only then
          property_method_names := (sprintf "set_%s" prop_snake) :: !property_method_names;
      end
    ) properties;

    (* Phase 5.2: Generate ALL methods (removed 5-method limit), skip duplicates *)
    (* Phase 5.3: Skip variadic functions and methods with >5 parameters *)
    List.iter ~f:(fun (meth : gir_method) ->
      let c_name = meth.c_identifier in
      (* let param_count = 1 + List.length meth.parameters in (* +1 for self *) *)
      let class_snake = to_snake_case class_name in
      let ocaml_name = to_snake_case (
        Str.global_replace (Str.regexp (sprintf "gtk_%s_" class_snake)) "" c_name
      ) in
      (* Skip if: variadic function, too many params, or duplicates property *)
      let should_skip =
        (meth.parameters |> List.exists ~f:(fun p -> p.varargs)) ||
        (* param_count > max_caml_params || *)
        List.mem ocaml_name ~set:!property_method_names
      in
      if not should_skip then
        Buffer.add_string c_buf (generate_c_method ~enums ~bitfields meth class_name)
    ) (List.rev methods);

    (* Phase 5.2: Generate property getters and setters *)
    (* Skip object types (GtkWidget*, etc.) - use methods instead *)
    List.iter ~f:(fun (prop : gir_property) ->
      let is_simple_type = match find_type_mapping ~enums ~bitfields prop.prop_type.c_type with
        | Some _ -> true
        | None -> false
      in
      if is_simple_type then begin
        if prop.readable then
          Buffer.add_string c_buf (generate_c_property_getter ~enums ~bitfields prop class_name);
        if prop.writable && not prop.construct_only then
          Buffer.add_string c_buf (generate_c_property_setter ~enums ~bitfields prop class_name);
      end
    ) properties
  in
  
  List.iter ~f:(fun cls -> print_class_or_interface cls.class_name (Some cls.constructors )cls.methods cls.properties) controllers;
  List.iter ~f:(fun intf -> print_class_or_interface intf.interface_name None intf.methods intf.properties) interfaces;


  (* Write C output *)
  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  printf "\nWriting %s...\n" c_file;
  let oc = open_out c_file in
  Buffer.output_buffer oc c_buf;
  close_out oc;

  (* Generate OCaml modules *)
  List.iter ~f:(fun cls ->
    let ml_file = Filename.concat output_dir
      (sprintf "%s.mli" (to_snake_case cls.class_name)) in
    printf "Writing %s...\n" ml_file;
    let oc = open_out ml_file in
    output_string oc (generate_ml_interface ~class_name:cls.class_name ~class_doc:cls.class_doc ~enums ~bitfields ~constructors:(Some cls.constructors) ~methods:cls.methods ~properties:cls.properties ~signals:cls.signals);
    close_out oc;
  ) controllers;

  List.iter ~f:(fun cls ->
    let ml_file = Filename.concat output_dir
      (sprintf "%s.mli" (to_snake_case cls.interface_name)) in
    printf "Writing %s...\n" ml_file;
    let oc = open_out ml_file in
    output_string oc (generate_ml_interface ~class_name:cls.interface_name ~class_doc:cls.interface_doc ~enums ~bitfields ~constructors:None ~methods:cls.methods ~properties:cls.properties ~signals:cls.signals);
    close_out oc;
  ) interfaces;

  (* Generate GTK enum and bitfield types file *)
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    let enum_file = Filename.concat output_dir "gtk_enums.mli" in
    printf "Writing %s...\n" enum_file;
    let oc = open_out enum_file in
    output_string oc "(* GENERATED CODE - DO NOT EDIT *)\n";
    output_string oc "(* GTK4 Enumeration and Bitfield Types *)\n\n";
    List.iter ~f:(fun enum ->
      output_string oc (generate_ocaml_enum enum);
    ) gtk_enums;
    List.iter ~f:(fun bitfield ->
      output_string oc (generate_ocaml_bitfield bitfield);
    ) gtk_bitfields;
    close_out oc;
  end;

  (* Generate separate enum files and C converters for external namespaces *)
  List.iter ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
    let ns_lower = String.lowercase_ascii ns_name in

    (* Generate OCaml enum file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let enum_file = Filename.concat output_dir (sprintf "%s_enums.mli" ns_lower) in
      printf "Writing %s...\n" enum_file;
      let oc = open_out enum_file in
      output_string oc "(* GENERATED CODE - DO NOT EDIT *)\n";
      output_string oc (sprintf "(* %s Enumeration and Bitfield Types *)\n\n" ns_name);
      List.iter ~f:(fun enum ->
        output_string oc (generate_ocaml_enum enum);
      ) ns_enums;
      List.iter ~f:(fun bitfield ->
        output_string oc (generate_ocaml_bitfield bitfield);
      ) ns_bitfields;
      close_out oc;
    end;

    (* Generate C converter file *)
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then begin
      let c_file = Filename.concat output_dir (sprintf "ml_%s_enums_gen.c" ns_lower) in
      printf "Writing %s...\n" c_file;
      let oc = open_out c_file in
      output_string oc (sprintf "/* GENERATED CODE - DO NOT EDIT */\n");
      output_string oc (sprintf "/* %s enum/bitfield converters */\n\n" ns_name);
      output_string oc "#include <caml/mlvalues.h>\n";
      output_string oc "#include <caml/memory.h>\n";
      output_string oc "#include <caml/alloc.h>\n";
      if ns_lower = "gdk" then
        output_string oc "#include <gdk/gdk.h>\n\n"
      else if ns_lower = "pango" then
        output_string oc "#include <pango/pango.h>\n\n"
      else
        output_string oc (sprintf "#include <%s/%s.h>\n\n" ns_lower ns_lower);

      List.iter ~f:(fun enum ->
        output_string oc (generate_c_enum_converters ~namespace:ns_name enum);
      ) ns_enums;
      List.iter ~f:(fun bitfield ->
        output_string oc (generate_c_bitfield_converters ~namespace:ns_name bitfield);
      ) ns_bitfields;
      close_out oc;
    end;
  ) external_enums_bitfields;

  printf "\n✓ Code generation complete!\n";
  printf "  Generated: %s\n" c_file;
  printf "  Generated: %d OCaml interface files\n" ((List.length controllers) + (List.length interfaces));
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then
    printf "  Generated: gtk_enums.mli (%d enumerations, %d bitfields)\n"
      (List.length gtk_enums) (List.length gtk_bitfields);
  List.iter ~f:(fun (ns_name, ns_enums, ns_bitfields) ->
    if List.length ns_enums > 0 || List.length ns_bitfields > 0 then
      printf "  Generated: %s_enums.mli and ml_%s_enums_gen.c (%d enums, %d bitfields)\n"
        (String.lowercase_ascii ns_name) (String.lowercase_ascii ns_name)
        (List.length ns_enums) (List.length ns_bitfields);
  ) external_enums_bitfields;
  `Ok ()

(* Cmdliner argument definitions *)
let mode_arg =
  let mode_enum = [
    ("controllers", EventControllers);
    ("widgets", Widgets);
    ("all", All);
  ] in
  let doc = "Generation mode: controllers, widgets, or all (default: controllers)" in
  Arg.(value & opt (enum mode_enum) EventControllers & info ["m"; "mode"] ~docv:"MODE" ~doc)

let filter_arg =
  let doc = "Filter file specifying which classes to generate" in
  Arg.(value & opt (some file) None & info ["f"; "filter"] ~docv:"FILE" ~doc)

let gir_file_arg =
  let doc = "Path to GTK GIR file (e.g., /usr/share/gir-1.0/Gtk-4.0.gir)" in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"GIR_FILE" ~doc)

let output_dir_arg =
  let doc = "Output directory for generated files" in
  Arg.(required & pos 1 (some dir) None & info [] ~docv:"OUTPUT_DIR" ~doc)

(* Command definition *)
let gir_gen_cmd =
  let doc = "Generate C FFI bindings and OCaml modules from GTK GIR files" in
  let man = [
    `S Manpage.s_description;
    `P "gir_gen parses GTK GObject Introspection (GIR) files and generates \
        C FFI bindings and OCaml module interfaces for GTK4 event controllers \
        and widgets.";
    `S Manpage.s_examples;
    `P "Generate event controller bindings:";
    `Pre "  gir_gen /usr/share/gir-1.0/Gtk-4.0.gir ./output";
    `P "Generate widget bindings with filter:";
    `Pre "  gir_gen -m widgets -f widget_filter.conf Gtk-4.0.gir ./output";
    `S Manpage.s_bugs;
    `P "Report bugs to https://github.com/chris-armstrong/lablgtk/issues";
  ] in
  let info = Cmd.info "gir_gen" ~version:"5.0.0" ~doc ~man in
  Cmd.v info Term.(ret (const generate_bindings $ mode_arg $ filter_arg $ gir_file_arg $ output_dir_arg))

(* Main entry point *)
let () = exit (Cmd.eval gir_gen_cmd)

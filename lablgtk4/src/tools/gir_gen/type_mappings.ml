(* Type Mappings for GIR Code Generator *)

open StdLabels
open Printf
open Types

let type_mappings = [
  ("guint", ({
    Types.ocaml_type = "int";
    Types.c_to_ml = "Val_int";
    Types.ml_to_c = "Int_val";
    Types.needs_copy = false;
  } : Types.type_mapping));
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
    ocaml_type = "Gtk.widget";
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

let find_class_mapping classes lookup_str =
  let normalized_lookup =
    if String.length lookup_str > 0 && lookup_str.[String.length lookup_str - 1] = '*' then
      String.sub lookup_str ~pos:0 ~len:(String.length lookup_str - 1)
    else
      lookup_str
  in
  List.find_opt ~f:(fun (cls : Types.gir_class) ->
    let normalized_name = Utils.normalize_class_name cls.class_name in
    cls.c_type = normalized_lookup ||
    (cls.c_type ^ "*") = lookup_str ||
    (("Gtk" ^ normalized_name) = normalized_lookup) ||
    (("Gtk" ^ normalized_name ^ "*") = lookup_str)
  ) classes

let find_type_mapping_for_gir_type ?(enums=[]) ?(bitfields=[]) ?(classes=[]) (gir_type : Types.gir_type) =
  let try_lookup lookup_str =
    (* First, check if this is a known class type (GtkButton*, GtkWidget*, etc.) *)
    let class_mapping =
      match find_class_mapping classes lookup_str with
      | Some cls ->
        let normalized_name = Utils.normalize_class_name cls.class_name in
        let ocaml_type =
          if String.lowercase_ascii normalized_name = "widget" then
            "Gtk.widget"
          else
            "Gtk.widget"
        in
        Some {
          ocaml_type;
          c_to_ml = sprintf "Val_%s" cls.c_type;
          ml_to_c = sprintf "%s_val" cls.c_type;
          needs_copy = false;
        }
      | None -> None
    in
    match class_mapping with
    | Some mapping -> Some mapping
    | None ->
    (* First, check if this is a known enum *)
    let enum_mapping =
      List.find_opt ~f:(fun (e : Types.gir_enum) -> e.enum_c_type = lookup_str) enums in
    match enum_mapping with
    | Some enum ->
      (* Extract namespace from C type to prefix converter functions *)
      let namespace = Option.value (Utils.extract_namespace_from_c_type enum.enum_c_type) ~default:"" in
      Some {
        ocaml_type = String.lowercase_ascii enum.enum_name;
        c_to_ml = sprintf "Val_%s%s" namespace enum.enum_name;
        ml_to_c = sprintf "%s%s_val" namespace enum.enum_name;
        needs_copy = false;
      }
    | None ->
      (* Check if this is a known bitfield *)
      let bitfield_mapping =
        List.find_opt ~f:(fun (b : Types.gir_bitfield) -> b.bitfield_c_type = lookup_str) bitfields in
      (match bitfield_mapping with
      | Some bitfield ->
        (* Extract namespace from C type to prefix converter functions *)
        let namespace = Option.value (Utils.extract_namespace_from_c_type bitfield.bitfield_c_type) ~default:"" in
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
              ocaml_type = "Gtk.widget";
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
let find_type_mapping ?(enums=[]) ?(bitfields=[]) ?(classes=[]) c_type =
  find_type_mapping_for_gir_type ~enums ~bitfields ~classes { name = c_type; c_type = c_type; nullable = false }

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

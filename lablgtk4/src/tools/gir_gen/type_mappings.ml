(* Type Mappings for GIR Code Generator *)

open StdLabels
open Printf
open Types

let type_mappings : (string * Types.type_mapping) list =
  [
    ( "guint",
      ({
         Types.ocaml_type = "int";
         Types.c_to_ml = "Val_int";
         Types.ml_to_c = "Int_val";
         Types.needs_copy = false;
         layer2_class = None;
         c_type = "guint";
       }
        : Types.type_mapping) );
    ( "gint",
      {
        ocaml_type = "int";
        c_to_ml = "Val_int";
        ml_to_c = "Int_val";
        needs_copy = false;
        layer2_class = None;
        c_type = "gint";
      } );
    ( "gdouble",
      {
        ocaml_type = "float";
        c_to_ml = "caml_copy_double";
        ml_to_c = "Double_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gdouble";
      } );
    (* Bug fix #2: Add "double" mapping for c:type="double" in GIR *)
    ( "double",
      {
        ocaml_type = "float";
        c_to_ml = "caml_copy_double";
        ml_to_c = "Double_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "double";
      } );
    ( "gboolean",
      {
        ocaml_type = "bool";
        c_to_ml = "Val_bool";
        ml_to_c = "Bool_val";
        needs_copy = false;
        layer2_class = None;
        c_type = "gboolean";
      } );
    ( "gchararray",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gchararray";
      } );
    (* GdkModifierType is now generated from Gdk-4.0.gir *)
    ( "const gchar*",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "const gchar*";
      } );
    (* Bug fix: Add "gchar*" mapping for properties like placeholder-text *)
    ( "gchar*",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gchar*";
      } );
    (* Bug fix: Add "utf8" mapping for GIR type name *)
    ( "utf8",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "utf8";
      } );
    ( "const char*",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "const char*"
      } );
    (* Primitive types *)
    ( "gfloat",
      {
        ocaml_type = "float";
        c_to_ml = "caml_copy_double";
        ml_to_c = "Double_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gfloat";
      } );
    (* Bug fix #2: Ensure both gfloat and float are mapped *)
    ( "float",
      {
        ocaml_type = "float";
        c_to_ml = "caml_copy_double";
        ml_to_c = "Double_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "float";
      } );
  ]

let normalize_c_pointer_type lookup_str =
  let trimmed = String.trim lookup_str in
  let without_const =
    if String.length trimmed >= 6 && String.sub trimmed ~pos:0 ~len:6 = "const "
    then
      String.trim (String.sub trimmed ~pos:6 ~len:(String.length trimmed - 6))
    else trimmed
  in
  let without_trailing_const =
    if
      String.length without_const >= 6
      && String.sub without_const ~pos:(String.length without_const - 6) ~len:6
         = " const"
    then
      String.trim
        (String.sub without_const ~pos:0 ~len:(String.length without_const - 6))
    else without_const
  in
  String.trim without_trailing_const

let find_class_mapping classes lookup_str =
  let normalized_lookup =
    let base = normalize_c_pointer_type lookup_str in
    if String.length base > 0 && base.[String.length base - 1] = '*' then
      String.sub base ~pos:0 ~len:(String.length base - 1)
    else base
  in
  List.find_opt
    ~f:(fun (cls : Types.gir_class) ->
      let normalized_name = Utils.normalize_class_name cls.class_name in
      cls.class_name = normalized_lookup
      || cls.c_type ^ "*" = lookup_str
      || "Gtk" ^ normalized_name = normalized_lookup
      || "Gtk" ^ normalized_name ^ "*" = lookup_str)
    classes

(* Find interface mapping - similar to class mapping *)
let find_interface_mapping interfaces lookup_str =
  let normalized_lookup =
    let base = normalize_c_pointer_type lookup_str in
    if String.length base > 0 && base.[String.length base - 1] = '*' then
      String.sub base ~pos:0 ~len:(String.length base - 1)
    else base
  in
  List.find_opt
    ~f:(fun (iface : Types.gir_interface) ->
      let normalized_name = Utils.normalize_class_name iface.interface_name in
      iface.c_type = normalized_lookup
      || iface.c_type ^ "*" = lookup_str
      || "Gtk" ^ normalized_name = normalized_lookup
      || "Gtk" ^ normalized_name ^ "*" = lookup_str)
    interfaces

let is_boxed_record (record : Types.gir_record) =
  (match (record.glib_get_type, record.glib_type_name) with
  | Some _, _ | _, Some _ -> true
  | _ -> false)
  && not record.disguised

let find_record_mapping records lookup_str =
  let normalized_lookup = normalize_c_pointer_type lookup_str in
  let is_pointer =
    String.length normalized_lookup > 0
    && Char.equal normalized_lookup.[String.length normalized_lookup - 1] '*'
  in
  let base_lookup =
    if is_pointer then
      String.sub normalized_lookup ~pos:0
        ~len:(String.length normalized_lookup - 1)
    else normalized_lookup
  in
  List.find_opt
    ~f:(fun (record : Types.gir_record) ->
      let is_supported =
        is_boxed_record record || (record.disguised && is_pointer)
      in
      is_supported
      &&
      let normalized_name = Utils.normalize_class_name record.record_name in
      record.c_type = base_lookup
      || record.record_name = base_lookup
      || normalized_name = base_lookup
      || "Gtk" ^ normalized_name = base_lookup)
    records
  |> Option.map (fun record -> (record, is_pointer, is_boxed_record record))

let or_else f opt = match opt with Some _ -> opt | None -> f ()

let find_type_mapping_for_gir_type ~ctx (gir_type : Types.gir_type) =
  let try_lookup lookup_str =
    let find_class_mapping () =
      match find_class_mapping ctx.classes lookup_str with
      | Some cls ->
          (* Use proper Layer 1 type based on hierarchy *)
          (* Look up the module name from module_groups table *)
          let module_name =
            (* Check if this class is in the current cycle being generated *)
            if List.mem cls.class_name ~set:ctx.current_cycle_classes then
              (* Within the same cycle, use just the submodule name *)
              Utils.module_name_of_class cls.class_name
            else
              match Hashtbl.find_opt ctx.module_groups cls.class_name with
              | Some combined_module_name ->
                  let simple_module_name =
                    Utils.module_name_of_class cls.class_name
                  in
                  (* Check if this is a cyclic module by comparing names *)
                  if combined_module_name <> simple_module_name then
                    (* For cyclic modules, we need CombinedModule.ClassName.t *)
                    combined_module_name ^ "." ^ simple_module_name
                  else
                    (* Single module *)
                    combined_module_name
              | None -> Utils.module_name_of_class cls.class_name
          in
          let ocaml_type = module_name ^ ".t" in
          let ocaml_class_name = Utils.ocaml_class_name cls.class_name in
          let ocaml_class_module =
            match Hashtbl.find_opt ctx.module_groups cls.class_name with
            | Some combined_module_name -> combined_module_name
            | None -> Utils.module_name_of_class cls.class_name
          in
          Some
            {
              ocaml_type;
              layer2_class =
                Some
                  {
                    class_module = "G" ^ ocaml_class_module;
                    class_type = ocaml_class_name;
                    class_layer1_accessor = "as_" ^ ocaml_class_name;
                  };
              c_to_ml = sprintf "Val_%s" cls.c_type;
              ml_to_c = sprintf "%s_val" cls.c_type;
              c_type = cls.c_type;
              needs_copy = false;
            }
      | None -> None
      (* First, check if this is a known class type (GtkButton*, GtkWidget*, etc.) *)
    in
    let find_interface_mapping () =
      match find_interface_mapping ctx.interfaces lookup_str with
      | Some iface ->
          let module_name =
            (* Check if this interface is in the current cycle being generated *)
            if List.mem iface.interface_name ~set:ctx.current_cycle_classes then
              (* Within the same cycle, use just the submodule name *)
              Utils.module_name_of_class iface.interface_name
            else
              match Hashtbl.find_opt ctx.module_groups iface.interface_name with
              | Some combined_module_name ->
                  let simple_module_name =
                    Utils.module_name_of_class iface.interface_name
                  in
                  (* Check if this is a cyclic module by comparing names *)
                  if combined_module_name <> simple_module_name then
                    (* For cyclic modules, we need CombinedModule.InterfaceName.t *)
                    combined_module_name ^ "." ^ simple_module_name
                  else
                    (* Single module *)
                    combined_module_name
              | None -> Utils.module_name_of_class iface.interface_name
          in
          let ocaml_type =
            (* Look up the module name from module_groups table *)
            module_name ^ ".t"
          in
          let ocaml_class_module =
            match Hashtbl.find_opt ctx.module_groups iface.interface_name with
            | Some combined_module_name -> combined_module_name
            | None -> Utils.module_name_of_class iface.interface_name
          in

          let ocaml_class_name = Utils.ocaml_class_name iface.interface_name in
          Some
            {
              ocaml_type;
              layer2_class =
                Some
                  {
                    class_module = "G" ^ ocaml_class_module;
                    class_type = ocaml_class_name;
                    class_layer1_accessor = "as_" ^ ocaml_class_name;
                  };
              c_to_ml = sprintf "Val_%s" iface.c_type;
              ml_to_c = sprintf "%s_val" iface.c_type;
              c_type = iface.c_type;
              needs_copy = false;
            }
          (* Check if this is a known interface type (GtkTreeModel*, etc.) *)
      | None -> None
    in
    let find_record_mapping () =
      (* Next, check for known records (boxed/disguised) *)
      match find_record_mapping ctx.records lookup_str with
      | Some (record, _is_pointer, _) ->
          (* Use proper record module type (e.g., Tree_iter.t) instead of Obj.t *)
          let ocaml_type =
            (* Look up the module name from module_groups table *)
            let module_name =
              (* Check if this record is in the current cycle being generated *)
              if List.mem record.record_name ~set:ctx.current_cycle_classes then
                (* Within the same cycle, use just the submodule name *)
                Utils.module_name_of_class record.record_name
              else
                match Hashtbl.find_opt ctx.module_groups record.record_name with
                | Some combined_module_name ->
                    let simple_module_name =
                      Utils.module_name_of_class record.record_name
                    in
                    (* Check if this is a cyclic module by comparing names *)
                    if combined_module_name <> simple_module_name then
                      (* For cyclic modules, we need CombinedModule.RecordName.t *)
                      combined_module_name ^ "." ^ simple_module_name
                    else
                      (* Single module *)
                      combined_module_name
                | None -> Utils.module_name_of_class record.record_name
            in
            module_name ^ ".t"
          in
          Some
            {
              ocaml_type;
              c_to_ml = sprintf "Val_%s" record.c_type;
              ml_to_c = sprintf "%s_val" record.c_type;
              layer2_class = None;
              c_type = record.c_type;
              needs_copy = false;
            }
      | None -> None
    in
    let find_enum_mapping () =
      (* First, check if this is a known enum *)
      let enum_mapping =
        List.find_opt
          ~f:(fun (e : Types.gir_enum) -> e.enum_name = lookup_str)
          ctx.enums
      in
      match enum_mapping with
      | Some enum ->
          (* Use the context's namespace for enums from the current library *)
          let namespace = ctx.namespace.namespace_name in
          Some
            {
              ocaml_type = (namespace ) ^ "_enums." ^ String.lowercase_ascii enum.enum_name;
              c_type = enum.enum_c_type;
              c_to_ml = sprintf "Val_%s%s" namespace enum.enum_name;
              ml_to_c = sprintf "%s%s_val" namespace enum.enum_name;
              layer2_class = None;
              needs_copy = false;
            }
      | None -> None
    in
    let find_bitfield_mapping () =
      (* Check if this is a known bitfield *)
      let bitfield_mapping =
        List.find_opt
          ~f:(fun (b : Types.gir_bitfield) -> b.bitfield_c_type = lookup_str)
          ctx.bitfields
      in
      match bitfield_mapping with
      | Some bitfield ->
          (* Use the context's namespace for bitfields from the current library *)
          let namespace = ctx.namespace.namespace_name in
          Some
            {
              ocaml_type = String.lowercase_ascii bitfield.bitfield_name;
              c_to_ml = sprintf "Val_%s%s" namespace bitfield.bitfield_name;
              ml_to_c = sprintf "%s%s_val" namespace bitfield.bitfield_name;
              needs_copy = false;
              layer2_class = None;
              c_type = bitfield.bitfield_c_type;
            }
      | None -> None
    in
    let find_hardcoded_mapping () =
      (* Fall back to hardcoded type mappings *)
      (List.assoc_opt lookup_str type_mappings)
    in
    find_class_mapping ()
    |> or_else find_interface_mapping
    |> or_else find_record_mapping
    |> or_else find_enum_mapping 
    |> or_else find_bitfield_mapping
    |> or_else find_hardcoded_mapping
  in
  (* Try c_type first, then GIR name if c_type fails *)
  match gir_type.c_type with
  | Some c_type_str ->
      (match try_lookup c_type_str with
       | Some mapping -> Some mapping
       | None -> try_lookup gir_type.name)
  | None -> try_lookup gir_type.name

(* Bug fix #3: Add module qualification based on GIR namespace *)
(* let qualify_ocaml_type ?(gir_type_name = None) ocaml_type =
  (* Check if type is already qualified (contains a dot) *)
  if String.contains ocaml_type '.' then ocaml_type
  else
    (* Extract namespace from GIR type name (e.g., "Pango.EllipsizeMode" -> "Pango") *)
    let namespace =
      match gir_type_name with
      | Some name when String.contains name '.' ->
          let dot_pos = String.index name '.' in
          Some (String.sub ~pos:0 ~len:dot_pos name)
      | _ -> None
    in

    (* Qualify based on namespace *)
    match namespace with
    | Some "Pango" -> sprintf "Pango.%s" ocaml_type
    | Some "Gdk" -> sprintf "Gdk.%s" ocaml_type
    | Some "Gsk" ->
        sprintf "Gsk_enums.%s" ocaml_type (* Gsk enums in Gsk_enums module *)
    | Some "Gtk" ->
        (* Check if it's a core Gtk type or an enum *)
        let gtk_core_types =
          [
            "orientation";
            "align";
            "baseline_position";
            "position_type";
            "size_request_mode";
            "state_flags";
          ]
        in
        if List.mem ocaml_type ~set:gtk_core_types then
          sprintf "Gtk.%s" ocaml_type
        else
          sprintf "Gtk_enums.%s" ocaml_type (* Gtk enums in Gtk_enums module *)
    | _ ->
        (* No namespace - don't qualify built-in OCaml types *)
        let builtin_types =
          [
            "unit";
            "bool";
            "int";
            "float";
            "string";
            "char";
            "list";
            "array";
            "option";
            "result";
          ]
        in
        if List.mem ocaml_type ~set:builtin_types then ocaml_type
          (* Don't qualify built-in types *)
        else if String.contains ocaml_type '.' then ocaml_type
          (* Already qualified *)
        else
          sprintf "Gtk_enums.%s"
            ocaml_type Likely a Gtk enum without namespace *)

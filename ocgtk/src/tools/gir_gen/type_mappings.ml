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
    ( "const gchar*",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "const gchar*";
      } );
    ( "gchar*",
      {
        ocaml_type = "string";
        c_to_ml = "caml_copy_string";
        ml_to_c = "String_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gchar*";
      } );
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
        c_type = "const char*";
      } );
    ( "gfloat",
      {
        ocaml_type = "float";
        c_to_ml = "caml_copy_double";
        ml_to_c = "Double_val";
        needs_copy = true;
        layer2_class = None;
        c_type = "gfloat";
      } );
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
  List.find_opt records ~f:(fun record -> record.record_name = lookup_str)
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
      (* First, check if this is a known enum in current namespace *)
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
              ocaml_type =
                namespace ^ "_enums." ^ String.lowercase_ascii enum.enum_name;
              c_type = enum.enum_c_type;
              c_to_ml = sprintf "Val_%s%s" namespace enum.enum_name;
              ml_to_c = sprintf "%s%s_val" namespace enum.enum_name;
              layer2_class = None;
              needs_copy = false;
            }
      | None -> (
          (* Check external namespaces *)
          let external_enum_mapping =
            List.find_opt
              ~f:(fun ((_, e) : string * Types.gir_enum) ->
                e.enum_name = lookup_str)
              ctx.external_enums
          in
          match external_enum_mapping with
          | Some (ns, enum) ->
              Some
                {
                  ocaml_type =
                    ns ^ "_enums." ^ String.lowercase_ascii enum.enum_name;
                  c_type = enum.enum_c_type;
                  c_to_ml = sprintf "Val_%s%s" ns enum.enum_name;
                  ml_to_c = sprintf "%s%s_val" ns enum.enum_name;
                  layer2_class = None;
                  needs_copy = false;
                }
          | None -> None)
    in
    let find_bitfield_mapping () =
      (* Check if this is a known bitfield in current namespace *)
      let bitfield_mapping =
        List.find_opt
          ~f:(fun (b : Types.gir_bitfield) ->
            b.bitfield_c_type = lookup_str || b.bitfield_name = lookup_str)
          ctx.bitfields
      in
      match bitfield_mapping with
      | Some bitfield ->
          (* Use the context's namespace for bitfields from the current library *)
          let namespace = ctx.namespace.namespace_name in
          Some
            {
              ocaml_type =
                namespace ^ "_enums."
                ^ String.lowercase_ascii bitfield.bitfield_name;
              c_to_ml = sprintf "Val_%s%s" namespace bitfield.bitfield_name;
              ml_to_c = sprintf "%s%s_val" namespace bitfield.bitfield_name;
              needs_copy = false;
              layer2_class = None;
              c_type = bitfield.bitfield_c_type;
            }
      | None -> (
          (* Check external namespaces *)
          let external_bitfield_mapping =
            List.find_opt
              ~f:(fun ((_, b) : string * Types.gir_bitfield) ->
                b.bitfield_c_type = lookup_str || b.bitfield_name = lookup_str)
              ctx.external_bitfields
          in
          match external_bitfield_mapping with
          | Some (ns, bitfield) ->
              Some
                {
                  ocaml_type =
                    ns ^ "_enums."
                    ^ String.lowercase_ascii bitfield.bitfield_name;
                  c_to_ml = sprintf "Val_%s%s" ns bitfield.bitfield_name;
                  ml_to_c = sprintf "%s%s_val" ns bitfield.bitfield_name;
                  needs_copy = false;
                  layer2_class = None;
                  c_type = bitfield.bitfield_c_type;
                }
          | None -> None)
    in
    let find_hardcoded_mapping () =
      (* Fall back to hardcoded type mappings *)
      List.assoc_opt lookup_str type_mappings
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
  | Some c_type_str -> (
      match try_lookup c_type_str with
      | Some mapping -> Some mapping
      | None -> try_lookup gir_type.name)
  | None -> try_lookup gir_type.name

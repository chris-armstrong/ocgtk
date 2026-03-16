(* Type Mappings for GIR Code Generator *)
open Containers
open StdLabels
open Printf
open Types

let or_else f opt = match opt with Some _ -> opt | None -> f ()

let calculate_layer2_class ~class_module ~class_name =
  {
    class_module = "G" ^ class_module;
    class_type = class_name;
    class_layer1_accessor = "as_" ^ class_name;
  }

(** Map a cross-namespace type reference to a type mapping. This function is
    used to convert a cross-reference to a type mapping.*)
let map_cross_reference_to_type_mapping ~ctx:_ (cr : cross_reference) :
    type_mapping =
  {
    ocaml_type =
      (match cr.cr_type with
      | Crt_Class _ | Crt_Record _ | Crt_Interface _ ->
          Utils.module_name_of_class cr.cr_name ^ ".t"
      | Crt_Bitfield | Crt_Enum -> String.lowercase_ascii cr.cr_name);
    c_type = cr.cr_c_type;
    c_to_ml = "Val_" ^ cr.cr_c_type;
    ml_to_c = cr.cr_c_type ^ "_val";
    needs_copy =
      (match cr.cr_type with
      | Crt_Enum | Crt_Bitfield -> true
      | Crt_Record r when Bool.equal r.opaque false || Bool.equal r.boxed true
        ->
          true
      | _ -> false);
    layer2_class =
      (let class_module = Utils.module_name_of_class cr.cr_name in
       match cr.cr_type with
       | Crt_Class _ ->
           Some (calculate_layer2_class ~class_module ~class_name:cr.cr_name)
       | Crt_Interface _ ->
           Some
             (calculate_layer2_class ~class_module
                ~class_name:(Utils.ocaml_interface_name cr.cr_name))
       | Crt_Record _ ->
           Some
             (calculate_layer2_class ~class_module
                ~class_name:(Utils.ocaml_record_name cr.cr_name))
       | Crt_Enum | Crt_Bitfield -> None);
  }

(** Type mappings for built-in / primitive types (integers, strings, etc.) *)
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
    if String.starts_with trimmed ~prefix:"const " then
      String.trim (String.sub trimmed ~pos:6 ~len:(String.length trimmed - 6))
    else trimmed
  in
  let without_trailing_const =
    if String.ends_with without_const ~suffix:"const " then
      String.trim
        (String.sub without_const ~pos:0 ~len:(String.length without_const - 6))
    else without_const
  in
  String.trim without_trailing_const

(** find a class mapping DEPRECATED: does some weird things with pointer types
    that should be externalised *)
let lookup_class classes lookup_str =
  let normalized_lookup =
    let base = normalize_c_pointer_type lookup_str in
    if
      String.length base > 0
      && Char.equal (String.get base (String.length base - 1)) '*'
    then String.sub base ~pos:0 ~len:(String.length base - 1)
    else base
  in
  List.find_opt
    ~f:(fun (cls : Types.gir_class) ->
      let normalized_name = Utils.normalize_class_name cls.class_name in
      String.equal cls.class_name normalized_lookup
      || String.equal (cls.c_type ^ "*") lookup_str
      || String.equal ("Gtk" ^ normalized_name) normalized_lookup
      || String.equal ("Gtk" ^ normalized_name ^ "*") lookup_str)
    classes

(** lookup interface mapping DEPRECATED: does some weird things with pointer
    types that should be externalised *)
let lookup_interface interfaces lookup_str =
  let normalized_lookup =
    let base = normalize_c_pointer_type lookup_str in
    if String.ends_with ~suffix:"*" base then
      String.sub base ~pos:0 ~len:(String.length base - 1)
    else base
  in
  List.find_opt
    ~f:(fun (iface : Types.gir_interface) ->
      let normalized_name = Utils.normalize_class_name iface.interface_name in
      String.equal iface.c_type normalized_lookup
      || String.equal (iface.c_type ^ "*") lookup_str
      || String.equal ("Gtk" ^ normalized_name) normalized_lookup
      || String.equal ("Gtk" ^ normalized_name ^ "*") lookup_str)
    interfaces

let is_boxed_record (record : Types.gir_record) =
  (match (record.glib_get_type, record.glib_type_name) with
    | Some _, _ | _, Some _ -> true
    | _ -> false)
  && not record.disguised

(** find a record mapping DEPRECATED: does some weird things with pointer types
    that should be externalised *)
let lookup_record records lookup_str =
  let normalized_lookup = normalize_c_pointer_type lookup_str in
  let is_pointer =
    String.length normalized_lookup > 0
    && Char.equal normalized_lookup.[String.length normalized_lookup - 1] '*'
  in
  List.find_opt records ~f:(fun record ->
      String.equal record.record_name lookup_str)
  |> Option.map (fun record -> (record, is_pointer, is_boxed_record record))

let calculate_class_or_interface_or_record_module_name ~ctx ~name =
  (* Check if this interface is in the current cycle being generated *)
  if List.mem name ~set:ctx.current_cycle_classes then
    (* Within the same cycle, use just the submodule name *)
    Utils.module_name_of_class name
  else
    match Hashtbl.find_opt ctx.module_groups name with
    | Some combined_module_name ->
        let simple_module_name = Utils.module_name_of_class name in
        (* Check if this is a cyclic module by comparing names *)
        if not (String.equal combined_module_name simple_module_name) then
          (* For cyclic modules, we need CombinedModule.InterfaceName.t *)
          combined_module_name ^ "." ^ simple_module_name
        else
          (* Single module *)
          combined_module_name
    | None -> Utils.module_name_of_class name

(* Attempt to find a class mapping in the context in the current namespace *)
let find_class_mapping ~ctx lookup_str =
  let open Option in
  let* cls = lookup_class ctx.classes lookup_str in
  (* Use proper Layer 1 type based on hierarchy *)
  (* Look up the module name from module_groups table *)
  let module_name =
    calculate_class_or_interface_or_record_module_name ~ctx ~name:cls.class_name
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
          (calculate_layer2_class ~class_module:ocaml_class_module
             ~class_name:ocaml_class_name);
      c_to_ml = sprintf "Val_%s" cls.c_type;
      ml_to_c = sprintf "%s_val" cls.c_type;
      c_type = cls.c_type;
      needs_copy = false;
    }

(** Attempt to find an interface mapping in the context in the current namespace
*)
let find_interface_mapping ~ctx lookup_str =
  let open Option in
  let* iface = lookup_interface ctx.interfaces lookup_str in
  let module_name =
    calculate_class_or_interface_or_record_module_name ~ctx
      ~name:iface.interface_name
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
          (calculate_layer2_class ~class_module:ocaml_class_module
             ~class_name:ocaml_class_name);
      c_to_ml = sprintf "Val_%s" iface.c_type;
      ml_to_c = sprintf "%s_val" iface.c_type;
      c_type = iface.c_type;
      needs_copy = false;
    }

(** Attempt to find a record mapping in the context in the current namespace *)
let find_record_mapping ~ctx lookup_str =
  (* Next, check for known records (boxed/disguised) *)
  let open Option in
  let* record, _, _ = lookup_record ctx.records lookup_str in
  (* Use proper record module type (e.g., Tree_iter.t) instead of Obj.t *)
  let ocaml_type =
    (* Look up the module name from module_groups table *)
    let module_name =
      calculate_class_or_interface_or_record_module_name ~ctx
        ~name:record.record_name
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

let find_enum_mapping ~ctx lookup_str =
  (* First, check if this is a known enum in current namespace *)
  let enum_mapping =
    List.find_opt
      ~f:(fun (e : Types.gir_enum) -> String.equal e.enum_name lookup_str)
      ctx.enums
  in
  match enum_mapping with
  | Some enum ->
      (* Use the context's namespace for enums from the current library *)
      let namespace =
        Utils.namespace_to_module_name ctx.namespace.namespace_name
      in
      let c_namespace = ctx.namespace.namespace_name in
      Some
        {
          ocaml_type =
            namespace ^ "_enums." ^ String.lowercase_ascii enum.enum_name;
          c_type = enum.enum_c_type;
          c_to_ml = sprintf "Val_%s%s" c_namespace enum.enum_name;
          ml_to_c = sprintf "%s%s_val" c_namespace enum.enum_name;
          layer2_class = None;
          needs_copy = false;
        }
  | None -> (
      (* DEPRECATED: will use general cross-namespace mechanism eventually *)
      (* Check external namespaces *)
      let external_enum_mapping =
        List.find_opt
          ~f:(fun ((_, e) : string * Types.gir_enum) ->
            String.equal e.enum_name lookup_str)
          ctx.external_enums
      in
      match external_enum_mapping with
      | Some (ns, enum) ->
          let namespace = Utils.namespace_to_module_name ns in
          Some
            {
              ocaml_type =
                namespace ^ "_enums." ^ String.lowercase_ascii enum.enum_name;
              c_type = enum.enum_c_type;
              c_to_ml = sprintf "Val_%s%s" ns enum.enum_name;
              ml_to_c = sprintf "%s%s_val" ns enum.enum_name;
              layer2_class = None;
              needs_copy = false;
            }
      | None -> None)

let find_bitfield_mapping ~ctx lookup_str =
  (* Check if this is a known bitfield in current namespace *)
  let bitfield_mapping =
    List.find_opt
      ~f:(fun (b : Types.gir_bitfield) ->
        String.equal b.bitfield_c_type lookup_str
        || String.equal b.bitfield_name lookup_str)
      ctx.bitfields
  in
  match bitfield_mapping with
  | Some bitfield ->
      (* Use the context's namespace for bitfields from the current library *)
      let namespace =
        Utils.namespace_to_module_name ctx.namespace.namespace_name
      in
      let c_namespace = ctx.namespace.namespace_name in
      Some
        {
          ocaml_type =
            namespace ^ "_enums."
            ^ String.lowercase_ascii bitfield.bitfield_name;
          c_to_ml = sprintf "Val_%s%s" c_namespace bitfield.bitfield_name;
          ml_to_c = sprintf "%s%s_val" c_namespace bitfield.bitfield_name;
          needs_copy = false;
          layer2_class = None;
          c_type = bitfield.bitfield_c_type;
        }
  | None -> (
      (* Check external namespaces *)
      let external_bitfield_mapping =
        List.find_opt
          ~f:(fun ((_, b) : string * Types.gir_bitfield) ->
            String.equal b.bitfield_c_type lookup_str
            || String.equal b.bitfield_name lookup_str)
          ctx.external_bitfields
      in
      match external_bitfield_mapping with
      | Some (ns, bitfield) ->
          let namespace = Utils.namespace_to_module_name ns in
          Some
            {
              ocaml_type =
                namespace ^ "_enums."
                ^ String.lowercase_ascii bitfield.bitfield_name;
              c_to_ml = sprintf "Val_%s%s" ns bitfield.bitfield_name;
              ml_to_c = sprintf "%s%s_val" ns bitfield.bitfield_name;
              needs_copy = false;
              layer2_class = None;
              c_type = bitfield.bitfield_c_type;
            }
      | None -> None)

let rec find_type_mapping_for_gir_type ~ctx (gir_type : Types.gir_type) =
  (* Handle arrays first *)
  match gir_type.array with
  | Some array_info ->
      (* Recursively resolve the element type *)
      find_type_mapping_for_gir_type ~ctx array_info.element_type
      |> Option.map (fun element_mapping ->
          let ocaml_type = element_mapping.ocaml_type ^ " array" in
          let c_type =
            Option.value gir_type.c_type ~default:element_mapping.c_type ^ "*"
          in
          {
            ocaml_type;
            c_type;
            c_to_ml = "ARRAY_INLINE";
            (* Marker: use inline code generation *)
            ml_to_c = "ARRAY_INLINE";
            (* Marker: use inline code generation *)
            needs_copy = true;
            layer2_class = None;
          })
  | None ->
      (* Not an array - proceed with normal type lookup *)
      normal_type_lookup ~ctx gir_type

and normal_type_lookup ~ctx (gir_type : Types.gir_type) =
  let try_lookup lookup_str =
    let find_hardcoded_mapping () =
      (* Fall back to hardcoded type mappings *)
      List.assoc_opt lookup_str type_mappings
    in
    let find_cross_namespace_type_mapping ~ctx ~namespace ~name =
      let open Option in
      let* namespace_map = StringMap.find_opt namespace ctx.cross_references in
      let* cross_reference = StringMap.find_opt name namespace_map in
      Some (map_cross_reference_to_type_mapping ~ctx cross_reference)
    in
    let namespace, name = Utils.name_to_parts ~ctx lookup_str in
    if String.equal namespace ctx.namespace.namespace_name then
      find_class_mapping ~ctx lookup_str
      |> or_else (fun () -> find_interface_mapping ~ctx lookup_str)
      |> or_else (fun () -> find_record_mapping ~ctx lookup_str)
      |> or_else (fun () -> find_enum_mapping ~ctx lookup_str)
      |> or_else (fun () -> find_bitfield_mapping ~ctx lookup_str)
      |> or_else find_hardcoded_mapping
    else find_cross_namespace_type_mapping ~ctx ~namespace ~name
  in
  (* Try gir_name first, then c_type if that fails *)
  gir_type.name |> try_lookup
  |> or_else (fun () ->
      Option.bind gir_type.c_type (fun c_type -> try_lookup c_type))

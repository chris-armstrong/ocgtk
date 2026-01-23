(* Type Analysis Helpers for Property Type Introspection *)

open Containers
open StdLabels
open Types

(** Type analysis helpers for property type introspection *)
module Type_analysis = struct
  type property_gvalue_info = {
    base_type : string;
    base_lower : string;
    has_pointer : bool;
    pointer_like : bool;
    record_info : (gir_record * bool * bool) option;
    class_info : gir_class option;
    is_enum : bool;
    is_bitfield : bool;
    stack_allocated : bool;
  }

  let list_contains ~value list =
    List.exists list ~f:(fun candidate -> String.equal candidate value)

  let ends_with ~suffix str =
    let len_s = String.length suffix and len_str = String.length str in
    len_str >= len_s
    && String.equal (String.sub str ~pos:(len_str - len_s) ~len:len_s) suffix

  (* Check if a method is a copy method that should be skipped in bindings *)
  let is_copy_method (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    String.equal lower_name "copy" || ends_with ~suffix:"_copy" lower_cid

  (* Check if a method is a free method that should be skipped in bindings *)
  let is_free_method (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    String.equal lower_name "free" || ends_with ~suffix:"_free" lower_cid

  (* Check if a method is a copy or free method that should be skipped in bindings *)
  let is_copy_or_free meth = is_copy_method meth || is_free_method meth

  (* Fold with map and index - combines fold_left_map with index tracking *)
  let fold_mapi ~f ~init list =
    let rec aux idx acc = function
      | [] -> (acc, [])
      | x :: xs ->
          let acc', y = f idx acc x in
          let final_acc, ys = aux (idx + 1) acc' xs in
          (final_acc, y :: ys)
    in
    aux 0 init list

  let string_base_types = [ "gchar"; "char"; "utf8"; "gchararray" ]

  let int32_types =
    [ "gint"; "int"; "gint32"; "int32"; "gint16"; "int16"; "gint8"; "int8" ]

  let uint32_types =
    [
      "guint"; "uint"; "guint32"; "uint32"; "guint16"; "uint16"; "guint8"; "uint8";
    ]

  let int64_types = [ "gint64"; "int64" ]
  let uint64_types = [ "guint64"; "uint64" ]
  let long_types = [ "glong"; "long"; "goffset"; "off_t" ]
  let ulong_types = [ "gulong"; "ulong" ]
  let ssize_types = [ "gssize"; "ssize_t" ]
  let size_types = [ "gsize"; "size_t" ]
  let float_types = [ "gfloat"; "float" ]
  let double_types = [ "gdouble"; "double" ]
  let pointer_types = [ "gpointer"; "gconstpointer" ]

  let all_stack_allocated_builtins =
    string_base_types @ int32_types @ uint32_types @ int64_types @ uint64_types
    @ long_types @ ulong_types @ ssize_types @ float_types @ double_types
    @ pointer_types

  let is_string_type ctype =
    match ctype with
    | Some
        ( "char*" | "gchararray" | "gchar*" | "utf8" | "const gchar*"
        | "const char*" ) ->
        true
    | _ -> false

  (** Analyze property type and extract GValue conversion information *)
  let analyze_property_type ~ctx (gir_type : gir_type) =
    let c_type =
      match gir_type.c_type with
      | Some c_type -> c_type
      | None ->
          Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type
          |> Option.map (fun tm -> tm.c_type)
          |> Option.value ~default:"void"
    in
    let normalized =
      Type_mappings.normalize_c_pointer_type c_type |> String.trim
    in
    let rec find_last idx =
      if idx < 0 then None
      else
        match String.get normalized idx with
        | ' ' | '\t' -> find_last (idx - 1)
        | '*' -> Some idx
        | _ -> None
    in
    let base_type, has_pointer =
      match find_last (String.length normalized - 1) with
      | Some idx ->
          let stripped = String.trim (String.sub normalized ~pos:0 ~len:idx) in
          (stripped, true)
      | None -> (normalized, false)
    in
    let base_lower = String.lowercase_ascii gir_type.name in
    let record_info =
      Type_mappings.find_record_mapping ctx.records gir_type.name
    in
    let class_info = Type_mappings.find_class_mapping ctx.classes gir_type.name in
    let is_enum =
      List.exists ctx.enums ~f:(fun e -> String.equal e.enum_name gir_type.name)
    in
    let is_bitfield =
      List.exists ctx.bitfields ~f:(fun b ->
          String.equal b.bitfield_name gir_type.name)
    in
    let pointer_like =
      has_pointer
      || List.exists pointer_types ~f:(fun candidate ->
          String.equal candidate base_lower)
    in
    let stack_allocated =
      is_enum || is_bitfield
      || List.exists ~f:(String.equal normalized) all_stack_allocated_builtins
    in
    {
      base_type;
      base_lower;
      has_pointer;
      pointer_like;
      record_info;
      class_info;
      is_enum;
      is_bitfield;
      stack_allocated;
    }
end

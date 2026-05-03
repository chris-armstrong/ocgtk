(* Signal parameter marshalling: maps Types.gir_type to a marshaller
   specification (OCaml type + getter/setter expressions for
   Gobject.Value.t). *)

open Containers
open Types

type marshaller = {
  ocaml_type : string;
  getter_expr : string;
  setter_expr : string;
}

type result = Supported of marshaller | Unsupported of string

(* ===================================================================== *)
(* Primitive type table                                                  *)
(* ===================================================================== *)

(** Association list mapping GIR primitive names to (ocaml_type,
    getter_fn, setter_fn) triples for [Gobject.Value]. *)
let primitive_marshallers : (string * (string * string * string)) list =
  [
    ("gboolean", ("bool", "Gobject.Value.get_boolean", "Gobject.Value.set_boolean"));
    ("gint", ("int", "Gobject.Value.get_int", "Gobject.Value.set_int"));
    ("guint", ("int", "Gobject.Value.get_uint", "Gobject.Value.set_uint"));
    ( "gint64",
      ("Int64.t", "Gobject.Value.get_int64", "Gobject.Value.set_int64") );
    ("gdouble", ("float", "Gobject.Value.get_double", "Gobject.Value.set_double"));
    ("gfloat", ("float", "Gobject.Value.get_double", "Gobject.Value.set_double"));
    ("utf8", ("string", "Gobject.Value.get_string", "Gobject.Value.set_string"));
    ( "filename",
      ("string", "Gobject.Value.get_string", "Gobject.Value.set_string") );
    ( "gchararray",
      ("string", "Gobject.Value.get_string", "Gobject.Value.set_string") );
  ]

(* ===================================================================== *)
(* Helpers                                                               *)
(* ===================================================================== *)

(** Return true when [gir_type] represents a GLib.Variant value. *)
let is_glib_variant (gir_type : gir_type) =
  String.equal gir_type.name "GLib.Variant"
  || (match gir_type.c_type with Some ct -> String.equal ct "GVariant*" | None -> false)

(** Return true when [gir_type] represents a void / none return type. *)
let is_void_type (gir_type : gir_type) =
  String.equal gir_type.name "none"
  || (match gir_type.c_type with Some ct -> String.equal ct "void" | None -> false)

(** Return true when [gir_type] represents a callback / varargs parameter
    that cannot be marshalled until Milestone 4. GIR callback types typically
    have names containing "Func" or "Callback" (case-insensitive). *)
let is_callback_type (gir_type : gir_type) =
  let lower = String.lowercase_ascii gir_type.name in
  String.mem ~sub:"func" lower || String.mem ~sub:"callback" lower

(** Build the enums module prefix for a same-namespace enum/bitfield. *)
let same_ns_enums_module ~ctx =
  Utils.internal_namespace_to_module_name ctx.namespace.namespace_name ^ "_enums"

(** Build the enums module prefix for a cross-namespace enum/bitfield,
    given the external namespace name (e.g. ["Gdk"]). *)
let cross_ns_enums_module namespace =
  let pkg = Utils.library_wrapper_name namespace in
  (* Ocgtk_<ns>.<Ns>_enums *)
  String.capitalize_ascii pkg
  ^ "."
  ^ Utils.internal_namespace_to_module_name namespace
  ^ "_enums"

(** Build the GObject-ref OCaml type for a same-namespace class / interface. *)
let same_ns_object_type ~ctx class_name =
  let ns = Utils.internal_namespace_to_module_name ctx.namespace.namespace_name in
  let mod_ = Utils.module_name_of_class class_name in
  ns ^ "." ^ mod_ ^ ".t Gobject.obj"

(** Build the GObject-ref OCaml type for a cross-namespace class / interface. *)
let cross_ns_object_type namespace class_name =
  let ext = Utils.external_namespace_to_module_name namespace in
  let mod_ = Utils.module_name_of_class class_name in
  ext ^ "." ^ mod_ ^ ".t Gobject.obj"

(* ===================================================================== *)
(* Enum / bitfield classification helpers                                *)
(* ===================================================================== *)

let classify_enum ~ctx ~namespace ~name =
  let enums_module =
    if String.equal namespace ctx.namespace.namespace_name then
      same_ns_enums_module ~ctx
    else cross_ns_enums_module namespace
  in
  let lower_name = String.lowercase_ascii name in
  let ocaml_type = enums_module ^ "." ^ lower_name in
  let of_int = enums_module ^ "." ^ lower_name ^ "_of_int" in
  let to_int = enums_module ^ "." ^ lower_name ^ "_to_int" in
  let getter_expr =
    of_int ^ " (Gobject.Value.get_enum_int v)"
  in
  let setter_expr =
    "Gobject.Value.set_enum_int v (" ^ to_int ^ " x)"
  in
  Supported { ocaml_type; getter_expr; setter_expr }

let classify_bitfield ~ctx ~namespace ~name =
  let enums_module =
    if String.equal namespace ctx.namespace.namespace_name then
      same_ns_enums_module ~ctx
    else cross_ns_enums_module namespace
  in
  let lower_name = String.lowercase_ascii name in
  let ocaml_type = enums_module ^ "." ^ lower_name in
  let of_int = enums_module ^ "." ^ lower_name ^ "_of_int" in
  let to_int = enums_module ^ "." ^ lower_name ^ "_to_int" in
  let getter_expr =
    of_int ^ " (Gobject.Value.get_flags_int v)"
  in
  let setter_expr =
    "Gobject.Value.set_flags_int v (" ^ to_int ^ " x)"
  in
  Supported { ocaml_type; getter_expr; setter_expr }

(* ===================================================================== *)
(* Class / interface classification helpers                              *)
(* ===================================================================== *)

let classify_gobject ~ctx ~namespace ~name =
  let ocaml_type =
    if String.equal namespace ctx.namespace.namespace_name then
      same_ns_object_type ~ctx name
    else cross_ns_object_type namespace name
  in
  let getter_expr = "Gobject.Value.get_object v" in
  let setter_expr = "Gobject.Value.set_object v (Some x)" in
  Supported { ocaml_type; getter_expr; setter_expr }

(* ===================================================================== *)
(* Main classify function                                                *)
(* ===================================================================== *)

let classify ~ctx ~gir_type =
  (* Array types are not yet supported *)
  if Option.is_some gir_type.array then
    Unsupported "GArray not yet supported"
  (* Void / none is the return-only unit path *)
  else if is_void_type gir_type then
    Supported
      { ocaml_type = "unit"; getter_expr = "()"; setter_expr = "()" }
  (* GLib.Variant has special handling before general classification *)
  else if is_glib_variant gir_type then
    Supported
      {
        ocaml_type = "Gvariant.t";
        getter_expr = "Gobject.Value.get_variant v";
        setter_expr = "Gobject.Value.set_variant v x";
      }
  else if is_callback_type gir_type then
    Unsupported "callback parameters require Milestone 4"
  else
    (* Look up a primitive mapping before falling back to classify_type *)
    let primitive_result =
      List.assoc_opt ~eq:String.equal gir_type.name primitive_marshallers
      |> Option.map (fun (ocaml_type, getter_expr, setter_expr) ->
             Supported { ocaml_type; getter_expr; setter_expr })
    in
    match primitive_result with
    | Some r -> r
    | None ->
        (* Resolve namespace and name for the type *)
        let namespace, name = Utils.name_to_parts ~ctx gir_type.name in
        let type_kind = Type_mappings.classify_type ~ctx gir_type in
        (match type_kind with
        | Type_mappings.Tk_Enum -> classify_enum ~ctx ~namespace ~name
        | Type_mappings.Tk_Bitfield ->
            classify_bitfield ~ctx ~namespace ~name
        | Type_mappings.Tk_Class | Type_mappings.Tk_Interface ->
            classify_gobject ~ctx ~namespace ~name
        | Type_mappings.Tk_Record ->
            Unsupported
              (Printf.sprintf "boxed type %s.%s not yet supported" namespace
                 name)
        | Type_mappings.Tk_Primitive ->
            (* A primitive not in our table — should not happen often *)
            Unsupported
              (Printf.sprintf "primitive type %s not in marshaller table"
                 gir_type.name)
        | Type_mappings.Tk_Unknown ->
            Unsupported
              (Printf.sprintf "unknown type %s" gir_type.name))

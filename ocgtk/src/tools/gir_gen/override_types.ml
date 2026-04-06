(* Types for GIR generation overrides. *)

open Sexplib.Std

(** Version string plus an optional namespace override.
    [vs_namespace = None] means "use the current library's check macro";
    [vs_namespace = Some "Pango"] means "use PANGO_VERSION_CHECK". *)
type version_spec = {
  vs_version : string;
  vs_namespace : string option;
}
[@@deriving sexp, eq]

type override_action =
  | Ignore
  | Set_version of version_spec
[@@deriving sexp, eq]

type component_override = {
  component_name : string;
  action : override_action;
}
[@@deriving sexp, eq]

type class_override = {
  class_name : string;
  class_action : override_action option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type record_override = {
  record_name : string;
  record_action : override_action option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  flags : component_override list;
}
[@@deriving sexp, eq]

type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

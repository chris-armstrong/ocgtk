(* Types for GIR generation overrides. *)

open Sexplib.Std

type version_spec = { vs_version : string; vs_namespace : string option }
[@@deriving sexp, eq]
(** Version string plus an optional namespace override. [vs_namespace = None]
    means "use the current library's check macro"; [vs_namespace = Some "Pango"]
    means "use PANGO_VERSION_CHECK". *)

type override_action = Ignore | Set_version of version_spec
[@@deriving sexp, eq]

type os_spec = string [@@deriving sexp, eq]
(** OS/platform restriction. Supported values: "linux", "macos", "freebsd",
    "unix". The generator emits [#ifdef __linux__] / [#else caml_failwith] /
    [#endif] guards in the C stubs. Can be combined with [(version ...)] on
    the same entity or component. *)

type component_override = {
  component_name : string;
  action : override_action option;
  os : os_spec option;
}
[@@deriving sexp, eq]

type class_override = {
  class_name : string;
  class_action : override_action option;
  class_os : os_spec option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  interface_os : os_spec option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type record_override = {
  record_name : string;
  record_action : override_action option;
  record_os : os_spec option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  enum_os : os_spec option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  bitfield_os : os_spec option;
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

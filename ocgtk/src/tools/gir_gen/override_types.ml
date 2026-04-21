(* Types for GIR generation overrides. *)

open Sexplib.Std

type version_spec = { vs_version : string; vs_namespace : string option }
[@@deriving sexp, eq]
(** Version string plus an optional namespace override. [vs_namespace = None]
    means "use the current library's check macro"; [vs_namespace = Some "Pango"]
    means "use PANGO_VERSION_CHECK". *)

type override_action = Ignore | Set_version of version_spec
[@@deriving sexp, eq]

type component_override = {
  component_name : string;
  action : override_action option;
  os : Os_filter.t option;
}
[@@deriving sexp, eq]

type class_override = {
  class_name : string;
  class_action : override_action option;
  class_os : Os_filter.t option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  interface_os : Os_filter.t option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

type record_override = {
  record_name : string;
  record_action : override_action option;
  record_os : Os_filter.t option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
      (** Record-level functions. Parsed from `(function ...)` inside a `(record
          ...)` block. Distinct from top-level `library_overrides.functions`
          (namespace-level). *)
}
[@@deriving sexp, eq]

type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  enum_os : Os_filter.t option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  bitfield_os : Os_filter.t option;
  flags : component_override list;
      (** Populated from `(member ...)` in the sexp (same keyword as enum
          members). *)
}
[@@deriving sexp, eq]

type header_override = { header_path : string; header_os : Os_filter.t option }
[@@deriving sexp, eq]
(** Override for a C `#include` header emitted in the generated `*_decls.h`
    file. [header_os = Some (Os_only ["linux"])] wraps the include in
    [#ifdef __linux__]. *)

type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
  headers : header_override list;
}
[@@deriving sexp, eq]

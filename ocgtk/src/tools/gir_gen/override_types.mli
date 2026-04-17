(** Types for GIR generation overrides.

    Overrides are s-expression-based configuration entries that control
    generation behaviour per-entity (ignore, version override, OS guard). They
    are parsed by {!Override_parser} and applied by {!Override_apply} before the
    generation pipeline builds its type-mapping context. *)

type version_spec = { vs_version : string; vs_namespace : string option }
[@@deriving sexp, eq]
(** Version string plus an optional cross-namespace override.
    [vs_namespace = None] means use the current library's check macro;
    [vs_namespace = Some "Pango"] means use [PANGO_VERSION_CHECK]. *)

(** What to do for a specific entity or sub-component. *)
type override_action = Ignore | Set_version of version_spec
[@@deriving sexp, eq]

type os_spec = string [@@deriving sexp, eq]
(** OS/platform restriction. Supported values: "linux", "macos", "freebsd",
    "unix". The generator emits [#ifdef __linux__] / [#else caml_failwith] /
    [#endif] guards in the C stubs. Can be combined with [(version ...)] on the
    same entity or component. *)

type component_override = {
  component_name : string;
  action : override_action option;
  os : os_spec option;
}
[@@deriving sexp, eq]
(** Override for a sub-component of an entity (method, property, etc.).
    [action = None] with [os = Some _] means "keep the component, but guard it
    with an OS-conditional in the C stub". *)

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
(** Override for a class. *)

type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  interface_os : os_spec option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]
(** Override for an interface. *)

type record_override = {
  record_name : string;
  record_action : override_action option;
  record_os : os_spec option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
      (** Record-level functions. Parsed from [(function ...)] inside a
          [(record ...)] block. Distinct from top-level
          [library_overrides.functions] (namespace-level). *)
}
[@@deriving sexp, eq]
(** Override for a record. *)

type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  enum_os : os_spec option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]
(** Override for an enumeration. *)

type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  bitfield_os : os_spec option;
  flags : component_override list;
      (** Populated from [(member ...)] in the sexp (same keyword as enum
          members). *)
}
[@@deriving sexp, eq]
(** Override for a bitfield.

    The sexp format uses [(member NAME ...)] for bitfield members, matching the
    enum keyword. The parser maps this to the [flags] field. *)

type header_override = { header_path : string; header_os : os_spec option }
[@@deriving sexp, eq]
(** Override for a C [#include] header emitted in the generated [*_decls.h]
    file. [header_os = Some "linux"] wraps the include in [#ifdef __linux__]. *)

type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
      (** Standalone namespace-level functions. Parsed from [(function ...)] at
          the top level of the [(overrides ...)] form, not nested inside any
          entity. *)
  headers : header_override list;
      (** C [#include] headers with optional OS guards. *)
}
[@@deriving sexp, eq]
(** Top-level overrides container. *)

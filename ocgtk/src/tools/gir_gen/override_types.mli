(** Types for GIR generation overrides.

    Overrides are s-expression-based configuration entries that control
    generation behaviour per-entity (ignore, version override). They are
    parsed by {!Override_parser} and applied by {!Override_apply} before
    the generation pipeline builds its type-mapping context. *)

(** Version string plus an optional cross-namespace override.
    [vs_namespace = None] means use the current library's check macro;
    [vs_namespace = Some "Pango"] means use [PANGO_VERSION_CHECK]. *)
type version_spec = {
  vs_version : string;
  vs_namespace : string option;
}
[@@deriving sexp, eq]

(** What to do for a specific entity or sub-component. *)
type override_action =
  | Ignore
  | Set_version of version_spec
[@@deriving sexp, eq]

(** Override for a sub-component of an entity (method, property, etc.). *)
type component_override = {
  component_name : string;
  action : override_action;
}
[@@deriving sexp, eq]

(** Override for a class. *)
type class_override = {
  class_name : string;
  class_action : override_action option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

(** Override for an interface. *)
type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving sexp, eq]

(** Override for a record. *)
type record_override = {
  record_name : string;
  record_action : override_action option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
  (** Record-level functions. Parsed from [(function ...)] inside a [(record ...)] block.
      Distinct from top-level [library_overrides.functions] (namespace-level). *)
}
[@@deriving sexp, eq]

(** Override for an enumeration. *)
type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving sexp, eq]

(** Override for a bitfield.

    The sexp format uses [(member NAME ...)] for bitfield members, matching
    the enum keyword. The parser maps this to the [flags] field. *)
type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  flags : component_override list;
  (** Populated from [(member ...)] in the sexp (same keyword as enum members). *)
}
[@@deriving sexp, eq]

(** Top-level overrides container. *)
type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
  (** Standalone namespace-level functions. Parsed from [(function ...)] at the
      top level of the [(overrides ...)] form, not nested inside any entity. *)
}
[@@deriving sexp, eq]

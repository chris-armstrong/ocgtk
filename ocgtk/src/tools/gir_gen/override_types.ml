(* Types for GIR generation overrides. *)

type override_action =
  | Ignore
  | Set_version of string
[@@deriving eq]

type component_override = {
  component_name : string;
  action : override_action;
}
[@@deriving eq]

type class_override = {
  class_name : string;
  class_action : override_action option;
  constructors : component_override list;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving eq]

type interface_override = {
  interface_name : string;
  interface_action : override_action option;
  methods : component_override list;
  properties : component_override list;
  signals : component_override list;
}
[@@deriving eq]

type record_override = {
  record_name : string;
  record_action : override_action option;
  fields : component_override list;
  constructors : component_override list;
  methods : component_override list;
  functions : component_override list;
}
[@@deriving eq]

type enum_override = {
  enum_name : string;
  enum_action : override_action option;
  members : component_override list;
  functions : component_override list;
}
[@@deriving eq]

type bitfield_override = {
  bitfield_name : string;
  bitfield_action : override_action option;
  flags : component_override list;
}
[@@deriving eq]

type library_overrides = {
  library_name : string;
  classes : class_override list;
  interfaces : interface_override list;
  records : record_override list;
  enums : enum_override list;
  bitfields : bitfield_override list;
  functions : component_override list;
}
[@@deriving eq]

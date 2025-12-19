(* Type Definitions for GIR Code Generator *)

type gir_type = {
  name : string;
  c_type : string;
  nullable: bool;
}

type gir_direction = In | Out | InOut

type gir_param = {
  param_name : string;
  param_type : gir_type;
  direction : gir_direction;
  nullable : bool;
  varargs: bool;
}

type gir_method = {
  method_name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_param list;
  doc : string option;
  throws: bool;
  get_property : string option;
  set_property : string option;
}

type gir_signal = {
  signal_name : string;
  return_type : gir_type;
  sig_parameters : gir_param list;
  doc : string option;
}

type gir_constructor = {
  ctor_name : string;
  c_identifier : string;
  ctor_parameters : gir_param list;
  ctor_doc : string option;
  throws : bool;
}

type gir_property = {
  prop_name : string;
  prop_type : gir_type;
  readable : bool;
  writable : bool;
  construct_only : bool;
  prop_doc : string option;
}

type gir_record_field = {
  field_name : string;
  field_type : gir_type option;
  readable : bool;
  writable : bool;
  field_doc : string option;
}

type gir_record = {
  record_name : string;
  c_type : string;
  glib_type_name : string option;
  glib_get_type : string option;
  opaque : bool;
  disguised : bool;
  c_symbol_prefix : string option;
  fields : gir_record_field list;
  constructors : gir_constructor list;
  methods : gir_method list;
  record_doc : string option;
}

type gir_enum_member = {
  member_name : string;
  member_value : int;
  c_identifier : string;
  member_doc : string option;
}

type gir_enum = {
  enum_name : string;
  enum_c_type : string;
  members : gir_enum_member list;
  enum_doc : string option;
}

type gir_bitfield_member = {
  flag_name : string;
  flag_value : int;
  flag_c_identifier : string;
  flag_doc : string option;
}

type gir_bitfield = {
  bitfield_name : string;
  bitfield_c_type : string;
  flags : gir_bitfield_member list;
  bitfield_doc : string option;
}

type gir_class = {
  class_name : string;
  c_type : string;
  parent : string option;
  implements : string list;
  constructors : gir_constructor list;
  methods : gir_method list;
  properties : gir_property list;
  signals : gir_signal list;
  class_doc : string option;
}

type gir_interface = {
  interface_name : string;
  c_type : string;
  c_symbol_prefix : string;
  methods: gir_method list;
  properties: gir_property list;
  signals: gir_signal list;
  interface_doc: string option;
}

(* Unified entity type for classes, interfaces, and records *)
type entity_kind = Class | Interface | Record

type entity = {
  kind: entity_kind;
  name: string;
  c_type: string;
  doc: string option;
  parent: string option;  (* None for interfaces *)
  implements: string list;  (* Empty for interfaces *)
  constructors: gir_constructor list;  (* Empty for interfaces *)
  methods: gir_method list;
  properties: gir_property list;
  signals: gir_signal list;
}

let entity_of_class (cls: gir_class) : entity = {
  kind = Class;
  name = cls.class_name;
  c_type = cls.c_type;
  doc = cls.class_doc;
  parent = cls.parent;
  implements = cls.implements;
  constructors = cls.constructors;
  methods = cls.methods;
  properties = cls.properties;
  signals = cls.signals;
}

let entity_of_interface (intf: gir_interface) : entity = {
  kind = Interface;
  name = intf.interface_name;
  c_type = intf.c_type;
  doc = intf.interface_doc;
  parent = None;
  implements = [];
  constructors = [];
  methods = intf.methods;
  properties = intf.properties;
  signals = intf.signals;
}

let entity_of_record (rec_: gir_record) : entity = {
  kind = Record;
  name = rec_.record_name;
  c_type = rec_.c_type;
  doc = rec_.record_doc;
  parent = None;
  implements = [];
  constructors = rec_.constructors;
  methods = rec_.methods;
  properties = [];
  signals = [];
}

(* A generated OCaml class for a GIR Class or Interface *)
type ocaml_class = {
  class_module : string;
  class_type : string;
  class_layer1_accessor : string;
}

type type_mapping = {
  ocaml_type : string; (* classes: Application_window.t *)
  layer2_class : ocaml_class option; (* when this is a class or interface, the OCaml module *)
  c_to_ml : string;
  ml_to_c : string;
  needs_copy : bool;
}

(* Hierarchy classification *)
type hierarchy_kind =
  | WidgetHierarchy
  | EventControllerHierarchy
  | CellRendererHierarchy
  | LayoutManagerHierarchy
  | ExpressionHierarchy
  | MonomorphicType

type hierarchy_info = {
  hierarchy: hierarchy_kind;
  gir_root: string;           (* "Widget", "EventController", etc. *)
  layer2_module: string;       (* "GWidget", "GController", etc. *)
  class_type_name: string;     (* "widget_skel", "controller_skel", etc. *)
  accessor_method: string;     (* "as_widget", "as_controller", etc. *)
  layer1_base_type: string;    (* "Widget.t", "EventController.t", etc. *)
  base_conversion_method: string; (* Widget.as_widget *)
}

type gir_namespace = {
  namespace_name: string;
}

type generation_context = {
  namespace: gir_namespace;
  classes: gir_class list;
  interfaces: gir_interface list;
  enums: gir_enum list;
  bitfields: gir_bitfield list;
  records: gir_record list;
  external_enums: (string * gir_enum) list;
  external_bitfields: (string * gir_bitfield) list;
  hierarchy_map: (string, hierarchy_info) Hashtbl.t;
  module_groups: (string, string) Hashtbl.t;  (* class_name -> combined_module_name *)
  current_cycle_classes: string list;  (* Class names in the current cyclic module being generated *)
}

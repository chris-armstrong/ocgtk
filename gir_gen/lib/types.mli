type transfer_ownership =
  | TransferNone
  | TransferFull
  | TransferContainer
  | TransferFloating

type gir_array = {
  length : int option;
      (* Parameter index containing array length, if applicable *)
  zero_terminated : bool; (* Whether the array is null/zero-terminated *)
  fixed_size : int option; (* Fixed size of array, if known at compile time *)
  element_type : gir_type; (* Type of array elements *)
  array_name : string option;
      (* Array type name (e.g., "GLib.PtrArray" for GPtrArray) *)
}

and gir_type = {
  name : string;
  c_type : string option;
  nullable : bool;
  transfer_ownership : transfer_ownership;
  array : gir_array option; (* Present if this type represents an array *)
}

type gir_direction = In | Out | InOut

type gir_deprecation = {
  deprecated : bool;
  deprecated_version : string option;
  deprecated_doc : string option; (* <doc-deprecated> prose *)
}

type gir_param = {
  param_name : string;
  param_type : gir_type;
  direction : gir_direction;
  nullable : bool;
  varargs : bool;
  caller_allocates : bool;
      (* True if caller allocates the buffer for out params *)
  param_doc : string option; (* <doc> child of the <parameter> element *)
}

type gir_method = {
  method_name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_param list;
  doc : string option;
  return_doc : string option; (* <doc> child of the <return-value> element *)
  throws : bool;
  get_property : string option;
  set_property : string option;
  introspectable : bool;
  version : string option;
  version_namespace : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_function = {
  function_name : string;
  c_identifier : string;
  return_type : gir_type;
  parameters : gir_param list;
  doc : string option;
  return_doc : string option; (* <doc> child of the <return-value> element *)
  throws : bool;
  introspectable : bool;
  version : string option;
  version_namespace : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type signal_run_when = RunFirst | RunLast | RunCleanup

type gir_signal = {
  signal_name : string;
  return_type : gir_type;
  sig_parameters : gir_param list;
  doc : string option;
  return_doc : string option; (* <doc> child of the <return-value> element *)
  version : string option;
  version_namespace : string option;
  os : Os_filter.t option;
  run_when : signal_run_when option;
  action : bool;
  no_recurse : bool;
  no_hooks : bool;
  deprecation : gir_deprecation option;
}

type gir_constructor = {
  ctor_name : string;
  c_identifier : string;
  ctor_parameters : gir_param list;
  ctor_doc : string option;
  throws : bool;
  ctor_introspectable : bool;
  version : string option;
  version_namespace : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_property = {
  prop_name : string;
  prop_type : gir_type;
  readable : bool;
  writable : bool;
  construct_only : bool;
  prop_doc : string option;
  prop_default : string option;  (** GIR [default-value=], a C value. *)
  version : string option;
  version_namespace : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_record_field = {
  field_name : string;
  field_type : gir_type option;
  readable : bool;
  writable : bool;
  field_doc : string option;
  field_version : string option;
  field_os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_record = {
  record_name : string;
  c_type : string;
  glib_type_name : string option;
  glib_get_type : string option;
  opaque : bool;
  disguised : bool;
  introspectable : bool;
  c_symbol_prefix : string option;
  is_gtype_struct_for : string option;
      (* glib:is-gtype-struct-for attribute - class structs to skip *)
  fields : gir_record_field list;
  constructors : gir_constructor list;
  methods : gir_method list;
  functions : gir_function list;
  record_doc : string option;
  version : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_enum_member = {
  member_name : string;
  member_value : int;
  c_identifier : string;
  member_doc : string option;
  member_version : string option;
  member_os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_enum = {
  enum_name : string;
  enum_c_type : string;
  members : gir_enum_member list;
  functions : gir_function list;
  enum_doc : string option;
  enum_version : string option;
  enum_os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_bitfield_member = {
  flag_name : string;
  flag_value : int;
  flag_c_identifier : string;
  flag_doc : string option;
  flag_version : string option;
  flag_os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_constant = {
  constant_name : string;
  constant_c_type : string;
  value : string;
  value_type : gir_type;
  constant_doc : string option;
  version : string option;
  os : Os_filter.t option;
  introspectable : bool;
  deprecation : gir_deprecation option;
}

type gir_bitfield = {
  bitfield_name : string;
  bitfield_c_type : string;
  flags : gir_bitfield_member list;
  bitfield_doc : string option;
  bitfield_version : string option;
  bitfield_os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_class = {
  class_name : string;
  c_type : string;
  (* glib:get-type — the C function returning the class's registered GType.
     Classes and interfaces always carry one in practice, so generated code
     can emit per-class [get_type] stubs used by signal marshallers to pass
     the expected type to [Gobject.Value.get_object]/[set_object]. *)
  glib_get_type : string option;
  parent : string option;
  implements : string list;
  introspectable : bool;
  abstract : bool;
      (** GIR [abstract="1"]: the class has no instances of its own type. *)
  constructors : gir_constructor list;
  methods : gir_method list;
  properties : gir_property list;
  signals : gir_signal list;
  class_doc : string option;
  version : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type gir_interface = {
  interface_name : string;
  c_type : string;
  c_symbol_prefix : string;
  glib_type_name : string option;
  glib_get_type : string option;
  prerequisites : string list;
  introspectable : bool;
  methods : gir_method list;
  properties : gir_property list;
  signals : gir_signal list;
  interface_doc : string option;
  version : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

type entity_kind =
  | Class of gir_class
  | Interface of gir_interface
  | Record of gir_record

type entity = {
  kind : entity_kind;
  name : string;
  c_type : string;
  doc : string option;
  parent : string option; (* None for interfaces *)
  implements : string list; (* Empty for interfaces *)
  constructors : gir_constructor list; (* Empty for interfaces *)
  methods : gir_method list;
  properties : gir_property list;
  signals : gir_signal list;
  version : string option;
  os : Os_filter.t option;
  deprecation : gir_deprecation option;
}

val entity_of_class : gir_class -> entity
val entity_of_interface : gir_interface -> entity
val entity_of_record : gir_record -> entity

val entity_glib_get_type : entity -> string option
(** [glib:get-type] of the underlying GIR entity, for per-class [get_type]
    stubs. *)

type ocaml_class = {
  class_module : string;
  class_type : string;
  class_ml_name : string;
  class_layer1_accessor : string;
}

type type_mapping = {
  ocaml_type : string;
      (** Layer 1 OCaml type expression. Same-namespace classes/records:
          ["Widget.t"], ["Bitset.t"]. Cross-namespace classes/records:
          ["Ocgtk_gdk.Wrappers.Surface.t"], ["Ocgtk_gdk.Wrappers.Rgb_a.t"].
          Same-namespace enums/bitfields: ["Gtk.align"]. Cross-namespace
          enums/bitfields: ["Ocgtk_pango.alignment"]. Primitives: ["int"],
          ["float"], ["string"], ["bool"]. *)
  c_type : string;
      (** The C type name without pointer suffix. Same-namespace: ["GtkWidget"],
          ["GtkBitset"], ["GtkAlign"]. Cross-namespace: ["GdkSurface"],
          ["GdkRGBA"], ["PangoAlignment"]. *)
  c_to_ml : string;
      (** C macro/function that converts a C value to an OCaml [value].
          Same-namespace: ["Val_GtkWidget"], ["Val_GtkBitset"]. Cross-namespace:
          ["Val_GdkRGBA"], ["Val_PangoAlignment"]. Primitives: ["Val_int"],
          ["caml_copy_double"], ["caml_copy_string"]. For non-opaque records,
          the generated function expects a const pointer argument, not a value.
      *)
  ml_to_c : string;
      (** C macro/function that converts an OCaml [value] to a C value.
          Same-namespace: ["GtkWidget_val"], ["GtkBitset_val"]. Cross-namespace:
          ["GdkRGBA_val"], ["PangoAlignment_val"]. Primitives: ["Int_val"],
          ["Double_val"], ["String_val"]. *)
  layer2_class : ocaml_class option;
      (** Layer 2 class wrapper info. Present for GObject classes, interfaces,
          AND records that have OCaml class wrappers. Used by Layer 2 generators
          for method signatures (e.g. [#widget -> unit]) and coercion accessors
          (e.g. [obj#as_widget]).

          Same-namespace classes: [Some {class_module="GWidget"; ...}].
          Cross-namespace classes: [Some {class_module="Ocgtk_gdk"; ...}].
          Cross-namespace records: [Some {class_module="Ocgtk_gdk"; ...}].
          Same-namespace records: [None] (layer 2 refs resolved differently).
          Enums/bitfields/primitives: [None].

          {b Important}: presence does NOT imply the type is a GObject — cross-
          namespace records also have this set for Layer 2 class references. Use
          [is_value_type_record] to distinguish records from GObjects. *)
  is_value_type_record : bool;
      (** True for non-opaque records: stack-allocated C structs like
          [graphene_rect_t] or [GdkRGBA]. Affects code generation in two ways:
          1. Out-parameters need [&var] when calling [c_to_ml] (the Val function
          expects a pointer, but the out-param is a stack-allocated value). 2.
          Return values must NOT get [g_object_ref_sink] — these are plain
          structs, not GObjects with floating references.

          True for: same-namespace non-opaque records, cross-namespace
          non-opaque records ([Crt_Record {opaque=false}]). False for: classes,
          interfaces, opaque records, enums, bitfields, primitives. *)
  transfer_strategy : transfer_strategy;
      (** How to handle ownership when wrapping a return value. Drives
          [generate_ref_sink_stmt] in the C stub generator. *)
}

and transfer_strategy =
  | Ts_none
  | Ts_gobject
  | Ts_boxed of string
  | Ts_gvariant

type gir_namespace = {
  namespace_name : string;
  namespace_version : string;
  namespace_shared_library : string;
  namespace_c_identifier_prefixes : string;
  namespace_c_symbol_prefixes : string;
}

type gir_include = { include_name : string; include_version : string }

type gir_repository = {
  repository_includes : gir_include list;
  repository_c_includes : string list;
  repository_packages : string list;
  repository_doc_format : string option;
      (* <doc:format name=...> of the repository (diagnostics only) *)
}

type cross_reference_type =
  | Crt_Class of { parent : string option; implements : string list }
  | Crt_Interface
  | Crt_Record of { opaque : bool; get_type_func : string option }
  | Crt_Enum
  | Crt_Bitfield
  | Crt_Constant

val cross_reference_type_of_sexp : Sexplib0.Sexp.t -> cross_reference_type
val sexp_of_cross_reference_type : cross_reference_type -> Sexplib0.Sexp.t

type cross_reference_layer_members = {
  crl_methods : (string * string) list;
  crl_constructors : (string * string) list;
  crl_signals : (string * string) list;
  crl_properties : (string * string) list;
}
(** The members a type emits at one layer, as [doc_member_names] lists them: GIR
    name to OCaml name, each list sorted by GIR name. *)

val cross_reference_layer_members_of_sexp :
  Sexplib0.Sexp.t -> cross_reference_layer_members

val sexp_of_cross_reference_layer_members :
  cross_reference_layer_members -> Sexplib0.Sexp.t

type cross_reference_members = {
  crm_l1 : cross_reference_layer_members;
  crm_l2 : cross_reference_layer_members;
  crm_c_methods : (string * string) list;
      (** Every method, emitted or not: GIR name to C identifier. *)
  crm_c_constructors : (string * string) list;
      (** Every constructor: GIR name to C identifier. *)
}
(** The member tables of a generated class, interface or record (see
    [Doc_index]). *)

val cross_reference_members_of_sexp : Sexplib0.Sexp.t -> cross_reference_members
val sexp_of_cross_reference_members : cross_reference_members -> Sexplib0.Sexp.t

type cross_reference_entity = {
  cr_name : string;
  cr_type : cross_reference_type;
  cr_c_type : string;
  cr_members : cross_reference_members option;
      (** A generated class, interface or record's member tables; [None] for
          other entities, and in a file written before member tables existed. *)
  cr_enum_members : (string * string) list option;
      (** An enumeration or bitfield's members: GIR name to C identifier, in GIR
          order; [None] for other entities, and in a file written before member
          tables existed. *)
}

val cross_reference_entity_of_sexp : Sexplib0.Sexp.t -> cross_reference_entity
val sexp_of_cross_reference_entity : cross_reference_entity -> Sexplib0.Sexp.t

type cross_reference_namespace = {
  cr_namespace_name : string;
  cr_namespace_packages : string list;
  cr_namespace_includes : string list;
  cr_namespace_c_includes : string list;
  cr_entities : cross_reference_entity list;
}

val cross_reference_namespace_of_sexp :
  Sexplib0.Sexp.t -> cross_reference_namespace

val sexp_of_cross_reference_namespace :
  cross_reference_namespace -> Sexplib0.Sexp.t

module StringMap : sig
  type key = String.t
  type 'a t = 'a Stdlib__Map.Make(String).t

  val empty : 'a t
  val add : key -> 'a -> 'a t -> 'a t
  val add_to_list : key -> 'a -> 'a list t -> 'a list t
  val update : key -> ('a option -> 'a option) -> 'a t -> 'a t
  val singleton : key -> 'a -> 'a t
  val remove : key -> 'a t -> 'a t

  val merge :
    (key -> 'a option -> 'b option -> 'c option) -> 'a t -> 'b t -> 'c t

  val union : (key -> 'a -> 'a -> 'a option) -> 'a t -> 'a t -> 'a t
  val cardinal : 'a t -> int
  val bindings : 'a t -> (key * 'a) list
  val min_binding : 'a t -> key * 'a
  val min_binding_opt : 'a t -> (key * 'a) option
  val max_binding : 'a t -> key * 'a
  val max_binding_opt : 'a t -> (key * 'a) option
  val choose : 'a t -> key * 'a
  val choose_opt : 'a t -> (key * 'a) option
  val find : key -> 'a t -> 'a
  val find_opt : key -> 'a t -> 'a option
  val find_first : (key -> bool) -> 'a t -> key * 'a
  val find_first_opt : (key -> bool) -> 'a t -> (key * 'a) option
  val find_last : (key -> bool) -> 'a t -> key * 'a
  val find_last_opt : (key -> bool) -> 'a t -> (key * 'a) option
  val iter : (key -> 'a -> unit) -> 'a t -> unit
  val fold : (key -> 'a -> 'acc -> 'acc) -> 'a t -> 'acc -> 'acc
  val map : ('a -> 'b) -> 'a t -> 'b t
  val mapi : (key -> 'a -> 'b) -> 'a t -> 'b t
  val filter : (key -> 'a -> bool) -> 'a t -> 'a t
  val filter_map : (key -> 'a -> 'b option) -> 'a t -> 'b t
  val partition : (key -> 'a -> bool) -> 'a t -> 'a t * 'a t
  val split : key -> 'a t -> 'a t * 'a option * 'a t
  val is_empty : 'a t -> bool
  val mem : key -> 'a t -> bool
  val equal : ('a -> 'a -> bool) -> 'a t -> 'a t -> bool
  val compare : ('a -> 'a -> int) -> 'a t -> 'a t -> int
  val for_all : (key -> 'a -> bool) -> 'a t -> bool
  val exists : (key -> 'a -> bool) -> 'a t -> bool
  val to_list : 'a t -> (key * 'a) list
  val of_list : (key * 'a) list -> 'a t
  val to_seq : 'a t -> (key * 'a) Seq.t
  val to_rev_seq : 'a t -> (key * 'a) Seq.t
  val to_seq_from : key -> 'a t -> (key * 'a) Seq.t
  val add_seq : (key * 'a) Seq.t -> 'a t -> 'a t
  val of_seq : (key * 'a) Seq.t -> 'a t
end

type generation_context_namespace_cross_references = {
  ncr_namespace_name : string;
  ncr_namespace_packages : string list;
  ncr_namespace_includes : string list;
  ncr_namespace_c_includes : string list;
  ncr_entities : cross_reference_entity StringMap.t;
}

(** Each namespace's generated OCaml lives in two libraries: layer 1 in the raw
    library ([Ocgio_raw]), layer 2 in the main library ([Ocgio]). The same type
    is named differently from each (see [Module_paths]). *)
type target_library = Raw_library | Main_library

(** The kinds of type a doc reference can link to: those with a generated module
    or enumeration type. *)
type doc_type_kind =
  | Dk_class
  | Dk_interface
  | Dk_record
  | Dk_enum
  | Dk_bitfield

type doc_member_names = {
  dm_methods : string StringMap.t;
  dm_constructors : string StringMap.t;
  dm_signals : string StringMap.t;
  dm_properties : string StringMap.t;
      (** The accessor a property reference links to. *)
}
(** The members a type emits at one layer: GIR name to OCaml name. Signal and
    property names are in GIR form, with hyphens. *)

type doc_type_members = { dm_l1 : doc_member_names; dm_l2 : doc_member_names }
(** The members a type emits at each layer (see [Emitted_members]). *)

type doc_c_member_kind = Dc_method | Dc_constructor | Dc_enum_member

type doc_c_symbol = {
  dc_kind : doc_c_member_kind;
  dc_type : string;  (** The GIR name of the type that declares it. *)
  dc_member : string;  (** Its GIR name. *)
}
(** A method, constructor, or enumeration or bitfield member, found by its C
    identifier. *)

type doc_index_namespace = {
  di_types : doc_type_kind StringMap.t;
  di_constants : string StringMap.t;  (** GIR name to OCaml value name. *)
  di_members : doc_type_members StringMap.t;
      (** By GIR type name. Another namespace has them only when its references
          file lists members. *)
  di_enum_members : string StringMap.t StringMap.t;
      (** By enumeration or bitfield GIR name, then by member name in upper case
          with underscores: the polymorphic variant tag. Likewise for another
          namespace. *)
  di_c_types : string StringMap.t;  (** C type name to GIR type name. *)
  di_c_constants : string StringMap.t;
      (** C identifier to GIR constant name. *)
  di_c_symbols : doc_c_symbol StringMap.t;
      (** By C identifier. Likewise for another namespace. *)
  di_members_listed : bool;
      (** Whether the member tables are filled: always for the current
          namespace, and for another one when its references file lists members.
          An older file has no member tables, so its members can't be checked.
      *)
}
(** What a doc reference into one namespace can link to: its generated types,
    constants and members, keyed by GIR name and by C name (see [Doc_index]). *)

type doc_index = doc_index_namespace StringMap.t
(** The namespaces a doc reference can link into, keyed by GIR namespace name:
    the current one and those with a references file. *)

type generation_context = {
  namespace : gir_namespace;
  repository : gir_repository;
  classes : gir_class list;
  interfaces : gir_interface list;
  enums : gir_enum list;
  bitfields : gir_bitfield list;
  records : gir_record list;
  constants : gir_constant list;
  module_groups : (string, string) Hashtbl.t;
      (* class_name -> combined_module_name *)
  current_cycle_classes : string list;
      (* Class names in the current cyclic module being generated *)
  cross_references : generation_context_namespace_cross_references StringMap.t;
  target_library : target_library;
      (* Library the code being generated belongs to; decides module paths *)
  doc_index : doc_index; (* What doc references can link to; see [Doc_index] *)
}

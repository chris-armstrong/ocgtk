(* Emitted_members — the members an entity emits, at each layer.

   The one place that decides which methods, constructors, signals and property
   accessors a class, interface or record emits, and under which OCaml names.
   The layer 1 and layer 2 emitters take their member lists from here, and
   [Doc_index] builds its member tables from [names], so a doc reference links
   to a member exactly when the member is emitted.

   Members dropped before emission:
   - methods: [Filtering.should_skip_method_binding] at both layers (unknown
     types, varargs, not introspectable, unsupported arrays, record copy and
     free); at layer 2 also methods with an out parameter, methods whose name
     an ancestor or an implemented interface already declares, and methods
     whose signature conflicts with an ancestor method of the same name (a
     comment is emitted instead);
   - constructors: [Filtering.should_generate_constructor];
   - signals: those [Signal_gen.classify] rejects;
   - properties: [Filtering.should_generate_property] (array or unmapped type,
     or claimed by a method), and at layer 2 an accessor whose name is already
     declared.

   The C stub emitters catch [Failure] for a method or constructor and skip its
   stub, but not its OCaml declaration, so that drop does not affect what the
   OCaml modules declare. *)

open Types

val l1_methods :
  ctx:generation_context ->
  entity_kind:Filtering.entity_kind ->
  gir_method list ->
  gir_method list
(** The methods with a layer 1 [external], in the given order. *)

val constructors :
  ctx:generation_context -> gir_constructor list -> gir_constructor list
(** The constructors, at layer 1 and layer 2. *)

type accessors = {
  prop : gir_property;
  getter : bool;  (** A getter is emitted. *)
  setter : bool;  (** A setter is emitted. *)
}
(** The accessors of a property with at least one. *)

val l1_properties :
  ctx:generation_context ->
  methods:gir_method list ->
  gir_property list ->
  accessors list
(** The properties with a layer 1 [get_<p>] or [set_<p>]. *)

val classified_signals :
  ctx:generation_context ->
  gir_signal list ->
  (gir_signal * (Signal_gen.signal_emission, string) result) list
(** Each signal with its emission, or the reason it is skipped. *)

val signals :
  ctx:generation_context -> gir_signal list -> Signal_gen.signal_emission list
(** The signals with an [on_<s>] at both layers. *)

type l2_method = {
  meth : gir_method;
  name : string;  (** The OCaml method name. *)
  conflict : bool;
      (** The signature conflicts with an ancestor method: the method is a
          comment, not a declaration. *)
}

type l2 = {
  l2_methods : l2_method list;
  l2_properties : accessors list;
      (** Getter [method <p>], setter [method set_<p>]. *)
}

val l2 :
  ctx:generation_context ->
  class_name:string ->
  c_type:string ->
  entity_kind:Filtering.entity_kind ->
  methods:gir_method list ->
  properties:gir_property list ->
  l2
(** The methods and property accessors of the layer 2 class type and class, in
    emission order. *)

val l2_getter_name : gir_property -> string
val l2_setter_name : gir_property -> string

val names : ctx:generation_context -> entity -> doc_type_members
(** What [entity] emits at each layer, by GIR name. A property maps to the
    accessor a reference to it links to: the method that claims it as getter,
    else the generated getter, else the claiming setter, else the generated
    setter; a property with none emitted at a layer is absent from it. *)

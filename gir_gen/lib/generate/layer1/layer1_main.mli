(* Layer 1 Main - Public interface for OCaml .mli/.ml generation *)

val generate_ml_interface :
  ctx:Types.generation_context ->
  output_mode:Layer1_helpers.output_mode ->
  class_name:string ->
  class_doc:string option ->
  c_type:string ->
  parent_chain:string list ->
  constructors:Types.gir_constructor list option ->
  methods:Types.gir_method list ->
  properties:Types.gir_property list ->
  ?c_symbol_prefix:string ->
  entity_kind:Filtering.entity_kind ->
  ?from_gobject_c_name:string ->
  ?signals:Types.gir_signal list ->
  ?glib_get_type:string ->
  unit ->
  string
(** Generate a single OCaml interface (.mli) or implementation (.ml) string for
    a GObject class, interface, or record. *)

val generate_combined_ml_modules :
  ctx:Types.generation_context ->
  output_mode:Layer1_helpers.output_mode ->
  entities:Types.entity list ->
  parent_chain_for_entity:(string -> string list) ->
  ?from_gobject_c_name_for_entity:(Types.entity -> string option) ->
  unit ->
  string
(** Generate combined [module rec / and] ML text for a set of entities that have
    cyclic dependencies. *)

val generate_cycle_member_shim :
  output_mode:Layer1_helpers.output_mode ->
  namespace:string ->
  combined_module_name:string ->
  member_name:string ->
  member_c_type:string ->
  member_doc:string option ->
  string
(** The layer 1 module of a member of a cycle, outside the combined module:
    [include App_info_cycle_<hash>.File], with a signature that keeps its types
    equal to the combined module's. Gives other namespaces the path
    [Ocgio_raw.File]. The interface carries the member's module doc
    ({!Entity_doc.l1_module}). *)

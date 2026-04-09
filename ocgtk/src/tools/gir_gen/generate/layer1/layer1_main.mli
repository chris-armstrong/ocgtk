(* Layer 1 Main - Main interface generation functions for OCaml .mli/.ml files *)

val generate_ml_interface_internal :
  ctx:Types.generation_context ->
  output_mode:Layer1_helpers.output_mode ->
  class_name:string ->
  c_type:string ->
  constructors:Types.gir_constructor list option ->
  methods:Types.gir_method list ->
  properties:Types.gir_property list ->
  base_type:string ->
  ?c_symbol_prefix:string ->
  ?is_record:bool ->
  ?from_gobject_c_name:string ->
  Buffer.t ->
  unit
(** Generate the core interface content for a class/record. This is the internal
    version that writes to a buffer rather than returning a string. It generates
    type declarations, hierarchy accessors, constructors, methods, and
    properties. *)

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
  ?record_base_type:string ->
  ?is_record:bool ->
  ?from_gobject_c_name:string ->
  unit ->
  string
(** Generate a complete OCaml interface (.mli) or implementation (.ml) for a
    class. Returns the generated code as a string, including documentation
    header. *)

val generate_combined_ml_modules :
  ctx:Types.generation_context ->
  output_mode:Layer1_helpers.output_mode ->
  entities:Types.entity list ->
  parent_chain_for_entity:(string -> string list) ->
  ?from_gobject_c_name_for_entity:(Types.entity -> string option) ->
  unit ->
  string
(** Generate combined ML modules for entities with cyclic dependencies. This
    creates a module rec ... and ... structure containing all entities sorted
    alphabetically by name. Each entity's from_gobject C name is derived
    independently via from_gobject_c_name_for_entity, defaulting to None for
    all entities. *)

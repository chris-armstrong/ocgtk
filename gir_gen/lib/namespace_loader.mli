(** Loading a namespace for generation: parse its GIR file, apply its overrides,
    read the references files of the namespaces it depends on, and build the
    generation context.

    Every command that needs to know what the generator emits for a namespace
    loads it here, so the [generate] and [references] commands can't disagree
    about which entities and members exist. *)

type t = {
  ctx : Types.generation_context;
  entities : Types.entity list;
      (** The generated classes, interfaces and records, in that order. *)
  module_groups : Dependency_analysis.module_group list;
      (** The entities grouped into modules; each cycle becomes one module. *)
  header_overrides : Override_types.header_override list;
      (** Extra C headers from the overrides file. *)
  ignored_entities : string list;
      (** Names of the entities the overrides file ignores, for logging. *)
  override_warnings : string list;
      (** Override entries naming entities or components the GIR file lacks. *)
}

type error =
  | Override_error of { file : string; error : Override_parser.parse_error }
  | Reference_error of { file : string; reason : string }

val format_error : error -> string
(** A human-readable message naming the file that failed to load. *)

val load_reference_files :
  string list ->
  ( Types.generation_context_namespace_cross_references Types.StringMap.t,
    error )
  result
(** Read [*-references.sexp] files, as written by [gir_gen references], into the
    [cross_references] map of a generation context, keyed by namespace. *)

val build_generation_context :
  namespace:Types.gir_namespace ->
  repository:Types.gir_repository ->
  classes:Types.gir_class list ->
  interfaces:Types.gir_interface list ->
  enums:Types.gir_enum list ->
  bitfields:Types.gir_bitfield list ->
  records:Types.gir_record list ->
  constants:Types.gir_constant list ->
  cross_references:
    Types.generation_context_namespace_cross_references Types.StringMap.t ->
  Types.generation_context
  * Types.entity list
  * Dependency_analysis.module_group list
(** The generation context of a namespace whose overrides are already applied,
    its generated classes, interfaces and records, and their module groups.
    [ctx.records] keeps only the records that are generated; [ctx.classes] and
    [ctx.interfaces] keep every one, since type mapping needs them all. *)

val load :
  ?filter_classes:string list ->
  ?overrides_file:string ->
  reference_files:string list ->
  string ->
  (t, error) result
(** [load ~reference_files gir_file] loads the namespace in [gir_file].

    [filter_classes], when non-empty, restricts class parsing to the named
    classes. [overrides_file] is applied before the context is built, so that
    ignored entities are absent from it and members using their types are
    skipped. [reference_files] are the references files of the namespaces
    [gir_file] depends on; without them, members using their types are skipped
    too. *)

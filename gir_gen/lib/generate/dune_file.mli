val stub_batch_size : int

val order_stub_names_for_batching : string list -> string list
(** Sort the stub file names so that every namespace's enum converter file
    (ml_<ns>_enums_gen) lands inside the first batch: the native linker scans
    the batch archives in the reverse of the order they are listed, so batch_0
    is scanned last and its single-archive rescan is what resolves the mutual
    references between class stubs and their enum converters. *)

val list_chunks : int -> 'a list -> 'a list list

val pkg_config_name_of_namespace :
  ctx:Types.generation_context -> Types.StringMap.key -> string list

val collect_transitive_packages :
  ctx:Types.generation_context ->
  visited:Types.StringMap.key ContainersLabels.List.t ->
  Types.StringMap.key ->
  string ContainersLabels.List.t

val transitively_includes :
  ctx:Types.generation_context ->
  visited:Types.StringMap.key ContainersLabels.List.t ->
  target:string ->
  Types.StringMap.key ->
  bool

val dependency_namespaces :
  ctx:Types.generation_context -> repository:Types.gir_repository -> string list
(** The namespace's GIR includes and theirs, transitively, without the base
    namespaces that ocglib covers (GLib, GObject, ...). Sorted. *)

val emit_pkg_config_rule :
  Buffer.t ->
  cflag_file:string ->
  clink_file:string ->
  all_packages:string list ->
  is_optional:(string -> bool) ->
  unit

val emit_header_copy_rules : Buffer.t -> namespace:string -> unit
(** Rules copying [<ns>_decls.h] and [<ns>_core.h] into [<pkg>/raw/], where the
    raw library's [install_c_headers] finds them. *)

val emit_stub_library :
  Buffer.t ->
  name:string ->
  public_name:string option ->
  dep_libraries:string ->
  stub_names:string list ->
  cflag_file:string ->
  clink_file:string ->
  unit

val generate_raw_dune_inc :
  ctx:Types.generation_context ->
  namespace:string ->
  stub_names:string list ->
  repository:Types.gir_repository ->
  string
(** Content of [<pkg>/raw/generated/dune.inc], included by the hand-written
    [<pkg>/raw/dune] that declares the raw library: the pkg-config rule, the
    header copies, and the C stubs library [oc<ns>_raw_stubs] (split into
    batches when large), which depends on the other namespaces' raw libraries
    for their headers. *)

val generate_enums_dune : namespace:string -> string
(** Content of [<pkg>/enums/generated/dune]: library [oc<ns>.enums]. *)

val generate_main_dune :
  ctx:Types.generation_context ->
  namespace:string ->
  repository:Types.gir_repository ->
  string
(** Content of [<pkg>/generated/dune]: library [oc<ns>], depending on its own
    raw and enums libraries and the other namespaces' main libraries. *)

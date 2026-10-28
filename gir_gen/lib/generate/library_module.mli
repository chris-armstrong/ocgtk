(* Modules of a namespace's main library that re-export its raw and enums
   libraries. *)

open Types

val raw_module_aliases :
  ctx:generation_context ->
  entity_names:string list ->
  core_modules:string list ->
  (string * string) list
(** [(alias, path)] for each module of [raw.ml]: one per class, interface and
    record in [entity_names], sorted (e.g. [("Box", "Ocgraphene_raw.Box")]; a
    member of a cycle is its shim module), then one per hand-written module of
    [raw/core] in [core_modules] (e.g.
    [("Gio_volume_monitor_core", "Ocgio_raw.Gio_volume_monitor_core")]). *)

val generate_raw_module :
  ctx:generation_context ->
  entity_names:string list ->
  core_modules:string list ->
  string
(** Content of [raw.ml], from {!raw_module_aliases}. *)

val generate_enums_module : namespace:string -> string
(** Content of [enums.ml]: [include Ocgio_enums]. A source file cannot itself be
    an alias for another library's module, hence the [include]. *)

val modules_page_name : string
(** Name of the page {!generate_modules_page} writes: [modules], so the
    package's [index.mld] links it as [{!page-modules}]. *)

val generate_modules_page : namespace:string -> entities:entity list -> string
(** Content of [modules.mld]: one [{!modules: ...}] list each for the classes,
    interfaces and records in [entities], sorted, leaving out empty ones. The
    title names the kinds listed, e.g. "Gtk classes, interfaces and records". *)

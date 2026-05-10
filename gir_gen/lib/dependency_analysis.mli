(** Dependency analysis and SCC-based module grouping for GIR entities.

    Provides two layers of analysis:
    - Class-level: Tarjan SCC to group mutually-dependent classes into combined
      modules ({!compute_module_groups}).
    - Module-level: collapse the class graph to module granularity and test
      reachability ({!build_module_dependency_graph},
      {!module_reaches_module}). *)

open Types

(** A module group produced by SCC analysis.  [Single] wraps an entity that has
    no mutual dependency cycle; [Cycle] wraps two or more entities that do. *)
type module_group = Single of entity | Cycle of entity list

val compute_module_groups :
  generation_context -> entity list -> module_group list

val create_module_groups_table :
  module_group list -> (string, string) Hashtbl.t

val is_cyclic_group : module_group -> bool
val entities_of_group : module_group -> entity list
val module_name_of_group : module_group -> string

(** [build_module_dependency_graph ctx] collapses the class-level dependency
    graph to module granularity using [ctx.module_groups].

    Precondition: [ctx.module_groups] must be fully populated (i.e.
    {!create_module_groups_table} must have been called and stored in
    [ctx.module_groups]) before calling this function. *)
val build_module_dependency_graph :
  generation_context -> (string * string list) list

(** [module_reaches_module graph ~from_module ~to_module] returns [true] if
    [to_module] is reachable from [from_module] in [graph] (reflexive).
    Returns [false] when [from_module] is absent from the graph. *)
val module_reaches_module :
  (string * string list) list ->
  from_module:string ->
  to_module:string ->
  bool

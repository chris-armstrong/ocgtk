(** Dependency analysis and module ordering for GIR code generation.

    This module computes strongly-connected components (SCCs) of the
    inter-entity dependency graph and groups entities into module
    groups.  A single entity with no cyclic dependencies becomes a
    [Single] group, while a cycle of mutually-dependent entities
    becomes a [Cycle] group.  *)

open Types

(** A module group is either a single entity or a cycle of mutually
    dependent entities. *)
type module_group = Single of entity | Cycle of entity list

(** [compute_module_groups ctx entities] computes SCC-based module
    groups for the given [entities] in context [ctx]. *)
val compute_module_groups : generation_context -> entity list -> module_group list

(** [create_module_groups_table groups] creates a hashtable mapping
    each class name to the module name of the group it belongs to. *)
val create_module_groups_table : module_group list -> (string, string) Hashtbl.t

(** [is_cyclic_group group] returns [true] if [group] is a [Cycle]. *)
val is_cyclic_group : module_group -> bool

(** [entities_of_group group] returns the list of entities contained
    in [group]. *)
val entities_of_group : module_group -> entity list

(** [module_name_of_group group] returns the OCaml module name for
    [group]. *)
val module_name_of_group : module_group -> string

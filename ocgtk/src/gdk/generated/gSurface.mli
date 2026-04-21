(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Surface from cyclic group App_launch_context_cycle_de440b34 *)

class type surface_t = GApp_launch_context_cycle_de440b34.surface_t

class surface : App_launch_context_cycle_de440b34.Surface.t -> surface_t

val new_popup :
  GApp_launch_context_cycle_de440b34.surface_t -> bool -> surface_t

val new_toplevel : GApp_launch_context_cycle_de440b34.display_t -> surface_t

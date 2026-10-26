(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Surface from cyclic group App_launch_context_cycle_de440b34 *)

class type surface_t = GApp_launch_context_cycle_de440b34.surface_t

class surface = GApp_launch_context_cycle_de440b34.surface

let new_popup (parent : GApp_launch_context_cycle_de440b34.surface_t)
    (autohide : bool) : surface_t =
  let parent = parent#as_surface in
  let obj_ =
    App_launch_context_cycle_de440b34.Surface.new_popup parent autohide
  in
  new surface obj_

let new_toplevel (display : GApp_launch_context_cycle_de440b34.display_t) :
    surface_t =
  let display = display#as_display in
  let obj_ = App_launch_context_cycle_de440b34.Surface.new_toplevel display in
  new surface obj_

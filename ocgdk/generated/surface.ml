(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Surface from cyclic group App_launch_context_cycle_de440b34 *)

class type surface_t = App_launch_context_cycle_de440b34.surface_t

class surface = App_launch_context_cycle_de440b34.surface

let new_popup (parent : App_launch_context_cycle_de440b34.surface_t)
    (autohide : bool) : surface_t =
  let parent = parent#as_surface in
  let obj_ = Raw.Surface.new_popup parent autohide in
  new surface obj_

let new_toplevel (display : App_launch_context_cycle_de440b34.display_t) :
    surface_t =
  let display = display#as_display in
  let obj_ = Raw.Surface.new_toplevel display in
  new surface obj_

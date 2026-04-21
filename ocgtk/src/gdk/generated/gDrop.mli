class type drop_t = object
  method finish : Gdk_enums.dragaction -> unit
  method get_actions : unit -> Gdk_enums.dragaction
  method get_device : unit -> GApp_launch_context_cycle_de440b34.device_t
  method get_display : unit -> GApp_launch_context_cycle_de440b34.display_t
  method get_drag : unit -> GDrag.drag_t option
  method get_formats : unit -> Content_formats.t
  method get_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t
  method status : Gdk_enums.dragaction -> Gdk_enums.dragaction -> unit
  method as_drop : Drop.t
end

class drop : Drop.t -> drop_t

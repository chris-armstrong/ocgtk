class type drop_t = object
  method finish : Enums.dragaction -> unit
  method get_actions : unit -> Enums.dragaction
  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  method get_drag : unit -> Drag.drag_t option
  method get_formats : unit -> Raw.Content_formats.t
  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t

  method read_value_finish :
    Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result

  method status : Enums.dragaction -> Enums.dragaction -> unit
  method as_drop : Raw.Drop.t
end

class drop : Raw.Drop.t -> drop_t

class type drag_t = object
  method on_cancel :
    ?after:bool ->
    callback:(reason:Enums.dragcancelreason -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_dnd_finished :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_drop_performed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method drop_done : bool -> unit
  method get_actions : unit -> Enums.dragaction
  method get_content : unit -> Content_provider.content_provider_t
  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t

  method get_drag_surface :
    unit -> App_launch_context_cycle_de440b34.surface_t option

  method get_formats : unit -> Raw.Content_formats.t
  method get_selected_action : unit -> Enums.dragaction
  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  method set_hotspot : int -> int -> unit
  method as_drag : Raw.Drag.t
end

class drag : Raw.Drag.t -> drag_t

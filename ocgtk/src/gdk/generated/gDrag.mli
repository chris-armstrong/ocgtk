class type drag_t = object
  method on_cancel :
    callback:(reason:Gdk_enums.dragcancelreason -> unit) ->
    Gobject.Signal.handler_id

  method on_dnd_finished : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_drop_performed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method drop_done : bool -> unit
  method get_actions : unit -> Gdk_enums.dragaction
  method get_content : unit -> GContent_provider.content_provider_t
  method get_device : unit -> GApp_launch_context_cycle_de440b34.device_t
  method get_display : unit -> GApp_launch_context_cycle_de440b34.display_t

  method get_drag_surface :
    unit -> GApp_launch_context_cycle_de440b34.surface_t option

  method get_formats : unit -> Content_formats.t
  method get_selected_action : unit -> Gdk_enums.dragaction
  method get_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t
  method set_hotspot : int -> int -> unit
  method as_drag : Drag.t
end

class drag : Drag.t -> drag_t

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

(* High-level class for Drag *)
class drag (obj : Drag.t) : drag_t =
  object (self)
    method on_cancel ~callback = Drag.on_cancel self#as_drag ~callback

    method on_dnd_finished ~callback =
      Drag.on_dnd_finished self#as_drag ~callback

    method on_drop_performed ~callback =
      Drag.on_drop_performed self#as_drag ~callback

    method drop_done : bool -> unit = fun success -> Drag.drop_done obj success

    method get_actions : unit -> Gdk_enums.dragaction =
      fun () -> Drag.get_actions obj

    method get_content : unit -> GContent_provider.content_provider_t =
      fun () -> new GContent_provider.content_provider (Drag.get_content obj)

    method get_device : unit -> GApp_launch_context_cycle_de440b34.device_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.device (Drag.get_device obj)

    method get_display : unit -> GApp_launch_context_cycle_de440b34.display_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.display (Drag.get_display obj)

    method get_drag_surface :
        unit -> GApp_launch_context_cycle_de440b34.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new GApp_launch_context_cycle_de440b34.surface ret)
          (Drag.get_drag_surface obj)

    method get_formats : unit -> Content_formats.t =
      fun () -> Drag.get_formats obj

    method get_selected_action : unit -> Gdk_enums.dragaction =
      fun () -> Drag.get_selected_action obj

    method get_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.surface (Drag.get_surface obj)

    method set_hotspot : int -> int -> unit =
      fun hot_x hot_y -> Drag.set_hotspot obj hot_x hot_y

    method as_drag = obj
  end

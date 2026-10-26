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

(* High-level class for Drag *)
class drag (obj : Raw.Drag.t) : drag_t =
  object (self)
    method on_cancel ?(after = false) ~callback () =
      Raw.Drag.on_cancel ~after self#as_drag ~callback

    method on_dnd_finished ?(after = false) ~callback () =
      Raw.Drag.on_dnd_finished ~after self#as_drag ~callback

    method on_drop_performed ?(after = false) ~callback () =
      Raw.Drag.on_drop_performed ~after self#as_drag ~callback

    method drop_done : bool -> unit =
      fun success -> Raw.Drag.drop_done obj success

    method get_actions : unit -> Enums.dragaction =
      fun () -> Raw.Drag.get_actions obj

    method get_content : unit -> Content_provider.content_provider_t =
      fun () -> new Content_provider.content_provider (Raw.Drag.get_content obj)

    method get_device : unit -> App_launch_context_cycle_de440b34.device_t =
      fun () ->
        new App_launch_context_cycle_de440b34.device (Raw.Drag.get_device obj)

    method get_display : unit -> App_launch_context_cycle_de440b34.display_t =
      fun () ->
        new App_launch_context_cycle_de440b34.display (Raw.Drag.get_display obj)

    method get_drag_surface :
        unit -> App_launch_context_cycle_de440b34.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.surface ret)
          (Raw.Drag.get_drag_surface obj)

    method get_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Drag.get_formats obj

    method get_selected_action : unit -> Enums.dragaction =
      fun () -> Raw.Drag.get_selected_action obj

    method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new App_launch_context_cycle_de440b34.surface (Raw.Drag.get_surface obj)

    method set_hotspot : int -> int -> unit =
      fun hot_x hot_y -> Raw.Drag.set_hotspot obj hot_x hot_y

    method as_drag = obj
  end

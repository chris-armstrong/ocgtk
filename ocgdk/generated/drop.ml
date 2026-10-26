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

(* High-level class for Drop *)
class drop (obj : Raw.Drop.t) : drop_t =
  object (self)
    method finish : Enums.dragaction -> unit =
      fun action -> Raw.Drop.finish obj action

    method get_actions : unit -> Enums.dragaction =
      fun () -> Raw.Drop.get_actions obj

    method get_device : unit -> App_launch_context_cycle_de440b34.device_t =
      fun () ->
        new App_launch_context_cycle_de440b34.device (Raw.Drop.get_device obj)

    method get_display : unit -> App_launch_context_cycle_de440b34.display_t =
      fun () ->
        new App_launch_context_cycle_de440b34.display (Raw.Drop.get_display obj)

    method get_drag : unit -> Drag.drag_t option =
      fun () ->
        Option.map (fun ret -> new Drag.drag ret) (Raw.Drop.get_drag obj)

    method get_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Drop.get_formats obj

    method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new App_launch_context_cycle_de440b34.surface (Raw.Drop.get_surface obj)

    method read_value_finish :
        Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Drop.read_value_finish obj result

    method status : Enums.dragaction -> Enums.dragaction -> unit =
      fun actions preferred -> Raw.Drop.status obj actions preferred

    method as_drop = obj
  end

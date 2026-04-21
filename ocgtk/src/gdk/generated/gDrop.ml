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

(* High-level class for Drop *)
class drop (obj : Drop.t) : drop_t =
  object (self)
    method finish : Gdk_enums.dragaction -> unit =
      fun action -> Drop.finish obj action

    method get_actions : unit -> Gdk_enums.dragaction =
      fun () -> Drop.get_actions obj

    method get_device : unit -> GApp_launch_context_cycle_de440b34.device_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.device (Drop.get_device obj)

    method get_display : unit -> GApp_launch_context_cycle_de440b34.display_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.display (Drop.get_display obj)

    method get_drag : unit -> GDrag.drag_t option =
      fun () -> Option.map (fun ret -> new GDrag.drag ret) (Drop.get_drag obj)

    method get_formats : unit -> Content_formats.t =
      fun () -> Drop.get_formats obj

    method get_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.surface (Drop.get_surface obj)

    method status : Gdk_enums.dragaction -> Gdk_enums.dragaction -> unit =
      fun actions preferred -> Drop.status obj actions preferred

    method as_drop = obj
  end

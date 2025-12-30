(* High-level class for GraphicsOffload *)
class graphics_offload (obj : Graphics_offload.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Graphics_offload.as_widget obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Graphics_offload.get_child obj)

  method get_enabled : unit -> Gtk_enums.graphicsoffloadenabled =
    fun () ->
      (Graphics_offload.get_enabled obj)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Graphics_offload.set_child obj child)

  method set_enabled : Gtk_enums.graphicsoffloadenabled -> unit =
    fun enabled ->
      (Graphics_offload.set_enabled obj enabled)

  method as_widget = (Graphics_offload.as_widget obj)
    method as_graphics_offload = obj
end


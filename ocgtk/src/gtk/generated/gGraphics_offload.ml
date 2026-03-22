class type graphics_offload_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_enabled : unit -> Gtk_enums.graphicsoffloadenabled
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_enabled : Gtk_enums.graphicsoffloadenabled -> unit
    method as_graphics_offload : Graphics_offload.t
end

(* High-level class for GraphicsOffload *)
class graphics_offload (obj : Graphics_offload.t) : graphics_offload_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Graphics_offload.get_child obj)

  method get_enabled : unit -> Gtk_enums.graphicsoffloadenabled =
    fun () ->
      (Graphics_offload.get_enabled obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Graphics_offload.set_child obj child)

  method set_enabled : Gtk_enums.graphicsoffloadenabled -> unit =
    fun enabled ->
      (Graphics_offload.set_enabled obj enabled)

    method as_graphics_offload = obj
end

let new_ (child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option) : graphics_offload_t =
  let child = Option.map (fun c -> c#as_widget) child in
  new graphics_offload (Graphics_offload.new_ child)


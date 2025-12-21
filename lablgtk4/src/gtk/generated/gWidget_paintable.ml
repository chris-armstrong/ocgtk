(* High-level class for WidgetPaintable *)
class widget_paintable (obj : Widget_paintable.t) = object (self)

  method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Widget_paintable.get_widget obj)

  method set_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Widget_paintable.set_widget obj widget)

    method as_widget_paintable = obj
end


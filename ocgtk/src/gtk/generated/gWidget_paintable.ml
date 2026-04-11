class type widget_paintable_t = object
  inherit Ocgtk_gdk.Gdk.Paintable.paintable_t

  method get_widget :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method set_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method as_widget_paintable : Widget_paintable.t
end

(* High-level class for WidgetPaintable *)
class widget_paintable (obj : Widget_paintable.t) : widget_paintable_t =
  object (self)
    inherit
      Ocgtk_gdk.Gdk.Paintable.paintable
        (Ocgtk_gdk.Gdk.Wrappers.Paintable.from_gobject obj)

    method get_widget :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Widget_paintable.get_widget obj)

    method set_widget :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Widget_paintable.set_widget obj widget

    method as_widget_paintable = obj
  end

let new_
    (widget :
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget_t
      option) : widget_paintable_t =
  let widget = Option.map (fun c -> c#as_widget) widget in
  let obj_ = Widget_paintable.new_ widget in
  new widget_paintable obj_

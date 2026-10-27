class type widget_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the widget that is observed or [NULL] if none. *)

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the widget that should be observed. *)

  method as_widget_paintable : Raw.Widget_paintable.t
end

(* High-level class for WidgetPaintable *)
class widget_paintable (obj : Raw.Widget_paintable.t) : widget_paintable_t =
  object (self)
    inherit Ocgdk.Paintable.paintable (Ocgdk.Raw.Paintable.from_gobject obj)

    method get_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Widget_paintable.get_widget obj)

    method set_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Widget_paintable.set_widget obj widget

    method as_widget_paintable = obj
  end

let new_
    (widget :
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget_t
      option) : widget_paintable_t =
  let widget = Option.map (fun c -> c#as_widget) widget in
  let obj_ = Raw.Widget_paintable.new_ widget in
  new widget_paintable obj_

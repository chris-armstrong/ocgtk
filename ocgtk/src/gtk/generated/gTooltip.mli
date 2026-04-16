class type tooltip_t = object
  method set_custom :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_icon : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit
  method set_icon_from_gicon : Ocgtk_gio.Gio.Icon.icon_t option -> unit
  method set_icon_from_icon_name : string option -> unit
  method set_markup : string option -> unit
  method set_text : string option -> unit
  method set_tip_area : Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> unit
  method as_tooltip : Tooltip.t
end

class tooltip : Tooltip.t -> tooltip_t

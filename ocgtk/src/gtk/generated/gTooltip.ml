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

(* High-level class for Tooltip *)
class tooltip (obj : Tooltip.t) : tooltip_t =
  object (self)
    method set_custom :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun custom_widget ->
        let custom_widget = Option.map (fun c -> c#as_widget) custom_widget in
        Tooltip.set_custom obj custom_widget

    method set_icon : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit =
      fun paintable ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Tooltip.set_icon obj paintable

    method set_icon_from_gicon : Ocgtk_gio.Gio.Icon.icon_t option -> unit =
      fun gicon ->
        let gicon = Option.map (fun c -> c#as_icon) gicon in
        Tooltip.set_icon_from_gicon obj gicon

    method set_icon_from_icon_name : string option -> unit =
      fun icon_name -> Tooltip.set_icon_from_icon_name obj icon_name

    method set_markup : string option -> unit =
      fun markup -> Tooltip.set_markup obj markup

    method set_text : string option -> unit =
      fun text -> Tooltip.set_text obj text

    method set_tip_area : Ocgtk_gdk.Gdk.Rectangle.rectangle_t -> unit =
      fun rect ->
        let rect = rect#as_rectangle in
        Tooltip.set_tip_area obj rect

    method as_tooltip = obj
  end

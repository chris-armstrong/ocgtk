class type color_chooser_widget_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GColor_chooser.color_chooser_t
  method show_editor : bool
  method set_show_editor : bool -> unit
  method as_color_chooser_widget : Color_chooser_widget.t
end

class color_chooser_widget : Color_chooser_widget.t -> color_chooser_widget_t

val new_ : unit -> color_chooser_widget_t

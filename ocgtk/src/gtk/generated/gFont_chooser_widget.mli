class type font_chooser_widget_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GFont_chooser.font_chooser_t
  method tweak_action : Ocgtk_gio.Gio.Action.action_t
  method as_font_chooser_widget : Font_chooser_widget.t
end

class font_chooser_widget : Font_chooser_widget.t -> font_chooser_widget_t

val new_ : unit -> font_chooser_widget_t

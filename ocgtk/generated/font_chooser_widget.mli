class type font_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t
  method tweak_action : Ocgio.Action.action_t
  method as_font_chooser_widget : Raw.Font_chooser_widget.t
end

class font_chooser_widget : Raw.Font_chooser_widget.t -> font_chooser_widget_t

val new_ : unit -> font_chooser_widget_t

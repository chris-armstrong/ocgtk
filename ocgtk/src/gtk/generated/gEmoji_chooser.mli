class emoji_chooser : Emoji_chooser.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gemoji_chooser_signals.emoji_chooser_signals
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_emoji_chooser : Emoji_chooser.t
  end


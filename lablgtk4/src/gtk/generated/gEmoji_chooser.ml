(* Signal class defined in gemoji_chooser_signals.ml *)

(* High-level class for EmojiChooser *)
class emoji_chooser (obj : Emoji_chooser.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Emoji_chooser.as_widget obj)
  inherit Gemoji_chooser_signals.emoji_chooser_signals obj

  method as_widget = (Emoji_chooser.as_widget obj)
    method as_emoji_chooser = obj
end


(* Signal class defined in gemoji_chooser_signals.ml *)

(* High-level class for EmojiChooser *)
class emoji_chooser (obj : Emoji_chooser.t) = object (self)
  inherit Gemoji_chooser_signals.emoji_chooser_signals obj

    method as_emoji_chooser = obj
end


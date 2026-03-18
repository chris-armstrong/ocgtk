class emoji_chooser : Emoji_chooser.t ->
  object
    inherit Gemoji_chooser_signals.emoji_chooser_signals
    method as_emoji_chooser : Emoji_chooser.t
  end


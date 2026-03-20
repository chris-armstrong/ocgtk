class type emoji_chooser_t = object
    inherit Gemoji_chooser_signals.emoji_chooser_signals
    method as_emoji_chooser : Emoji_chooser.t
end

class emoji_chooser : Emoji_chooser.t -> emoji_chooser_t


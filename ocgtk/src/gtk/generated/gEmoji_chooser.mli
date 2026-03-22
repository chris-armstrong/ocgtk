class type emoji_chooser_t = object
    inherit GPopover.popover_t
    inherit Gemoji_chooser_signals.emoji_chooser_signals
    method as_emoji_chooser : Emoji_chooser.t
end

class emoji_chooser : Emoji_chooser.t -> emoji_chooser_t

val new_ : unit -> emoji_chooser_t

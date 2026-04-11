(* Signal class defined in gemoji_chooser_signals.ml *)

class type emoji_chooser_t = object
    inherit GPopover.popover_t
    inherit Gemoji_chooser_signals.emoji_chooser_signals
    method as_emoji_chooser : Emoji_chooser.t
end

(* High-level class for EmojiChooser *)
class emoji_chooser (obj : Emoji_chooser.t) : emoji_chooser_t = object (self)
  inherit GPopover.popover (obj :> Popover.t)
  inherit Gemoji_chooser_signals.emoji_chooser_signals obj

    method as_emoji_chooser = obj
end

let new_ () : emoji_chooser_t =
  new emoji_chooser (Emoji_chooser.new_ ())


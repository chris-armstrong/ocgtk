class type emoji_chooser_t = object
  inherit GPopover.popover_t

  method on_emoji_picked :
    callback:(text:string -> unit) -> Gobject.Signal.handler_id

  method as_emoji_chooser : Emoji_chooser.t
end

(* High-level class for EmojiChooser *)
class emoji_chooser (obj : Emoji_chooser.t) : emoji_chooser_t =
  object (self)
    inherit GPopover.popover (obj :> Popover.t)

    method on_emoji_picked ~callback =
      Emoji_chooser.on_emoji_picked self#as_emoji_chooser ~callback

    method as_emoji_chooser = obj
  end

let new_ () : emoji_chooser_t = new emoji_chooser (Emoji_chooser.new_ ())

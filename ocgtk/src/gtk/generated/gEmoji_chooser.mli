class type emoji_chooser_t = object
    inherit GPopover.popover_t
    method on_emoji_picked : ?after:bool -> callback:(text:string -> unit) -> unit -> Gobject.Signal.handler_id
    method as_emoji_chooser : Emoji_chooser.t
end

class emoji_chooser : Emoji_chooser.t -> emoji_chooser_t

val new_ : unit -> emoji_chooser_t

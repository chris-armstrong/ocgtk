class type emoji_chooser_t = object
  inherit Popover.popover_t

  (** {2:signals Signals} *)

  method on_emoji_picked :
    ?after:bool ->
    callback:(text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user selects an Emoji. *)

  (** {2:conversions Conversions} *)

  method as_emoji_chooser : Raw.Emoji_chooser.t
end

(* High-level class for EmojiChooser *)
class emoji_chooser (obj : Raw.Emoji_chooser.t) : emoji_chooser_t =
  object (self)
    inherit Popover.popover (obj :> Raw.Popover.t)

    method on_emoji_picked ?(after = false) ~callback () =
      Raw.Emoji_chooser.on_emoji_picked ~after self#as_emoji_chooser ~callback

    method as_emoji_chooser = obj
  end

let new_ () : emoji_chooser_t = new emoji_chooser (Raw.Emoji_chooser.new_ ())

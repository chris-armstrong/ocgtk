class type statusbar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_text_popped :
    ?after:bool ->
    callback:(context_id:int -> text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_text_pushed :
    ?after:bool ->
    callback:(context_id:int -> text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_context_id : string -> int
  method pop : int -> unit
  method push : int -> string -> int
  method remove : int -> int -> unit
  method remove_all : int -> unit
  method as_statusbar : Raw.Statusbar.t
end

(* High-level class for Statusbar *)
class statusbar (obj : Raw.Statusbar.t) : statusbar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_text_popped ?(after = false) ~callback () =
      Raw.Statusbar.on_text_popped ~after self#as_statusbar ~callback

    method on_text_pushed ?(after = false) ~callback () =
      Raw.Statusbar.on_text_pushed ~after self#as_statusbar ~callback

    method get_context_id : string -> int =
      fun context_description ->
        Raw.Statusbar.get_context_id obj context_description

    method pop : int -> unit =
      fun context_id -> Raw.Statusbar.pop obj context_id

    method push : int -> string -> int =
      fun context_id text -> Raw.Statusbar.push obj context_id text

    method remove : int -> int -> unit =
      fun context_id message_id ->
        Raw.Statusbar.remove obj context_id message_id

    method remove_all : int -> unit =
      fun context_id -> Raw.Statusbar.remove_all obj context_id

    method as_statusbar = obj
  end

let new_ () : statusbar_t = new statusbar (Raw.Statusbar.new_ ())

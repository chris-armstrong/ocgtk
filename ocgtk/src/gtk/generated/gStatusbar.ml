class type statusbar_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_text_popped :
    callback:(context_id:int -> text:string -> unit) ->
    Gobject.Signal.handler_id

  method on_text_pushed :
    callback:(context_id:int -> text:string -> unit) ->
    Gobject.Signal.handler_id

  method get_context_id : string -> int
  method pop : int -> unit
  method push : int -> string -> int
  method remove : int -> int -> unit
  method remove_all : int -> unit
  method as_statusbar : Statusbar.t
end

(* High-level class for Statusbar *)
class statusbar (obj : Statusbar.t) : statusbar_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method on_text_popped ~callback =
      Statusbar.on_text_popped self#as_statusbar ~callback

    method on_text_pushed ~callback =
      Statusbar.on_text_pushed self#as_statusbar ~callback

    method get_context_id : string -> int =
      fun context_description ->
        Statusbar.get_context_id obj context_description

    method pop : int -> unit = fun context_id -> Statusbar.pop obj context_id

    method push : int -> string -> int =
      fun context_id text -> Statusbar.push obj context_id text

    method remove : int -> int -> unit =
      fun context_id message_id -> Statusbar.remove obj context_id message_id

    method remove_all : int -> unit =
      fun context_id -> Statusbar.remove_all obj context_id

    method as_statusbar = obj
  end

let new_ () : statusbar_t = new statusbar (Statusbar.new_ ())

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

class statusbar : Statusbar.t -> statusbar_t

val new_ : unit -> statusbar_t

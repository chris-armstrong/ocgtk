class type statusbar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gstatusbar_signals.statusbar_signals
    method get_context_id : string -> int
    method pop : int -> unit
    method push : int -> string -> int
    method remove : int -> int -> unit
    method remove_all : int -> unit
    method as_statusbar : Statusbar.t
end

class statusbar : Statusbar.t -> statusbar_t

val new_ : unit -> statusbar_t

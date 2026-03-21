class type statusbar_t = object
    inherit Gstatusbar_signals.statusbar_signals
    method get_context_id : string -> int
    method pop : int -> unit
    method push : int -> string -> int
    method remove : int -> int -> unit
    method remove_all : int -> unit
    method as_statusbar : Statusbar.t
end

class statusbar : Statusbar.t -> statusbar_t


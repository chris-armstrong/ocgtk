(* Signal class defined in gstatusbar_signals.ml *)

class type statusbar_t = object
    inherit Gstatusbar_signals.statusbar_signals
    method get_context_id : string -> int
    method pop : int -> unit
    method push : int -> string -> int
    method remove : int -> int -> unit
    method remove_all : int -> unit
    method as_statusbar : Statusbar.t
end

(* High-level class for Statusbar *)
class statusbar (obj : Statusbar.t) : statusbar_t = object (self)
  inherit Gstatusbar_signals.statusbar_signals obj

  method get_context_id : string -> int =
    fun context_description ->
      (Statusbar.get_context_id obj context_description)

  method pop : int -> unit =
    fun context_id ->
      (Statusbar.pop obj context_id)

  method push : int -> string -> int =
    fun context_id text ->
      (Statusbar.push obj context_id text)

  method remove : int -> int -> unit =
    fun context_id message_id ->
      (Statusbar.remove obj context_id message_id)

  method remove_all : int -> unit =
    fun context_id ->
      (Statusbar.remove_all obj context_id)

    method as_statusbar = obj
end


(* Signal class defined in gstatusbar_signals.ml *)

(* High-level class for Statusbar *)
class statusbar (obj : Statusbar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Statusbar.as_widget obj)
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

  method as_widget = (Statusbar.as_widget obj)
    method as_statusbar = obj
end


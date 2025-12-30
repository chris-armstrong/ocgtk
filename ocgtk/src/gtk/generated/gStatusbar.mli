class statusbar : Statusbar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gstatusbar_signals.statusbar_signals
    method get_context_id : string -> int
    method pop : int -> unit
    method push : int -> string -> int
    method remove : int -> int -> unit
    method remove_all : int -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_statusbar : Statusbar.t
  end


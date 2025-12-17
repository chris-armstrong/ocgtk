class link_button : Link_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glink_button_signals.link_button_signals
    method get_uri : unit -> string
    method get_visited : unit -> bool
    method set_uri : string -> unit
    method set_visited : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_link_button : Link_button.t
  end


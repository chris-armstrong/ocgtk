class info_bar : Info_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Ginfo_bar_signals.info_bar_signals
    method add_action_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> unit
    method add_button : string -> int -> GButton.button
    method add_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method get_message_type : unit -> Gtk_enums.messagetype
    method get_revealed : unit -> bool
    method get_show_close_button : unit -> bool
    method remove_action_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method response : int -> unit
    method set_default_response : int -> unit
    method set_message_type : Gtk_enums.messagetype -> unit
    method set_response_sensitive : int -> bool -> unit
    method set_revealed : bool -> unit
    method set_show_close_button : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_info_bar : Info_bar.t
  end


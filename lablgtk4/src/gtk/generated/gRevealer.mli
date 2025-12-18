class revealer : Revealer.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method child_revealed : bool
    method reveal_child : bool
    method set_reveal_child : bool -> unit
    method transition_duration : int
    method set_transition_duration : int -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_transition_type : unit -> Gtk_enums.revealertransitiontype
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_transition_type : Gtk_enums.revealertransitiontype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_revealer : Revealer.t
  end


class popover : Popover.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gpopover_signals.popover_signals
    method autohide : bool
    method set_autohide : bool -> unit
    method cascade_popdown : bool
    method set_cascade_popdown : bool -> unit
    method has_arrow : bool
    method set_has_arrow : bool -> unit
    method mnemonics_visible : bool
    method set_mnemonics_visible : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_position : unit -> Gtk_enums.positiontype
    method popdown : unit -> unit
    method popup : unit -> unit
    method present : unit -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_default_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_offset : int -> int -> unit
    method set_position : Gtk_enums.positiontype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_popover : Popover.t
  end


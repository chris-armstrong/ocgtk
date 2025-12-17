class expander : Expander.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gexpander_signals.expander_signals
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_expanded : unit -> bool
    method get_label : unit -> string option
    method get_label_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_resize_toplevel : unit -> bool
    method get_use_markup : unit -> bool
    method get_use_underline : unit -> bool
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_expanded : bool -> unit
    method set_label : string option -> unit
    method set_label_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_resize_toplevel : bool -> unit
    method set_use_markup : bool -> unit
    method set_use_underline : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_expander : Expander.t
  end


class scrolled_window : Scrolled_window.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gscrolled_window_signals.scrolled_window_signals
    method has_frame : bool
    method set_has_frame : bool -> unit
    method kinetic_scrolling : bool
    method set_kinetic_scrolling : bool -> unit
    method max_content_height : int
    method set_max_content_height : int -> unit
    method max_content_width : int
    method set_max_content_width : int -> unit
    method min_content_height : int
    method set_min_content_height : int -> unit
    method min_content_width : int
    method set_min_content_width : int -> unit
    method overlay_scrolling : bool
    method set_overlay_scrolling : bool -> unit
    method propagate_natural_height : bool
    method set_propagate_natural_height : bool -> unit
    method propagate_natural_width : bool
    method set_propagate_natural_width : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_hadjustment : unit -> GAdjustment.adjustment
    method get_hscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_placement : unit -> Gtk_enums.cornertype
    method get_vadjustment : unit -> GAdjustment.adjustment
    method get_vscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_hadjustment : #GAdjustment.adjustment option -> unit
    method set_placement : Gtk_enums.cornertype -> unit
    method set_policy : Gtk_enums.policytype -> Gtk_enums.policytype -> unit
    method set_vadjustment : #GAdjustment.adjustment option -> unit
    method unset_placement : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scrolled_window : Scrolled_window.t
  end


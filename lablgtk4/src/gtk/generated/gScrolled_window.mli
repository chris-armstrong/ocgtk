class scrolled_window : Scrolled_window.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gscrolled_window_signals.scrolled_window_signals
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_hadjustment : unit -> GAdjustment.adjustment
    method get_has_frame : unit -> bool
    method get_hscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_kinetic_scrolling : unit -> bool
    method get_max_content_height : unit -> int
    method get_max_content_width : unit -> int
    method get_min_content_height : unit -> int
    method get_min_content_width : unit -> int
    method get_overlay_scrolling : unit -> bool
    method get_placement : unit -> Gtk_enums.cornertype
    method get_propagate_natural_height : unit -> bool
    method get_propagate_natural_width : unit -> bool
    method get_vadjustment : unit -> GAdjustment.adjustment
    method get_vscrollbar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_hadjustment : #GAdjustment.adjustment option -> unit
    method set_has_frame : bool -> unit
    method set_kinetic_scrolling : bool -> unit
    method set_max_content_height : int -> unit
    method set_max_content_width : int -> unit
    method set_min_content_height : int -> unit
    method set_min_content_width : int -> unit
    method set_overlay_scrolling : bool -> unit
    method set_placement : Gtk_enums.cornertype -> unit
    method set_policy : Gtk_enums.policytype -> Gtk_enums.policytype -> unit
    method set_propagate_natural_height : bool -> unit
    method set_propagate_natural_width : bool -> unit
    method set_vadjustment : #GAdjustment.adjustment option -> unit
    method unset_placement : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scrolled_window : Scrolled_window.t
  end


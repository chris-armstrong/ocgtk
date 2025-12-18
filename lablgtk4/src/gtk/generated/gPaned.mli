class paned : Paned.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gpaned_signals.paned_signals
    method max_position : int
    method min_position : int
    method position : int
    method set_position : int -> unit
    method position_set : bool
    method set_position_set : bool -> unit
    method resize_end_child : bool
    method set_resize_end_child : bool -> unit
    method resize_start_child : bool
    method set_resize_start_child : bool -> unit
    method shrink_end_child : bool
    method set_shrink_end_child : bool -> unit
    method shrink_start_child : bool
    method set_shrink_start_child : bool -> unit
    method wide_handle : bool
    method set_wide_handle : bool -> unit
    method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_end_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_start_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_paned : Paned.t
  end


class paned : Paned.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gpaned_signals.paned_signals
    method get_end_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_position : unit -> int
    method get_resize_end_child : unit -> bool
    method get_resize_start_child : unit -> bool
    method get_shrink_end_child : unit -> bool
    method get_shrink_start_child : unit -> bool
    method get_start_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_wide_handle : unit -> bool
    method set_end_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_position : int -> unit
    method set_resize_end_child : bool -> unit
    method set_resize_start_child : bool -> unit
    method set_shrink_end_child : bool -> unit
    method set_shrink_start_child : bool -> unit
    method set_start_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_wide_handle : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_paned : Paned.t
  end


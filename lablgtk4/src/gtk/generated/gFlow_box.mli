class flow_box : Flow_box.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gflow_box_signals.flow_box_signals
    method accept_unpaired_release : bool
    method set_accept_unpaired_release : bool -> unit
    method activate_on_single_click : bool
    method set_activate_on_single_click : bool -> unit
    method column_spacing : int
    method set_column_spacing : int -> unit
    method homogeneous : bool
    method set_homogeneous : bool -> unit
    method max_children_per_line : int
    method set_max_children_per_line : int -> unit
    method min_children_per_line : int
    method set_min_children_per_line : int -> unit
    method row_spacing : int
    method set_row_spacing : int -> unit
    method append : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method get_child_at_index : int -> GFlow_box_child.flow_box_child option
    method get_child_at_pos : int -> int -> GFlow_box_child.flow_box_child option
    method get_selection_mode : unit -> Gtk_enums.selectionmode
    method insert : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> unit
    method invalidate_filter : unit -> unit
    method invalidate_sort : unit -> unit
    method prepend : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove_all : unit -> unit
    method select_all : unit -> unit
    method select_child : #GFlow_box_child.flow_box_child -> unit
    method set_hadjustment : #GAdjustment.adjustment -> unit
    method set_selection_mode : Gtk_enums.selectionmode -> unit
    method set_vadjustment : #GAdjustment.adjustment -> unit
    method unselect_all : unit -> unit
    method unselect_child : #GFlow_box_child.flow_box_child -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_flow_box : Flow_box.t
  end


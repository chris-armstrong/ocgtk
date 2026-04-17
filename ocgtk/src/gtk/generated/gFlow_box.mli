class type flow_box_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GOrientable.orientable_t
  inherit Gflow_box_signals.flow_box_signals

  method append :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method get_activate_on_single_click : unit -> bool
  method get_child_at_index : int -> GFlow_box_child.flow_box_child_t option

  method get_child_at_pos :
    int -> int -> GFlow_box_child.flow_box_child_t option

  method get_column_spacing : unit -> int
  method get_homogeneous : unit -> bool
  method get_max_children_per_line : unit -> int
  method get_min_children_per_line : unit -> int
  method get_row_spacing : unit -> int
  method get_selected_children : unit -> GFlow_box_child.flow_box_child_t list
  method get_selection_mode : unit -> Gtk_enums.selectionmode

  method insert :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_child : GFlow_box_child.flow_box_child_t -> unit
  method set_activate_on_single_click : bool -> unit
  method set_column_spacing : int -> unit
  method set_hadjustment : GAdjustment.adjustment_t -> unit
  method set_homogeneous : bool -> unit
  method set_max_children_per_line : int -> unit
  method set_min_children_per_line : int -> unit
  method set_row_spacing : int -> unit
  method set_selection_mode : Gtk_enums.selectionmode -> unit
  method set_vadjustment : GAdjustment.adjustment_t -> unit
  method unselect_all : unit -> unit
  method unselect_child : GFlow_box_child.flow_box_child_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_flow_box : Flow_box.t
end

class flow_box : Flow_box.t -> flow_box_t

val new_ : unit -> flow_box_t

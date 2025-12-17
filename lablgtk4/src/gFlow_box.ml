(* Signal class defined in gflow_box_signals.ml *)

(* High-level class for FlowBox *)
class flow_box (obj : Flow_box.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Flow_box.as_widget obj)
  inherit Gflow_box_signals.flow_box_signals obj

  method accept_unpaired_release = Flow_box.get_accept_unpaired_release obj
  method set_accept_unpaired_release v = Flow_box.set_accept_unpaired_release obj v

  method append : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Flow_box.append obj child)

  method get_activate_on_single_click : unit -> bool = fun () -> (Flow_box.get_activate_on_single_click obj )

  method get_child_at_index : int -> GFlow_box_child.flow_box_child option = fun idx -> Option.map (fun ret -> new GFlow_box_child.flow_box_child ret) (Flow_box.get_child_at_index obj idx)

  method get_child_at_pos : int -> int -> GFlow_box_child.flow_box_child option = fun x y -> Option.map (fun ret -> new GFlow_box_child.flow_box_child ret) (Flow_box.get_child_at_pos obj x y)

  method get_column_spacing : unit -> int = fun () -> (Flow_box.get_column_spacing obj )

  method get_homogeneous : unit -> bool = fun () -> (Flow_box.get_homogeneous obj )

  method get_max_children_per_line : unit -> int = fun () -> (Flow_box.get_max_children_per_line obj )

  method get_min_children_per_line : unit -> int = fun () -> (Flow_box.get_min_children_per_line obj )

  method get_row_spacing : unit -> int = fun () -> (Flow_box.get_row_spacing obj )

  method get_selection_mode : unit -> Gtk_enums.selectionmode = fun () -> (Flow_box.get_selection_mode obj )

  method insert : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> unit =
    fun widget position ->
      let widget = widget#as_widget in
      (Flow_box.insert obj widget position)

  method invalidate_filter : unit -> unit = fun () -> (Flow_box.invalidate_filter obj )

  method invalidate_sort : unit -> unit = fun () -> (Flow_box.invalidate_sort obj )

  method prepend : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Flow_box.prepend obj child)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Flow_box.remove obj widget)

  method remove_all : unit -> unit = fun () -> (Flow_box.remove_all obj )

  method select_all : unit -> unit = fun () -> (Flow_box.select_all obj )

  method select_child : 'p1. (#GFlow_box_child.flow_box_child as 'p1) -> unit =
    fun child ->
      let child = child#as_flow_box_child in
      (Flow_box.select_child obj child)

  method set_activate_on_single_click : bool -> unit = fun single -> (Flow_box.set_activate_on_single_click obj single)

  method set_column_spacing : int -> unit = fun spacing -> (Flow_box.set_column_spacing obj spacing)

  method set_hadjustment : 'p1. (#GAdjustment.adjustment as 'p1) -> unit = fun adjustment -> (Flow_box.set_hadjustment obj ( adjustment#as_adjustment ))

  method set_homogeneous : bool -> unit = fun homogeneous -> (Flow_box.set_homogeneous obj homogeneous)

  method set_max_children_per_line : int -> unit = fun n_children -> (Flow_box.set_max_children_per_line obj n_children)

  method set_min_children_per_line : int -> unit = fun n_children -> (Flow_box.set_min_children_per_line obj n_children)

  method set_row_spacing : int -> unit = fun spacing -> (Flow_box.set_row_spacing obj spacing)

  method set_selection_mode : Gtk_enums.selectionmode -> unit = fun mode -> (Flow_box.set_selection_mode obj mode)

  method set_vadjustment : 'p1. (#GAdjustment.adjustment as 'p1) -> unit = fun adjustment -> (Flow_box.set_vadjustment obj ( adjustment#as_adjustment ))

  method unselect_all : unit -> unit = fun () -> (Flow_box.unselect_all obj )

  method unselect_child : 'p1. (#GFlow_box_child.flow_box_child as 'p1) -> unit =
    fun child ->
      let child = child#as_flow_box_child in
      (Flow_box.unselect_child obj child)

  method as_widget = (Flow_box.as_widget obj)
    method as_flow_box = obj
end


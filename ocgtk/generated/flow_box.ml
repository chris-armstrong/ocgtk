class type flow_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method on_activate_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_child_activated :
    ?after:bool ->
    callback:(child:Flow_box_child.flow_box_child_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selected_children_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_activate_on_single_click : unit -> bool
  method get_child_at_index : int -> Flow_box_child.flow_box_child_t option
  method get_child_at_pos : int -> int -> Flow_box_child.flow_box_child_t option
  method get_column_spacing : unit -> int
  method get_homogeneous : unit -> bool
  method get_max_children_per_line : unit -> int
  method get_min_children_per_line : unit -> int
  method get_row_spacing : unit -> int
  method get_selected_children : unit -> Flow_box_child.flow_box_child_t list
  method get_selection_mode : unit -> Enums.selectionmode

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_child : Flow_box_child.flow_box_child_t -> unit
  method set_activate_on_single_click : bool -> unit
  method set_column_spacing : int -> unit
  method set_hadjustment : Adjustment.adjustment_t -> unit
  method set_homogeneous : bool -> unit
  method set_max_children_per_line : int -> unit
  method set_min_children_per_line : int -> unit
  method set_row_spacing : int -> unit
  method set_selection_mode : Enums.selectionmode -> unit
  method set_vadjustment : Adjustment.adjustment_t -> unit
  method unselect_all : unit -> unit
  method unselect_child : Flow_box_child.flow_box_child_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_flow_box : Raw.Flow_box.t
end

(* High-level class for FlowBox *)
class flow_box (obj : Raw.Flow_box.t) : flow_box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_activate_cursor_child ?(after = false) ~callback () =
      Raw.Flow_box.on_activate_cursor_child ~after self#as_flow_box ~callback

    method on_child_activated ?(after = false) ~callback () =
      Raw.Flow_box.on_child_activated ~after self#as_flow_box
        ~callback:(fun ~child ->
          callback ~child:(new Flow_box_child.flow_box_child child))

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Flow_box.on_move_cursor ~after self#as_flow_box ~callback

    method on_select_all ?(after = false) ~callback () =
      Raw.Flow_box.on_select_all ~after self#as_flow_box ~callback

    method on_selected_children_changed ?(after = false) ~callback () =
      Raw.Flow_box.on_selected_children_changed ~after self#as_flow_box
        ~callback

    method on_toggle_cursor_child ?(after = false) ~callback () =
      Raw.Flow_box.on_toggle_cursor_child ~after self#as_flow_box ~callback

    method on_unselect_all ?(after = false) ~callback () =
      Raw.Flow_box.on_unselect_all ~after self#as_flow_box ~callback

    method append :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Flow_box.append obj child

    method get_activate_on_single_click : unit -> bool =
      fun () -> Raw.Flow_box.get_activate_on_single_click obj

    method get_child_at_index : int -> Flow_box_child.flow_box_child_t option =
      fun idx ->
        Option.map
          (fun ret -> new Flow_box_child.flow_box_child ret)
          (Raw.Flow_box.get_child_at_index obj idx)

    method get_child_at_pos :
        int -> int -> Flow_box_child.flow_box_child_t option =
      fun x y ->
        Option.map
          (fun ret -> new Flow_box_child.flow_box_child ret)
          (Raw.Flow_box.get_child_at_pos obj x y)

    method get_column_spacing : unit -> int =
      fun () -> Raw.Flow_box.get_column_spacing obj

    method get_homogeneous : unit -> bool =
      fun () -> Raw.Flow_box.get_homogeneous obj

    method get_max_children_per_line : unit -> int =
      fun () -> Raw.Flow_box.get_max_children_per_line obj

    method get_min_children_per_line : unit -> int =
      fun () -> Raw.Flow_box.get_min_children_per_line obj

    method get_row_spacing : unit -> int =
      fun () -> Raw.Flow_box.get_row_spacing obj

    method get_selected_children : unit -> Flow_box_child.flow_box_child_t list
        =
      fun () ->
        (List.map (fun ret -> new Flow_box_child.flow_box_child ret))
          (Raw.Flow_box.get_selected_children obj)

    method get_selection_mode : unit -> Enums.selectionmode =
      fun () -> Raw.Flow_box.get_selection_mode obj

    method insert :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun widget position ->
        let widget = widget#as_widget in
        Raw.Flow_box.insert obj widget position

    method invalidate_filter : unit -> unit =
      fun () -> Raw.Flow_box.invalidate_filter obj

    method invalidate_sort : unit -> unit =
      fun () -> Raw.Flow_box.invalidate_sort obj

    method prepend :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Flow_box.prepend obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Flow_box.remove obj widget

    method remove_all : unit -> unit = fun () -> Raw.Flow_box.remove_all obj
    method select_all : unit -> unit = fun () -> Raw.Flow_box.select_all obj

    method select_child : Flow_box_child.flow_box_child_t -> unit =
      fun child ->
        let child = child#as_flow_box_child in
        Raw.Flow_box.select_child obj child

    method set_activate_on_single_click : bool -> unit =
      fun single -> Raw.Flow_box.set_activate_on_single_click obj single

    method set_column_spacing : int -> unit =
      fun spacing -> Raw.Flow_box.set_column_spacing obj spacing

    method set_hadjustment : Adjustment.adjustment_t -> unit =
      fun adjustment ->
        let adjustment = adjustment#as_adjustment in
        Raw.Flow_box.set_hadjustment obj adjustment

    method set_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Flow_box.set_homogeneous obj homogeneous

    method set_max_children_per_line : int -> unit =
      fun n_children -> Raw.Flow_box.set_max_children_per_line obj n_children

    method set_min_children_per_line : int -> unit =
      fun n_children -> Raw.Flow_box.set_min_children_per_line obj n_children

    method set_row_spacing : int -> unit =
      fun spacing -> Raw.Flow_box.set_row_spacing obj spacing

    method set_selection_mode : Enums.selectionmode -> unit =
      fun mode -> Raw.Flow_box.set_selection_mode obj mode

    method set_vadjustment : Adjustment.adjustment_t -> unit =
      fun adjustment ->
        let adjustment = adjustment#as_adjustment in
        Raw.Flow_box.set_vadjustment obj adjustment

    method unselect_all : unit -> unit = fun () -> Raw.Flow_box.unselect_all obj

    method unselect_child : Flow_box_child.flow_box_child_t -> unit =
      fun child ->
        let child = child#as_flow_box_child in
        Raw.Flow_box.unselect_child obj child

    method accept_unpaired_release =
      Raw.Flow_box.get_accept_unpaired_release obj

    method set_accept_unpaired_release v =
      Raw.Flow_box.set_accept_unpaired_release obj v

    method as_flow_box = obj
  end

let new_ () : flow_box_t = new flow_box (Raw.Flow_box.new_ ())

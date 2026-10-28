class type flow_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method on_activate_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates the [box].

      This is a keybinding signal. *)

  method on_child_activated :
    ?after:bool ->
    callback:(child:Flow_box_child.flow_box_child_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a child has been activated by the user. *)

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
  (** Emitted when the user initiates a cursor movement.

      This is a keybinding signal. Applications should not connect to it, but
      may emit it with g_signal_emit_by_name() if they need to control the
      cursor programmatically.

      The default bindings for this signal come in two variants, the variant
      with the Shift modifier extends the selection, the variant without the
      Shift modifier does not. There are too many key combinations to list them
      all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual children
      - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
      - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages *)

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to select all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)

  method on_selected_children_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the set of selected children changes.

      Use [Gtk.FlowBox.selected_foreach] or [Gtk.FlowBox.get_selected_children]
      to obtain the selected children. *)

  method on_toggle_cursor_child :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to toggle the selection of the child that has the focus.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>Space</kbd>.
  *)

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to unselect all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default bindings for this signal is
      <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds [child] to the end of [self].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      See also: [Gtk.FlowBox.insert]. *)

  method get_activate_on_single_click : unit -> bool
  (** Returns whether children activate on single clicks. *)

  method get_child_at_index : int -> Flow_box_child.flow_box_child_t option
  (** Gets the nth child in the [box]. *)

  method get_child_at_pos : int -> int -> Flow_box_child.flow_box_child_t option
  (** Gets the child in the ([x], [y]) position.

      Both [x] and [y] are assumed to be relative to the origin of [box]. *)

  method get_column_spacing : unit -> int
  (** Gets the horizontal spacing. *)

  method get_homogeneous : unit -> bool
  (** Returns whether the box is homogeneous. *)

  method get_max_children_per_line : unit -> int
  (** Gets the maximum number of children per line. *)

  method get_min_children_per_line : unit -> int
  (** Gets the minimum number of children per line. *)

  method get_row_spacing : unit -> int
  (** Gets the vertical spacing. *)

  method get_selected_children : unit -> Flow_box_child.flow_box_child_t list
  (** Creates a list of all selected children. *)

  method get_selection_mode : unit -> Enums.selectionmode
  (** Gets the selection mode of [box]. *)

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
  (** Inserts the [widget] into [box] at [position].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      If [position] is -1, or larger than the total number of children in the
      [box], then the [widget] will be appended to the end. *)

  method invalidate_filter : unit -> unit
  (** Updates the filtering for all children.

      Call this function when the result of the filter function on the [box] is
      changed due to an external factor. For instance, this would be used if the
      filter function just looked for a specific search term, and the entry with
      the string has changed. *)

  method invalidate_sort : unit -> unit
  (** Updates the sorting for all children.

      Call this when the result of the sort function on [box] is changed due to
      an external factor. *)

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds [child] to the start of [self].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      See also: [Gtk.FlowBox.insert]. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [box]. *)

  method remove_all : unit -> unit
  (** Removes all children from [box].

      This function does nothing if [box] is backed by a model. *)

  method select_all : unit -> unit
  (** Select all children of [box], if the selection mode allows it. *)

  method select_child : Flow_box_child.flow_box_child_t -> unit
  (** Selects a single child of [box], if the selection mode allows it. *)

  method set_activate_on_single_click : bool -> unit
  (** If [single] is [TRUE], children will be activated when you click on them,
      otherwise you need to double-click. *)

  method set_column_spacing : int -> unit
  (** Sets the horizontal space to add between children. *)

  method set_hadjustment : Adjustment.adjustment_t -> unit
  (** Hooks up an adjustment to focus handling in [box].

      The adjustment is also used for autoscrolling during rubberband selection.
      See [Gtk.ScrolledWindow.get_hadjustment] for a typical way of obtaining
      the adjustment, and [Gtk.FlowBox.set_vadjustment] for setting the vertical
      adjustment.

      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the box. *)

  method set_homogeneous : bool -> unit
  (** Sets whether or not all children of [box] are given equal space in the
      box. *)

  method set_max_children_per_line : int -> unit
  (** Sets the maximum number of children to request and allocate space for in
      [box]’s orientation.

      Setting the maximum number of children per line limits the overall natural
      size request to be no more than [n_children] children long in the given
      orientation. *)

  method set_min_children_per_line : int -> unit
  (** Sets the minimum number of children to line up in [box]’s orientation
      before flowing. *)

  method set_row_spacing : int -> unit
  (** Sets the vertical space to add between children. *)

  method set_selection_mode : Enums.selectionmode -> unit
  (** Sets how selection works in [box]. *)

  method set_vadjustment : Adjustment.adjustment_t -> unit
  (** Hooks up an adjustment to focus handling in [box].

      The adjustment is also used for autoscrolling during rubberband selection.
      See [Gtk.ScrolledWindow.get_vadjustment] for a typical way of obtaining
      the adjustment, and [Gtk.FlowBox.set_hadjustment] for setting the
      horizontal adjustment.

      The adjustments have to be in pixel units and in the same coordinate
      system as the allocation for immediate children of the box. *)

  method unselect_all : unit -> unit
  (** Unselect all children of [box], if the selection mode allows it. *)

  method unselect_child : Flow_box_child.flow_box_child_t -> unit
  (** Unselects a single child of [box], if the selection mode allows it. *)

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

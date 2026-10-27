class type list_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the cursor row is activated. *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a cursor movement.

      The default bindings for this signal come in two variants, the variant
      with the Shift modifier extends the selection, the variant without the
      Shift modifier does not. There are too many key combinations to list them
      all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual children
      - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
      - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages *)

  method on_row_activated :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a row has been activated by the user. *)

  method on_row_selected :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new row is selected, or (with a [NULL] [row]) when the
      selection is cleared.

      When the [box] is using [GTK_SELECTION_MULTIPLE], this signal will not
      give you the full picture of selection changes, and you should use the
      [Gtk.ListBox::selected-rows-changed] signal instead. *)

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to select all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>. *)

  method on_selected_rows_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the set of selected rows changes. *)

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the cursor row is toggled.

      The default bindings for this signal is <kbd>Ctrl</kbd>+<kbd>␣</kbd>. *)

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to unselect all children of the box, if the selection mode permits
      it.

      This is a keybinding signal.

      The default binding for this signal is
      <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>. *)

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Append a widget to the list.

      If a sort function is set, the widget will actually be inserted at the
      calculated position. *)

  method drag_highlight_row : List_box_row.list_box_row_t -> unit
  (** Add a drag highlight to a row.

      This is a helper function for implementing DnD onto a [GtkListBox]. The
      passed in [row] will be highlighted by setting the
      [GTK_STATE_FLAG_DROP_ACTIVE] state and any previously highlighted row will
      be unhighlighted.

      The row will also be unhighlighted when the widget gets a drag leave
      event. *)

  method drag_unhighlight_row : unit -> unit
  (** If a row has previously been highlighted via
      gtk_list_box_drag_highlight_row(), it will have the highlight removed. *)

  method get_activate_on_single_click : unit -> bool
  (** Returns whether rows activate on single clicks. *)

  method get_adjustment : unit -> Adjustment.adjustment_t option
  (** Gets the adjustment (if any) that the widget uses to for vertical
      scrolling. *)

  method get_row_at_index : int -> List_box_row.list_box_row_t option
  (** Gets the n-th child in the list (not counting headers).

      If [index_] is negative or larger than the number of items in the list,
      [NULL] is returned. *)

  method get_row_at_y : int -> List_box_row.list_box_row_t option
  (** Gets the row at the [y] position. *)

  method get_selected_row : unit -> List_box_row.list_box_row_t option
  (** Gets the selected row, or [NULL] if no rows are selected.

      Note that the box may allow multiple selection, in which case you should
      use [Gtk.ListBox.selected_foreach] to find all selected rows. *)

  method get_selected_rows : unit -> List_box_row.list_box_row_t list
  (** Creates a list of all selected children. *)

  method get_selection_mode : unit -> Enums.selectionmode
  (** Gets the selection mode of the listbox. *)

  method get_show_separators : unit -> bool
  (** Returns whether the list box should show separators between rows. *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Returns the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit
  (** Insert the [child] into the [box] at [position].

      If a sort function is set, the widget will actually be inserted at the
      calculated position.

      If [position] is -1, or larger than the total number of items in the
      [box], then the [child] will be appended to the end. *)

  method invalidate_filter : unit -> unit
  (** Update the filtering for all rows.

      Call this when result of the filter function on the [box] is changed due
      to an external factor. For instance, this would be used if the filter
      function just looked for a specific search string and the entry with the
      search string has changed. *)

  method invalidate_headers : unit -> unit
  (** Update the separators for all rows.

      Call this when result of the header function on the [box] is changed due
      to an external factor. *)

  method invalidate_sort : unit -> unit
  (** Update the sorting for all rows.

      Call this when result of the sort function on the [box] is changed due to
      an external factor. *)

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Prepend a widget to the list.

      If a sort function is set, the widget will actually be inserted at the
      calculated position. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [box]. *)

  method remove_all : unit -> unit
  (** Removes all rows from [box].

      This function does nothing if [box] is backed by a model. *)

  method select_all : unit -> unit
  (** Select all children of [box], if the selection mode allows it. *)

  method select_row : List_box_row.list_box_row_t option -> unit
  (** Make [row] the currently selected row. *)

  method set_activate_on_single_click : bool -> unit
  (** If [single] is [TRUE], rows will be activated when you click on them,
      otherwise you need to double-click. *)

  method set_adjustment : Adjustment.adjustment_t option -> unit
  (** Sets the adjustment (if any) that the widget uses to for vertical
      scrolling.

      For instance, this is used to get the page size for PageUp/Down key
      handling.

      In the normal case when the [box] is packed inside a [GtkScrolledWindow]
      the adjustment from that will be picked up automatically, so there is no
      need to manually do that. *)

  method set_placeholder :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the placeholder widget that is shown in the list when it doesn't
      display any visible children. *)

  method set_selection_mode : Enums.selectionmode -> unit
  (** Sets how selection works in the listbox. *)

  method set_show_separators : bool -> unit
  (** Sets whether the list box should show separators between rows. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

  method unselect_all : unit -> unit
  (** Unselect all children of [box], if the selection mode allows it. *)

  method unselect_row : List_box_row.list_box_row_t -> unit
  (** Unselects a single row of [box], if the selection mode allows it. *)

  method accept_unpaired_release : bool
  (** Whether to accept unpaired release events. *)

  method set_accept_unpaired_release : bool -> unit
  (** Whether to accept unpaired release events. *)

  method as_list_box : Raw.List_box.t
end

(* High-level class for ListBox *)
class list_box (obj : Raw.List_box.t) : list_box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate_cursor_row ?(after = false) ~callback () =
      Raw.List_box.on_activate_cursor_row ~after self#as_list_box ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.List_box.on_move_cursor ~after self#as_list_box ~callback

    method on_row_activated ?(after = false) ~callback () =
      Raw.List_box.on_row_activated ~after self#as_list_box
        ~callback:(fun ~row ->
          callback ~row:(new List_box_row.list_box_row row))

    method on_row_selected ?(after = false) ~callback () =
      Raw.List_box.on_row_selected ~after self#as_list_box
        ~callback:(fun ~row ->
          callback
            ~row:(Option.map (fun w -> new List_box_row.list_box_row w) row))

    method on_select_all ?(after = false) ~callback () =
      Raw.List_box.on_select_all ~after self#as_list_box ~callback

    method on_selected_rows_changed ?(after = false) ~callback () =
      Raw.List_box.on_selected_rows_changed ~after self#as_list_box ~callback

    method on_toggle_cursor_row ?(after = false) ~callback () =
      Raw.List_box.on_toggle_cursor_row ~after self#as_list_box ~callback

    method on_unselect_all ?(after = false) ~callback () =
      Raw.List_box.on_unselect_all ~after self#as_list_box ~callback

    method append :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.append obj child

    method drag_highlight_row : List_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        Raw.List_box.drag_highlight_row obj row

    method drag_unhighlight_row : unit -> unit =
      fun () -> Raw.List_box.drag_unhighlight_row obj

    method get_activate_on_single_click : unit -> bool =
      fun () -> Raw.List_box.get_activate_on_single_click obj

    method get_adjustment : unit -> Adjustment.adjustment_t option =
      fun () ->
        Option.map
          (fun ret -> new Adjustment.adjustment ret)
          (Raw.List_box.get_adjustment obj)

    method get_row_at_index : int -> List_box_row.list_box_row_t option =
      fun index_ ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_row_at_index obj index_)

    method get_row_at_y : int -> List_box_row.list_box_row_t option =
      fun y ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_row_at_y obj y)

    method get_selected_row : unit -> List_box_row.list_box_row_t option =
      fun () ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_selected_row obj)

    method get_selected_rows : unit -> List_box_row.list_box_row_t list =
      fun () ->
        (List.map (fun ret -> new List_box_row.list_box_row ret))
          (Raw.List_box.get_selected_rows obj)

    method get_selection_mode : unit -> Enums.selectionmode =
      fun () -> Raw.List_box.get_selection_mode obj

    method get_show_separators : unit -> bool =
      fun () -> Raw.List_box.get_show_separators obj

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.List_box.get_tab_behavior obj

    method insert :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun child position ->
        let child = child#as_widget in
        Raw.List_box.insert obj child position

    method invalidate_filter : unit -> unit =
      fun () -> Raw.List_box.invalidate_filter obj

    method invalidate_headers : unit -> unit =
      fun () -> Raw.List_box.invalidate_headers obj

    method invalidate_sort : unit -> unit =
      fun () -> Raw.List_box.invalidate_sort obj

    method prepend :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.prepend obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.remove obj child

    method remove_all : unit -> unit = fun () -> Raw.List_box.remove_all obj
    method select_all : unit -> unit = fun () -> Raw.List_box.select_all obj

    method select_row : List_box_row.list_box_row_t option -> unit =
      fun row ->
        let row = Option.map (fun c -> c#as_list_box_row) row in
        Raw.List_box.select_row obj row

    method set_activate_on_single_click : bool -> unit =
      fun single -> Raw.List_box.set_activate_on_single_click obj single

    method set_adjustment : Adjustment.adjustment_t option -> unit =
      fun adjustment ->
        let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
        Raw.List_box.set_adjustment obj adjustment

    method set_placeholder :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun placeholder ->
        let placeholder = Option.map (fun c -> c#as_widget) placeholder in
        Raw.List_box.set_placeholder obj placeholder

    method set_selection_mode : Enums.selectionmode -> unit =
      fun mode -> Raw.List_box.set_selection_mode obj mode

    method set_show_separators : bool -> unit =
      fun show_separators ->
        Raw.List_box.set_show_separators obj show_separators

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun behavior -> Raw.List_box.set_tab_behavior obj behavior

    method unselect_all : unit -> unit = fun () -> Raw.List_box.unselect_all obj

    method unselect_row : List_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        Raw.List_box.unselect_row obj row

    method accept_unpaired_release =
      Raw.List_box.get_accept_unpaired_release obj

    method set_accept_unpaired_release v =
      Raw.List_box.set_accept_unpaired_release obj v

    method as_list_box = obj
  end

let new_ () : list_box_t = new list_box (Raw.List_box.new_ ())

class list_box : List_box.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glist_box_signals.list_box_signals
    method append : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method drag_highlight_row : #GList_box_row.list_box_row -> unit
    method drag_unhighlight_row : unit -> unit
    method get_activate_on_single_click : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment option
    method get_row_at_index : int -> GList_box_row.list_box_row option
    method get_row_at_y : int -> GList_box_row.list_box_row option
    method get_selected_row : unit -> GList_box_row.list_box_row option
    method get_selection_mode : unit -> Gtk_enums.selectionmode
    method get_show_separators : unit -> bool
    method insert : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> unit
    method invalidate_filter : unit -> unit
    method invalidate_headers : unit -> unit
    method invalidate_sort : unit -> unit
    method prepend : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove_all : unit -> unit
    method select_all : unit -> unit
    method select_row : #GList_box_row.list_box_row option -> unit
    method set_activate_on_single_click : bool -> unit
    method set_adjustment : #GAdjustment.adjustment option -> unit
    method set_placeholder : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_selection_mode : Gtk_enums.selectionmode -> unit
    method set_show_separators : bool -> unit
    method unselect_all : unit -> unit
    method unselect_row : #GList_box_row.list_box_row -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_list_box : List_box.t
  end


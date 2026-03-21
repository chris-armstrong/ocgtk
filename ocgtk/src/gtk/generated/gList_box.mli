class type list_box_t = object
    inherit Glist_box_signals.list_box_signals
    method append : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method drag_highlight_row : GList_box_row.list_box_row_t -> unit
    method drag_unhighlight_row : unit -> unit
    method get_activate_on_single_click : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment_t option
    method get_row_at_index : int -> GList_box_row.list_box_row_t option
    method get_row_at_y : int -> GList_box_row.list_box_row_t option
    method get_selected_row : unit -> GList_box_row.list_box_row_t option
    method get_selection_mode : unit -> Gtk_enums.selectionmode
    method get_show_separators : unit -> bool
    method insert : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method invalidate_filter : unit -> unit
    method invalidate_headers : unit -> unit
    method invalidate_sort : unit -> unit
    method prepend : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove_all : unit -> unit
    method select_all : unit -> unit
    method select_row : GList_box_row.list_box_row_t option -> unit
    method set_activate_on_single_click : bool -> unit
    method set_adjustment : GAdjustment.adjustment_t option -> unit
    method set_placeholder : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_selection_mode : Gtk_enums.selectionmode -> unit
    method set_show_separators : bool -> unit
    method unselect_all : unit -> unit
    method unselect_row : GList_box_row.list_box_row_t -> unit
    method accept_unpaired_release : bool
    method set_accept_unpaired_release : bool -> unit
    method as_list_box : List_box.t
end

class list_box : List_box.t -> list_box_t


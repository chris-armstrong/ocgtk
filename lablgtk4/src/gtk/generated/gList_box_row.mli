class list_box_row : List_box_row.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glist_box_row_signals.list_box_row_signals
    method activatable : bool
    method set_activatable : bool -> unit
    method selectable : bool
    method set_selectable : bool -> unit
    method changed : unit -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_header : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_index : unit -> int
    method is_selected : unit -> bool
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_header : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_list_box_row : List_box_row.t
  end


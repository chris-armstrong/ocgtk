class list_header : List_header.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_end : unit -> int
    method get_n_items : unit -> int
    method get_start : unit -> int
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_list_header : List_header.t
  end


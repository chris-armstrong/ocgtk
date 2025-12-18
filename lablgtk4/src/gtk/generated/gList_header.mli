class list_header : List_header.t ->
  object
    method end_ : int
    method n_items : int
    method start : int
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_list_header : List_header.t
  end


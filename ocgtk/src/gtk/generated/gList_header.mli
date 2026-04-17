class type list_header_t = object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_end : unit -> int
    method get_item : unit -> [`object_] Gobject.obj option
    method get_n_items : unit -> int
    method get_start : unit -> int
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_list_header : List_header.t
end

class list_header : List_header.t -> list_header_t


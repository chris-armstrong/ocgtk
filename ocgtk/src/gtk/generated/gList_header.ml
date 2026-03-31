class type list_header_t = object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_end : unit -> int
    method get_item : unit -> [`object_] Gobject.obj option
    method get_n_items : unit -> int
    method get_start : unit -> int
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_list_header : List_header.t
end

(* High-level class for ListHeader *)
class list_header (obj : List_header.t) : list_header_t = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_header.get_child obj)

  method get_end : unit -> int =
    fun () ->
      (List_header.get_end obj)

  method get_item : unit -> [`object_] Gobject.obj option =
    fun () ->
      (List_header.get_item obj)

  method get_n_items : unit -> int =
    fun () ->
      (List_header.get_n_items obj)

  method get_start : unit -> int =
    fun () ->
      (List_header.get_start obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_header.set_child obj child)

    method as_list_header = obj
end


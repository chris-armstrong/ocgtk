(* High-level class for ListHeader *)
class list_header (obj : List_header.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_header.get_child obj )

  method get_end : unit -> int = fun () -> (List_header.get_end obj )

  method get_n_items : unit -> int = fun () -> (List_header.get_n_items obj )

  method get_start : unit -> int = fun () -> (List_header.get_start obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_header.set_child obj child)

    method as_list_header = obj
end


(* High-level class for ListItem *)
class list_item (obj : List_item.t) = object (self)

  method get_accessible_description : unit -> string =
    fun () ->
      (List_item.get_accessible_description obj)

  method get_accessible_label : unit -> string =
    fun () ->
      (List_item.get_accessible_label obj)

  method get_activatable : unit -> bool =
    fun () ->
      (List_item.get_activatable obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_item.get_child obj)

  method get_focusable : unit -> bool =
    fun () ->
      (List_item.get_focusable obj)

  method get_position : unit -> int =
    fun () ->
      (List_item.get_position obj)

  method get_selectable : unit -> bool =
    fun () ->
      (List_item.get_selectable obj)

  method get_selected : unit -> bool =
    fun () ->
      (List_item.get_selected obj)

  method set_accessible_description : string -> unit =
    fun description ->
      (List_item.set_accessible_description obj description)

  method set_accessible_label : string -> unit =
    fun label ->
      (List_item.set_accessible_label obj label)

  method set_activatable : bool -> unit =
    fun activatable ->
      (List_item.set_activatable obj activatable)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_item.set_child obj child)

  method set_focusable : bool -> unit =
    fun focusable ->
      (List_item.set_focusable obj focusable)

  method set_selectable : bool -> unit =
    fun selectable ->
      (List_item.set_selectable obj selectable)

    method as_list_item = obj
end


(* High-level class for ListItem *)
class list_item (obj : List_item.t) = object (self)

  method accessible_description = List_item.get_accessible_description obj
  method set_accessible_description v = List_item.set_accessible_description obj v

  method accessible_label = List_item.get_accessible_label obj
  method set_accessible_label v = List_item.set_accessible_label obj v

  method activatable = List_item.get_activatable obj
  method set_activatable v = List_item.set_activatable obj v

  method focusable = List_item.get_focusable obj
  method set_focusable v = List_item.set_focusable obj v

  method position = List_item.get_position obj

  method selectable = List_item.get_selectable obj
  method set_selectable v = List_item.set_selectable obj v

  method selected = List_item.get_selected obj

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_item.get_child obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_item.set_child obj child)

    method as_list_item = obj
end


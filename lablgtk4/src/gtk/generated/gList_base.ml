(* High-level class for ListBase *)
class list_base (obj : List_base.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (List_base.as_widget obj)

  method orientation = List_base.get_orientation obj
  method set_orientation v =  List_base.set_orientation obj v

  method as_widget = (List_base.as_widget obj)
    method as_list_base = obj
end


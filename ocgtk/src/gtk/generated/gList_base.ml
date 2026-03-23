class type list_base_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method orientation : Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_list_base : List_base.t
end

(* High-level class for ListBase *)
class list_base (obj : List_base.t) : list_base_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method orientation = List_base.get_orientation obj
  method set_orientation v =  List_base.set_orientation obj v

    method as_list_base = obj
end


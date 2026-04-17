class type list_base_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GOrientable.orientable_t
  inherit GScrollable.scrollable_t
  method orientation : Gtk_enums.orientation
  method as_list_base : List_base.t
end

class list_base : List_base.t -> list_base_t

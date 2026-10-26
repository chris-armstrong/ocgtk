class type list_base_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  inherit Scrollable.scrollable_t
  method orientation : Enums.orientation
  method as_list_base : Raw.List_base.t
end

class list_base : Raw.List_base.t -> list_base_t

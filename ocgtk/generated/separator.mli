class type separator_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  method as_separator : Raw.Separator.t
end

class separator : Raw.Separator.t -> separator_t

val new_ : Enums.orientation -> separator_t

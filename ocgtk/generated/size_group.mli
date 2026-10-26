class type size_group_t = object
  inherit Buildable.buildable_t

  method add_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_mode : unit -> Enums.sizegroupmode

  method get_widgets :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    list

  method remove_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_mode : Enums.sizegroupmode -> unit
  method as_size_group : Raw.Size_group.t
end

class size_group : Raw.Size_group.t -> size_group_t

val new_ : Enums.sizegroupmode -> size_group_t

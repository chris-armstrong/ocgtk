class type popover_menu_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    bool

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  method as_popover_menu_bar : Raw.Popover_menu_bar.t
end

class popover_menu_bar : Raw.Popover_menu_bar.t -> popover_menu_bar_t

val new_from_model : Ocgio.Menu_model.menu_model_t option -> popover_menu_bar_t

class type popover_menu_t = object
  inherit Popover.popover_t

  method add_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    bool

  method get_flags : unit -> Enums.popovermenuflags
  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option

  method remove_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method set_flags : Enums.popovermenuflags -> unit
  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  method visible_submenu : string
  method set_visible_submenu : string -> unit
  method as_popover_menu : Raw.Popover_menu.t
end

class popover_menu : Raw.Popover_menu.t -> popover_menu_t

val new_from_model : Ocgio.Menu_model.menu_model_t option -> popover_menu_t

val new_from_model_full :
  Ocgio.Menu_model.menu_model_t -> Enums.popovermenuflags -> popover_menu_t

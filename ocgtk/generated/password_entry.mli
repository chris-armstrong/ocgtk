class type password_entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_show_peek_icon : unit -> bool
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_show_peek_icon : bool -> unit
  method activates_default : bool
  method set_activates_default : bool -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method as_password_entry : Raw.Password_entry.t
end

class password_entry : Raw.Password_entry.t -> password_entry_t

val new_ : unit -> password_entry_t

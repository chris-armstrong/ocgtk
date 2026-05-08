class type password_entry_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GEditable.editable_t
  method on_activate : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_extra_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
  method get_show_peek_icon : unit -> bool
  method set_extra_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
  method set_show_peek_icon : bool -> unit
  method activates_default : bool
  method set_activates_default : bool -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method as_password_entry : Password_entry.t
end

class password_entry : Password_entry.t -> password_entry_t

val new_ : unit -> password_entry_t

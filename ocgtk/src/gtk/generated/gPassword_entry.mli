class password_entry : Password_entry.t ->
  object
    inherit Gpassword_entry_signals.password_entry_signals
    method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model option
    method get_show_peek_icon : unit -> bool
    method set_extra_menu : #Ocgtk_gio.Gio.menu_model option -> unit
    method set_show_peek_icon : bool -> unit
    method activates_default : bool
    method set_activates_default : bool -> unit
    method placeholder_text : string
    method set_placeholder_text : string -> unit
    method as_password_entry : Password_entry.t
  end


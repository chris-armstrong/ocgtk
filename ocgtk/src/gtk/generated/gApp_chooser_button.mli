class type app_chooser_button_t = object
    inherit Gapp_chooser_button_signals.app_chooser_button_signals
    method append_custom_item : string -> string -> Ocgtk_gio.Gio.icon_t -> unit
    method append_separator : unit -> unit
    method get_heading : unit -> string option
    method get_modal : unit -> bool
    method get_show_default_item : unit -> bool
    method get_show_dialog_item : unit -> bool
    method set_active_custom_item : string -> unit
    method set_heading : string -> unit
    method set_modal : bool -> unit
    method set_show_default_item : bool -> unit
    method set_show_dialog_item : bool -> unit
    method as_app_chooser_button : App_chooser_button.t
end

class app_chooser_button : App_chooser_button.t -> app_chooser_button_t


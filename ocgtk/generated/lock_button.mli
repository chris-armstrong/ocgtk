class type lock_button_t = object
  inherit GButton.button_t
  method get_permission : unit -> Ocgtk_gio.Gio.Permission.permission_t option
  method set_permission : Ocgtk_gio.Gio.Permission.permission_t option -> unit
  method text_lock : string
  method set_text_lock : string -> unit
  method text_unlock : string
  method set_text_unlock : string -> unit
  method tooltip_lock : string
  method set_tooltip_lock : string -> unit
  method tooltip_not_authorized : string
  method set_tooltip_not_authorized : string -> unit
  method tooltip_unlock : string
  method set_tooltip_unlock : string -> unit
  method as_lock_button : Lock_button.t
end

class lock_button : Lock_button.t -> lock_button_t

val new_ : Ocgtk_gio.Gio.Permission.permission_t option -> lock_button_t

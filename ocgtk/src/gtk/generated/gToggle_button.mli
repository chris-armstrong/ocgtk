class type toggle_button_t = object
  inherit GButton.button_t
  method on_toggled : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_active : unit -> bool
  method set_active : bool -> unit
  method set_group : toggle_button_t option -> unit
  method toggled : unit -> unit
  method as_toggle_button : Toggle_button.t
end

class toggle_button : Toggle_button.t -> toggle_button_t

val new_ : unit -> toggle_button_t
val new_with_label : string -> toggle_button_t
val new_with_mnemonic : string -> toggle_button_t

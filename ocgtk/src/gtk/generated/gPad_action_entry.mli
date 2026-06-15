class type pad_action_entry_t = object
  method get_type : Gtk_enums.padactiontype
  method set_type : Gtk_enums.padactiontype -> unit
  method get_index : int
  method set_index : int -> unit
  method get_mode : int
  method set_mode : int -> unit
  method get_label : string
  method set_label : string -> unit
  method get_action_name : string
  method set_action_name : string -> unit
  method as_pad_action_entry : Pad_action_entry.t
end

class pad_action_entry : Pad_action_entry.t -> pad_action_entry_t

val make :
  Gtk_enums.padactiontype ->
  int ->
  int ->
  string ->
  string ->
  pad_action_entry_t

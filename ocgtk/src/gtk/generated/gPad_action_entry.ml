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

(* High-level class for PadActionEntry *)
class pad_action_entry (obj : Pad_action_entry.t) : pad_action_entry_t =
  object (self)
    method get_type : Gtk_enums.padactiontype = Pad_action_entry.get_type obj

    method set_type : Gtk_enums.padactiontype -> unit =
      fun v -> Pad_action_entry.set_type obj v

    method get_index : int = Pad_action_entry.get_index obj
    method set_index : int -> unit = fun v -> Pad_action_entry.set_index obj v
    method get_mode : int = Pad_action_entry.get_mode obj
    method set_mode : int -> unit = fun v -> Pad_action_entry.set_mode obj v
    method get_label : string = Pad_action_entry.get_label obj

    method set_label : string -> unit =
      fun v -> Pad_action_entry.set_label obj v

    method get_action_name : string = Pad_action_entry.get_action_name obj

    method set_action_name : string -> unit =
      fun v -> Pad_action_entry.set_action_name obj v

    method as_pad_action_entry = obj
  end

let make (type_ : Gtk_enums.padactiontype) (index : int) (mode : int)
    (label : string) (action_name : string) : pad_action_entry_t =
  new pad_action_entry
    (Pad_action_entry.make type_ index mode label action_name)

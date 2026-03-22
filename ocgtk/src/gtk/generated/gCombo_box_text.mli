class type combo_box_text_t = object
    inherit GCombo_box.combo_box_t
    method append : string option -> string -> unit
    method append_text : string -> unit
    method get_active_text : unit -> string option
    method insert : int -> string option -> string -> unit
    method insert_text : int -> string -> unit
    method prepend : string option -> string -> unit
    method prepend_text : string -> unit
    method remove : int -> unit
    method remove_all : unit -> unit
    method as_combo_box_text : Combo_box_text.t
end

class combo_box_text : Combo_box_text.t -> combo_box_text_t


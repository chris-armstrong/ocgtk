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

(* High-level class for ComboBoxText *)
class combo_box_text (obj : Combo_box_text.t) : combo_box_text_t = object (self)
  inherit GCombo_box.combo_box (obj :> Combo_box.t)

  method append : string option -> string -> unit =
    fun id text ->
      (Combo_box_text.append obj id text)

  method append_text : string -> unit =
    fun text ->
      (Combo_box_text.append_text obj text)

  method get_active_text : unit -> string option =
    fun () ->
      (Combo_box_text.get_active_text obj)

  method insert : int -> string option -> string -> unit =
    fun position id text ->
      (Combo_box_text.insert obj position id text)

  method insert_text : int -> string -> unit =
    fun position text ->
      (Combo_box_text.insert_text obj position text)

  method prepend : string option -> string -> unit =
    fun id text ->
      (Combo_box_text.prepend obj id text)

  method prepend_text : string -> unit =
    fun text ->
      (Combo_box_text.prepend_text obj text)

  method remove : int -> unit =
    fun position ->
      (Combo_box_text.remove obj position)

  method remove_all : unit -> unit =
    fun () ->
      (Combo_box_text.remove_all obj)

    method as_combo_box_text = obj
end

let new_ () : combo_box_text_t =
  new combo_box_text (Combo_box_text.new_ ())

let new_with_entry () : combo_box_text_t =
  new combo_box_text (Combo_box_text.new_with_entry ())


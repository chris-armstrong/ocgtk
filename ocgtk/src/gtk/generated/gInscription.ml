(* High-level class for Inscription *)
class inscription (obj : Inscription.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Inscription.as_widget obj)

  method get_min_chars : unit -> int =
    fun () ->
      (Inscription.get_min_chars obj)

  method get_min_lines : unit -> int =
    fun () ->
      (Inscription.get_min_lines obj)

  method get_nat_chars : unit -> int =
    fun () ->
      (Inscription.get_nat_chars obj)

  method get_nat_lines : unit -> int =
    fun () ->
      (Inscription.get_nat_lines obj)

  method get_text : unit -> string option =
    fun () ->
      (Inscription.get_text obj)

  method get_text_overflow : unit -> Gtk_enums.inscriptionoverflow =
    fun () ->
      (Inscription.get_text_overflow obj)

  method get_xalign : unit -> float =
    fun () ->
      (Inscription.get_xalign obj)

  method get_yalign : unit -> float =
    fun () ->
      (Inscription.get_yalign obj)

  method set_markup : string option -> unit =
    fun markup ->
      (Inscription.set_markup obj markup)

  method set_min_chars : int -> unit =
    fun min_chars ->
      (Inscription.set_min_chars obj min_chars)

  method set_min_lines : int -> unit =
    fun min_lines ->
      (Inscription.set_min_lines obj min_lines)

  method set_nat_chars : int -> unit =
    fun nat_chars ->
      (Inscription.set_nat_chars obj nat_chars)

  method set_nat_lines : int -> unit =
    fun nat_lines ->
      (Inscription.set_nat_lines obj nat_lines)

  method set_text : string option -> unit =
    fun text ->
      (Inscription.set_text obj text)

  method set_text_overflow : Gtk_enums.inscriptionoverflow -> unit =
    fun overflow ->
      (Inscription.set_text_overflow obj overflow)

  method set_xalign : float -> unit =
    fun xalign ->
      (Inscription.set_xalign obj xalign)

  method set_yalign : float -> unit =
    fun yalign ->
      (Inscription.set_yalign obj yalign)

  method as_widget = (Inscription.as_widget obj)
    method as_inscription = obj
end


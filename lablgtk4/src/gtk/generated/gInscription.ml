(* High-level class for Inscription *)
class inscription (obj : Inscription.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Inscription.as_widget obj)

  method markup = Inscription.get_markup obj
  method set_markup v = Inscription.set_markup obj v

  method min_chars = Inscription.get_min_chars obj
  method set_min_chars v = Inscription.set_min_chars obj v

  method min_lines = Inscription.get_min_lines obj
  method set_min_lines v = Inscription.set_min_lines obj v

  method nat_chars = Inscription.get_nat_chars obj
  method set_nat_chars v = Inscription.set_nat_chars obj v

  method nat_lines = Inscription.get_nat_lines obj
  method set_nat_lines v = Inscription.set_nat_lines obj v

  method text = Inscription.get_text obj
  method set_text v = Inscription.set_text obj v

  method xalign = Inscription.get_xalign obj
  method set_xalign v = Inscription.set_xalign obj v

  method yalign = Inscription.get_yalign obj
  method set_yalign v = Inscription.set_yalign obj v

  method get_text_overflow : unit -> Gtk_enums.inscriptionoverflow = fun () -> (Inscription.get_text_overflow obj )

  method get_wrap_mode : unit -> Pango.wrapmode = fun () -> (Inscription.get_wrap_mode obj )

  method set_text_overflow : Gtk_enums.inscriptionoverflow -> unit = fun overflow -> (Inscription.set_text_overflow obj overflow)

  method set_wrap_mode : Pango.wrapmode -> unit = fun wrap_mode -> (Inscription.set_wrap_mode obj wrap_mode)

  method as_widget = (Inscription.as_widget obj)
    method as_inscription = obj
end


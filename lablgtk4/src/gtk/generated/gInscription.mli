class inscription : Inscription.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method markup : string
    method set_markup : string -> unit
    method min_chars : int
    method set_min_chars : int -> unit
    method min_lines : int
    method set_min_lines : int -> unit
    method nat_chars : int
    method set_nat_chars : int -> unit
    method nat_lines : int
    method set_nat_lines : int -> unit
    method text : string
    method set_text : string -> unit
    method xalign : float
    method set_xalign : float -> unit
    method yalign : float
    method set_yalign : float -> unit
    method get_text_overflow : unit -> Gtk_enums.inscriptionoverflow
    method get_wrap_mode : unit -> Pango.wrapmode
    method set_text_overflow : Gtk_enums.inscriptionoverflow -> unit
    method set_wrap_mode : Pango.wrapmode -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_inscription : Inscription.t
  end


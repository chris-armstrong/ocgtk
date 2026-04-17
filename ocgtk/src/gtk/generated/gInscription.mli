class type inscription_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GAccessible_text.accessible_text_t
    method get_attributes : unit -> Ocgtk_pango.Pango.Attr_list.attr_list_t option
    method get_min_chars : unit -> int
    method get_min_lines : unit -> int
    method get_nat_chars : unit -> int
    method get_nat_lines : unit -> int
    method get_text : unit -> string option
    method get_text_overflow : unit -> Gtk_enums.inscriptionoverflow
    method get_wrap_mode : unit -> Ocgtk_pango.Pango.wrapmode
    method get_xalign : unit -> float
    method get_yalign : unit -> float
    method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t option -> unit
    method set_markup : string option -> unit
    method set_min_chars : int -> unit
    method set_min_lines : int -> unit
    method set_nat_chars : int -> unit
    method set_nat_lines : int -> unit
    method set_text : string option -> unit
    method set_text_overflow : Gtk_enums.inscriptionoverflow -> unit
    method set_wrap_mode : Ocgtk_pango.Pango.wrapmode -> unit
    method set_xalign : float -> unit
    method set_yalign : float -> unit
    method as_inscription : Inscription.t
end

class inscription : Inscription.t -> inscription_t

val new_ : string option -> inscription_t

class type inscription_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t
  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_min_chars : unit -> int
  method get_min_lines : unit -> int
  method get_nat_chars : unit -> int
  method get_nat_lines : unit -> int
  method get_text : unit -> string option
  method get_text_overflow : unit -> Enums.inscriptionoverflow
  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  method get_xalign : unit -> float
  method get_yalign : unit -> float
  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  method set_markup : string option -> unit
  method set_min_chars : int -> unit
  method set_min_lines : int -> unit
  method set_nat_chars : int -> unit
  method set_nat_lines : int -> unit
  method set_text : string option -> unit
  method set_text_overflow : Enums.inscriptionoverflow -> unit
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method set_xalign : float -> unit
  method set_yalign : float -> unit
  method as_inscription : Raw.Inscription.t
end

class inscription : Raw.Inscription.t -> inscription_t

val new_ : string option -> inscription_t

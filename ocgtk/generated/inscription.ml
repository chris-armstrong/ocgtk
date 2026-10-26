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

(* High-level class for Inscription *)
class inscription (obj : Raw.Inscription.t) : inscription_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_text.accessible_text (Raw.Accessible_text.from_gobject obj)

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Inscription.get_attributes obj)

    method get_min_chars : unit -> int =
      fun () -> Raw.Inscription.get_min_chars obj

    method get_min_lines : unit -> int =
      fun () -> Raw.Inscription.get_min_lines obj

    method get_nat_chars : unit -> int =
      fun () -> Raw.Inscription.get_nat_chars obj

    method get_nat_lines : unit -> int =
      fun () -> Raw.Inscription.get_nat_lines obj

    method get_text : unit -> string option =
      fun () -> Raw.Inscription.get_text obj

    method get_text_overflow : unit -> Enums.inscriptionoverflow =
      fun () -> Raw.Inscription.get_text_overflow obj

    method get_wrap_mode : unit -> Ocpango.Enums.wrapmode =
      fun () -> Raw.Inscription.get_wrap_mode obj

    method get_xalign : unit -> float = fun () -> Raw.Inscription.get_xalign obj
    method get_yalign : unit -> float = fun () -> Raw.Inscription.get_yalign obj

    method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit =
      fun attrs ->
        let attrs = Option.map (fun c -> c#as_attr_list) attrs in
        Raw.Inscription.set_attributes obj attrs

    method set_markup : string option -> unit =
      fun markup -> Raw.Inscription.set_markup obj markup

    method set_min_chars : int -> unit =
      fun min_chars -> Raw.Inscription.set_min_chars obj min_chars

    method set_min_lines : int -> unit =
      fun min_lines -> Raw.Inscription.set_min_lines obj min_lines

    method set_nat_chars : int -> unit =
      fun nat_chars -> Raw.Inscription.set_nat_chars obj nat_chars

    method set_nat_lines : int -> unit =
      fun nat_lines -> Raw.Inscription.set_nat_lines obj nat_lines

    method set_text : string option -> unit =
      fun text -> Raw.Inscription.set_text obj text

    method set_text_overflow : Enums.inscriptionoverflow -> unit =
      fun overflow -> Raw.Inscription.set_text_overflow obj overflow

    method set_wrap_mode : Ocpango.Enums.wrapmode -> unit =
      fun wrap_mode -> Raw.Inscription.set_wrap_mode obj wrap_mode

    method set_xalign : float -> unit =
      fun xalign -> Raw.Inscription.set_xalign obj xalign

    method set_yalign : float -> unit =
      fun yalign -> Raw.Inscription.set_yalign obj yalign

    method as_inscription = obj
  end

let new_ (text : string option) : inscription_t =
  let obj_ = Raw.Inscription.new_ text in
  new inscription obj_

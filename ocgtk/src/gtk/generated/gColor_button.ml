(* Signal class defined in gcolor_button_signals.ml *)

class type color_button_t = object
    inherit Gcolor_button_signals.color_button_signals
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_modal : bool -> unit
    method set_title : string -> unit
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_button : Color_button.t
end

(* High-level class for ColorButton *)
class color_button (obj : Color_button.t) : color_button_t = object (self)
  inherit Gcolor_button_signals.color_button_signals obj

  method get_modal : unit -> bool =
    fun () ->
      (Color_button.get_modal obj)

  method get_title : unit -> string =
    fun () ->
      (Color_button.get_title obj)

  method set_modal : bool -> unit =
    fun modal ->
      (Color_button.set_modal obj modal)

  method set_title : string -> unit =
    fun title ->
      (Color_button.set_title obj title)

  method show_editor = Color_button.get_show_editor obj
  method set_show_editor v =  Color_button.set_show_editor obj v

    method as_color_button = obj
end


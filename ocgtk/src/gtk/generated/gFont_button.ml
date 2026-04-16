(* Signal class defined in gfont_button_signals.ml *)

class type font_button_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GFont_chooser.font_chooser_t
  inherit Gfont_button_signals.font_button_signals
  method get_modal : unit -> bool
  method get_title : unit -> string
  method get_use_font : unit -> bool
  method get_use_size : unit -> bool
  method set_modal : bool -> unit
  method set_title : string -> unit
  method set_use_font : bool -> unit
  method set_use_size : bool -> unit
  method as_font_button : Font_button.t
end

(* High-level class for FontButton *)
class font_button (obj : Font_button.t) : font_button_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    inherit GFont_chooser.font_chooser (Font_chooser.from_gobject obj)
    inherit Gfont_button_signals.font_button_signals obj
    method get_modal : unit -> bool = fun () -> Font_button.get_modal obj
    method get_title : unit -> string = fun () -> Font_button.get_title obj
    method get_use_font : unit -> bool = fun () -> Font_button.get_use_font obj
    method get_use_size : unit -> bool = fun () -> Font_button.get_use_size obj

    method set_modal : bool -> unit =
      fun modal -> Font_button.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Font_button.set_title obj title

    method set_use_font : bool -> unit =
      fun use_font -> Font_button.set_use_font obj use_font

    method set_use_size : bool -> unit =
      fun use_size -> Font_button.set_use_size obj use_size

    method as_font_button = obj
  end

let new_ () : font_button_t = new font_button (Font_button.new_ ())

let new_with_font (fontname : string) : font_button_t =
  let obj_ = Font_button.new_with_font fontname in
  new font_button obj_

(* Signal class defined in gfont_chooser_signals.ml *)

(* High-level class for FontChooser *)
class font_chooser (obj : Font_chooser.t) = object (self)
  inherit Gfont_chooser_signals.font_chooser_signals obj

  method get_font : unit -> string option =
    fun () ->
      (Font_chooser.get_font obj)

  method get_font_features : unit -> string =
    fun () ->
      (Font_chooser.get_font_features obj)

  method get_font_size : unit -> int =
    fun () ->
      (Font_chooser.get_font_size obj)

  method get_language : unit -> string =
    fun () ->
      (Font_chooser.get_language obj)

  method get_preview_text : unit -> string =
    fun () ->
      (Font_chooser.get_preview_text obj)

  method get_show_preview_entry : unit -> bool =
    fun () ->
      (Font_chooser.get_show_preview_entry obj)

  method set_font : string -> unit =
    fun fontname ->
      (Font_chooser.set_font obj fontname)

  method set_language : string -> unit =
    fun language ->
      (Font_chooser.set_language obj language)

  method set_preview_text : string -> unit =
    fun text ->
      (Font_chooser.set_preview_text obj text)

  method set_show_preview_entry : bool -> unit =
    fun show_preview_entry ->
      (Font_chooser.set_show_preview_entry obj show_preview_entry)

    method as_font_chooser = obj
end


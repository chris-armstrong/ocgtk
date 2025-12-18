(* Signal class defined in gfont_chooser_signals.ml *)

(* High-level class for FontChooser *)
class font_chooser (obj : Font_chooser.t) = object (self)
  inherit Gfont_chooser_signals.font_chooser_signals obj

  method font = Font_chooser.get_font obj
  method set_font v = Font_chooser.set_font obj v

  method font_features = Font_chooser.get_font_features obj

  method language = Font_chooser.get_language obj
  method set_language v = Font_chooser.set_language obj v

  method preview_text = Font_chooser.get_preview_text obj
  method set_preview_text v = Font_chooser.set_preview_text obj v

  method show_preview_entry = Font_chooser.get_show_preview_entry obj
  method set_show_preview_entry v = Font_chooser.set_show_preview_entry obj v

  method get_font_size : unit -> int = fun () -> (Font_chooser.get_font_size obj )

  method get_level : unit -> Gtk_enums.fontchooserlevel = fun () -> (Font_chooser.get_level obj )

  method set_level : Gtk_enums.fontchooserlevel -> unit = fun level -> (Font_chooser.set_level obj level)

    method as_font_chooser = obj
end


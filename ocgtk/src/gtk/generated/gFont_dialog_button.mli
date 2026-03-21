class type font_dialog_button_t = object
    inherit Gfont_dialog_button_signals.font_dialog_button_signals
    method get_dialog : unit -> GFont_dialog.font_dialog_t option
    method get_font_desc : unit -> Ocgtk_pango.Pango.font_description_t option
    method get_font_features : unit -> string option
    method get_language : unit -> Ocgtk_pango.Pango.language_t option
    method get_level : unit -> Gtk_enums.fontlevel
    method get_use_font : unit -> bool
    method get_use_size : unit -> bool
    method set_dialog : GFont_dialog.font_dialog_t -> unit
    method set_font_desc : Ocgtk_pango.Pango.font_description_t -> unit
    method set_font_features : string option -> unit
    method set_language : Ocgtk_pango.Pango.language_t option -> unit
    method set_level : Gtk_enums.fontlevel -> unit
    method set_use_font : bool -> unit
    method set_use_size : bool -> unit
    method as_font_dialog_button : Font_dialog_button.t
end

class font_dialog_button : Font_dialog_button.t -> font_dialog_button_t


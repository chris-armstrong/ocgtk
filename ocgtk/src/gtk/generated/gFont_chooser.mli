class type font_chooser_t = object
    inherit Gfont_chooser_signals.font_chooser_signals
    method get_font : unit -> string option
    method get_font_desc : unit -> Ocgtk_pango.Pango.font_description_t option
    method get_font_face : unit -> Ocgtk_pango.Pango.font_face_t option
    method get_font_family : unit -> Ocgtk_pango.Pango.font_family_t option
    method get_font_features : unit -> string
    method get_font_map : unit -> Ocgtk_pango.Pango.font_map_t option
    method get_font_size : unit -> int
    method get_language : unit -> string
    method get_level : unit -> Gtk_enums.fontchooserlevel
    method get_preview_text : unit -> string
    method get_show_preview_entry : unit -> bool
    method set_font : string -> unit
    method set_font_desc : Ocgtk_pango.Pango.font_description_t -> unit
    method set_font_map : Ocgtk_pango.Pango.font_map_t option -> unit
    method set_language : string -> unit
    method set_level : Gtk_enums.fontchooserlevel -> unit
    method set_preview_text : string -> unit
    method set_show_preview_entry : bool -> unit
    method as_font_chooser : Font_chooser.t
end

class font_chooser : Font_chooser.t -> font_chooser_t


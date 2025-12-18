class font_chooser : Font_chooser.t ->
  object
    inherit Gfont_chooser_signals.font_chooser_signals
    method font : string
    method set_font : string -> unit
    method font_features : string
    method language : string
    method set_language : string -> unit
    method preview_text : string
    method set_preview_text : string -> unit
    method show_preview_entry : bool
    method set_show_preview_entry : bool -> unit
    method get_font_size : unit -> int
    method get_level : unit -> Gtk_enums.fontchooserlevel
    method set_level : Gtk_enums.fontchooserlevel -> unit
    method as_font_chooser : Font_chooser.t
  end


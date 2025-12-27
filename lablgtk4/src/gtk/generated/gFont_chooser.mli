class font_chooser : Font_chooser.t ->
  object
    inherit Gfont_chooser_signals.font_chooser_signals
    method get_font : unit -> string option
    method get_font_features : unit -> string
    method get_font_size : unit -> int
    method get_language : unit -> string
    method get_level : unit -> Gtk_enums.fontchooserlevel
    method get_preview_text : unit -> string
    method get_show_preview_entry : unit -> bool
    method set_font : string -> unit
    method set_language : string -> unit
    method set_level : Gtk_enums.fontchooserlevel -> unit
    method set_preview_text : string -> unit
    method set_show_preview_entry : bool -> unit
    method as_font_chooser : Font_chooser.t
  end


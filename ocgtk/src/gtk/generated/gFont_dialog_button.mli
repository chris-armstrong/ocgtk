class font_dialog_button : Font_dialog_button.t ->
  object
    inherit Gfont_dialog_button_signals.font_dialog_button_signals
    method get_dialog : unit -> GFont_dialog.font_dialog option
    method get_font_desc : unit -> Ocgtk_pango.Pango.font_description option
    method get_font_features : unit -> string option
    method get_language : unit -> Ocgtk_pango.Pango.language option
    method get_level : unit -> Gtk_enums.fontlevel
    method get_use_font : unit -> bool
    method get_use_size : unit -> bool
    method set_dialog : #GFont_dialog.font_dialog -> unit
    method set_font_desc : #Ocgtk_pango.Pango.font_description -> unit
    method set_font_features : string option -> unit
    method set_language : #Ocgtk_pango.Pango.language option -> unit
    method set_level : Gtk_enums.fontlevel -> unit
    method set_use_font : bool -> unit
    method set_use_size : bool -> unit
    method as_font_dialog_button : Font_dialog_button.t
  end


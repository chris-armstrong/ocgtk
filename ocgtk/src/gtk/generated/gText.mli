class text : Text.t ->
  object
    inherit Gtext_signals.text_signals
    method get_activates_default : unit -> bool
    method get_attributes : unit -> Ocgtk_pango.Pango.attr_list option
    method get_buffer : unit -> GEntry_buffer.entry_buffer
    method get_enable_emoji_completion : unit -> bool
    method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model option
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_max_length : unit -> int
    method get_overwrite_mode : unit -> bool
    method get_placeholder_text : unit -> string option
    method get_propagate_text_width : unit -> bool
    method get_tabs : unit -> Ocgtk_pango.Pango.tab_array option
    method get_truncate_multiline : unit -> bool
    method get_visibility : unit -> bool
    method grab_focus_without_selecting : unit -> bool
    method set_activates_default : bool -> unit
    method set_attributes : #Ocgtk_pango.Pango.attr_list option -> unit
    method set_buffer : #GEntry_buffer.entry_buffer -> unit
    method set_enable_emoji_completion : bool -> unit
    method set_extra_menu : #Ocgtk_gio.Gio.menu_model option -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_max_length : int -> unit
    method set_overwrite_mode : bool -> unit
    method set_placeholder_text : string option -> unit
    method set_propagate_text_width : bool -> unit
    method set_tabs : #Ocgtk_pango.Pango.tab_array option -> unit
    method set_truncate_multiline : bool -> unit
    method set_visibility : bool -> unit
    method unset_invisible_char : unit -> unit
    method im_module : string
    method set_im_module : string -> unit
    method invisible_char_set : bool
    method set_invisible_char_set : bool -> unit
    method scroll_offset : int
    method as_text : Text.t
  end


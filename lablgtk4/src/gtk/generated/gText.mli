class text : Text.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gtext_signals.text_signals
    method activates_default : bool
    method set_activates_default : bool -> unit
    method enable_emoji_completion : bool
    method set_enable_emoji_completion : bool -> unit
    method im_module : string
    method set_im_module : string -> unit
    method invisible_char : int
    method set_invisible_char : int -> unit
    method invisible_char_set : bool
    method set_invisible_char_set : bool -> unit
    method max_length : int
    method set_max_length : int -> unit
    method overwrite_mode : bool
    method set_overwrite_mode : bool -> unit
    method placeholder_text : string
    method set_placeholder_text : string -> unit
    method propagate_text_width : bool
    method set_propagate_text_width : bool -> unit
    method scroll_offset : int
    method truncate_multiline : bool
    method set_truncate_multiline : bool -> unit
    method visibility : bool
    method set_visibility : bool -> unit
    method get_buffer : unit -> GEntry_buffer.entry_buffer
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method grab_focus_without_selecting : unit -> bool
    method set_buffer : #GEntry_buffer.entry_buffer -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method unset_invisible_char : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_text : Text.t
  end


(* Signal class defined in gtext_signals.ml *)

(* High-level class for Text *)
class text (obj : Text.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Text.as_widget obj)
  inherit Gtext_signals.text_signals obj

  method activates_default = Text.get_activates_default obj
  method set_activates_default v = Text.set_activates_default obj v

  method enable_emoji_completion = Text.get_enable_emoji_completion obj
  method set_enable_emoji_completion v = Text.set_enable_emoji_completion obj v

  method im_module = Text.get_im_module obj
  method set_im_module v = Text.set_im_module obj v

  method invisible_char = Text.get_invisible_char obj
  method set_invisible_char v = Text.set_invisible_char obj v

  method invisible_char_set = Text.get_invisible_char_set obj
  method set_invisible_char_set v = Text.set_invisible_char_set obj v

  method max_length = Text.get_max_length obj
  method set_max_length v = Text.set_max_length obj v

  method overwrite_mode = Text.get_overwrite_mode obj
  method set_overwrite_mode v = Text.set_overwrite_mode obj v

  method placeholder_text = Text.get_placeholder_text obj
  method set_placeholder_text v = Text.set_placeholder_text obj v

  method propagate_text_width = Text.get_propagate_text_width obj
  method set_propagate_text_width v = Text.set_propagate_text_width obj v

  method scroll_offset = Text.get_scroll_offset obj

  method truncate_multiline = Text.get_truncate_multiline obj
  method set_truncate_multiline v = Text.set_truncate_multiline obj v

  method visibility = Text.get_visibility obj
  method set_visibility v = Text.set_visibility obj v

  method get_buffer : unit -> GEntry_buffer.entry_buffer = fun () -> new  GEntry_buffer.entry_buffer(Text.get_buffer obj )

  method get_input_hints : unit -> Gtk_enums.inputhints = fun () -> (Text.get_input_hints obj )

  method get_input_purpose : unit -> Gtk_enums.inputpurpose = fun () -> (Text.get_input_purpose obj )

  method grab_focus_without_selecting : unit -> bool = fun () -> (Text.grab_focus_without_selecting obj )

  method set_buffer : 'p1. (#GEntry_buffer.entry_buffer as 'p1) -> unit = fun buffer -> (Text.set_buffer obj ( buffer#as_entry_buffer ))

  method set_input_hints : Gtk_enums.inputhints -> unit = fun hints -> (Text.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit = fun purpose -> (Text.set_input_purpose obj purpose)

  method unset_invisible_char : unit -> unit = fun () -> (Text.unset_invisible_char obj )

  method as_widget = (Text.as_widget obj)
    method as_text = obj
end


(* Signal class defined in gtext_signals.ml *)

(* High-level class for Text *)
class text (obj : Text.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Text.as_widget obj)
  inherit Gtext_signals.text_signals obj

  method get_activates_default : unit -> bool =
    fun () ->
      (Text.get_activates_default obj)

  method get_buffer : unit -> GEntry_buffer.entry_buffer =
    fun () ->
      new  GEntry_buffer.entry_buffer(Text.get_buffer obj)

  method get_enable_emoji_completion : unit -> bool =
    fun () ->
      (Text.get_enable_emoji_completion obj)

  method get_input_purpose : unit -> Gtk_enums.inputpurpose =
    fun () ->
      (Text.get_input_purpose obj)

  method get_max_length : unit -> int =
    fun () ->
      (Text.get_max_length obj)

  method get_overwrite_mode : unit -> bool =
    fun () ->
      (Text.get_overwrite_mode obj)

  method get_placeholder_text : unit -> string option =
    fun () ->
      (Text.get_placeholder_text obj)

  method get_propagate_text_width : unit -> bool =
    fun () ->
      (Text.get_propagate_text_width obj)

  method get_truncate_multiline : unit -> bool =
    fun () ->
      (Text.get_truncate_multiline obj)

  method get_visibility : unit -> bool =
    fun () ->
      (Text.get_visibility obj)

  method grab_focus_without_selecting : unit -> bool =
    fun () ->
      (Text.grab_focus_without_selecting obj)

  method set_activates_default : bool -> unit =
    fun activates ->
      (Text.set_activates_default obj activates)

  method set_buffer : 'p1. (#GEntry_buffer.entry_buffer as 'p1) -> unit =
    fun buffer ->
      let buffer = buffer#as_entry_buffer in
      (Text.set_buffer obj buffer)

  method set_enable_emoji_completion : bool -> unit =
    fun enable_emoji_completion ->
      (Text.set_enable_emoji_completion obj enable_emoji_completion)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit =
    fun purpose ->
      (Text.set_input_purpose obj purpose)

  method set_max_length : int -> unit =
    fun length ->
      (Text.set_max_length obj length)

  method set_overwrite_mode : bool -> unit =
    fun overwrite ->
      (Text.set_overwrite_mode obj overwrite)

  method set_placeholder_text : string option -> unit =
    fun text ->
      (Text.set_placeholder_text obj text)

  method set_propagate_text_width : bool -> unit =
    fun propagate_text_width ->
      (Text.set_propagate_text_width obj propagate_text_width)

  method set_truncate_multiline : bool -> unit =
    fun truncate_multiline ->
      (Text.set_truncate_multiline obj truncate_multiline)

  method set_visibility : bool -> unit =
    fun visible ->
      (Text.set_visibility obj visible)

  method unset_invisible_char : unit -> unit =
    fun () ->
      (Text.unset_invisible_char obj)

  method im_module = Text.get_im_module obj
  method set_im_module v =  Text.set_im_module obj v

  method invisible_char_set = Text.get_invisible_char_set obj
  method set_invisible_char_set v =  Text.set_invisible_char_set obj v

  method scroll_offset = Text.get_scroll_offset obj

  method as_widget = (Text.as_widget obj)
    method as_text = obj
end


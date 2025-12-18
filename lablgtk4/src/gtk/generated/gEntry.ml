(* Signal class defined in gentry_signals.ml *)

(* High-level class for Entry *)
class entry (obj : Entry.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Entry.as_widget obj)
  inherit Gentry_signals.entry_signals obj

  method activates_default = Entry.get_activates_default obj
  method set_activates_default v = Entry.set_activates_default obj v

  method enable_emoji_completion = Entry.get_enable_emoji_completion obj
  method set_enable_emoji_completion v = Entry.set_enable_emoji_completion obj v

  method has_frame = Entry.get_has_frame obj
  method set_has_frame v = Entry.set_has_frame obj v

  method im_module = Entry.get_im_module obj
  method set_im_module v = Entry.set_im_module obj v

  method invisible_char = Entry.get_invisible_char obj
  method set_invisible_char v = Entry.set_invisible_char obj v

  method invisible_char_set = Entry.get_invisible_char_set obj
  method set_invisible_char_set v = Entry.set_invisible_char_set obj v

  method max_length = Entry.get_max_length obj
  method set_max_length v = Entry.set_max_length obj v

  method overwrite_mode = Entry.get_overwrite_mode obj
  method set_overwrite_mode v = Entry.set_overwrite_mode obj v

  method placeholder_text = Entry.get_placeholder_text obj
  method set_placeholder_text v = Entry.set_placeholder_text obj v

  method primary_icon_activatable = Entry.get_primary_icon_activatable obj
  method set_primary_icon_activatable v = Entry.set_primary_icon_activatable obj v

  method primary_icon_name = Entry.get_primary_icon_name obj
  method set_primary_icon_name v = Entry.set_primary_icon_name obj v

  method primary_icon_sensitive = Entry.get_primary_icon_sensitive obj
  method set_primary_icon_sensitive v = Entry.set_primary_icon_sensitive obj v

  method primary_icon_tooltip_markup = Entry.get_primary_icon_tooltip_markup obj
  method set_primary_icon_tooltip_markup v = Entry.set_primary_icon_tooltip_markup obj v

  method primary_icon_tooltip_text = Entry.get_primary_icon_tooltip_text obj
  method set_primary_icon_tooltip_text v = Entry.set_primary_icon_tooltip_text obj v

  method progress_fraction = Entry.get_progress_fraction obj
  method set_progress_fraction v = Entry.set_progress_fraction obj v

  method progress_pulse_step = Entry.get_progress_pulse_step obj
  method set_progress_pulse_step v = Entry.set_progress_pulse_step obj v

  method scroll_offset = Entry.get_scroll_offset obj

  method secondary_icon_activatable = Entry.get_secondary_icon_activatable obj
  method set_secondary_icon_activatable v = Entry.set_secondary_icon_activatable obj v

  method secondary_icon_name = Entry.get_secondary_icon_name obj
  method set_secondary_icon_name v = Entry.set_secondary_icon_name obj v

  method secondary_icon_sensitive = Entry.get_secondary_icon_sensitive obj
  method set_secondary_icon_sensitive v = Entry.set_secondary_icon_sensitive obj v

  method secondary_icon_tooltip_markup = Entry.get_secondary_icon_tooltip_markup obj
  method set_secondary_icon_tooltip_markup v = Entry.set_secondary_icon_tooltip_markup obj v

  method secondary_icon_tooltip_text = Entry.get_secondary_icon_tooltip_text obj
  method set_secondary_icon_tooltip_text v = Entry.set_secondary_icon_tooltip_text obj v

  method show_emoji_icon = Entry.get_show_emoji_icon obj
  method set_show_emoji_icon v = Entry.set_show_emoji_icon obj v

  method text_length = Entry.get_text_length obj

  method truncate_multiline = Entry.get_truncate_multiline obj
  method set_truncate_multiline v = Entry.set_truncate_multiline obj v

  method visibility = Entry.get_visibility obj
  method set_visibility v = Entry.set_visibility obj v

  method get_alignment : unit -> float = fun () -> (Entry.get_alignment obj )

  method get_buffer : unit -> GEntry_buffer.entry_buffer = fun () -> new  GEntry_buffer.entry_buffer(Entry.get_buffer obj )

  method get_completion : unit -> GEntry_completion.entry_completion option = fun () -> Option.map (fun ret -> new GEntry_completion.entry_completion ret) (Entry.get_completion obj )

  method get_current_icon_drag_source : unit -> int = fun () -> (Entry.get_current_icon_drag_source obj )

  method get_icon_activatable : Gtk_enums.entryiconposition -> bool = fun icon_pos -> (Entry.get_icon_activatable obj icon_pos)

  method get_icon_at_pos : int -> int -> int = fun x y -> (Entry.get_icon_at_pos obj x y)

  method get_icon_name : Gtk_enums.entryiconposition -> string option = fun icon_pos -> (Entry.get_icon_name obj icon_pos)

  method get_icon_sensitive : Gtk_enums.entryiconposition -> bool = fun icon_pos -> (Entry.get_icon_sensitive obj icon_pos)

  method get_icon_storage_type : Gtk_enums.entryiconposition -> Gtk_enums.imagetype = fun icon_pos -> (Entry.get_icon_storage_type obj icon_pos)

  method get_input_hints : unit -> Gtk_enums.inputhints = fun () -> (Entry.get_input_hints obj )

  method get_input_purpose : unit -> Gtk_enums.inputpurpose = fun () -> (Entry.get_input_purpose obj )

  method grab_focus_without_selecting : unit -> bool = fun () -> (Entry.grab_focus_without_selecting obj )

  method progress_pulse : unit -> unit = fun () -> (Entry.progress_pulse obj )

  method reset_im_context : unit -> unit = fun () -> (Entry.reset_im_context obj )

  method set_alignment : float -> unit = fun xalign -> (Entry.set_alignment obj xalign)

  method set_buffer : 'p1. (#GEntry_buffer.entry_buffer as 'p1) -> unit = fun buffer -> (Entry.set_buffer obj ( buffer#as_entry_buffer ))

  method set_completion : 'p1. (#GEntry_completion.entry_completion as 'p1) option -> unit = fun completion -> (Entry.set_completion obj ( completion |> Option.map (fun x -> x#as_entry_completion) ))

  method set_icon_activatable : Gtk_enums.entryiconposition -> bool -> unit = fun icon_pos activatable -> (Entry.set_icon_activatable obj icon_pos activatable)

  method set_icon_from_icon_name : Gtk_enums.entryiconposition -> string option -> unit = fun icon_pos icon_name -> (Entry.set_icon_from_icon_name obj icon_pos icon_name)

  method set_icon_sensitive : Gtk_enums.entryiconposition -> bool -> unit = fun icon_pos sensitive -> (Entry.set_icon_sensitive obj icon_pos sensitive)

  method set_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option -> unit = fun icon_pos tooltip -> (Entry.set_icon_tooltip_markup obj icon_pos tooltip)

  method set_icon_tooltip_text : Gtk_enums.entryiconposition -> string option -> unit = fun icon_pos tooltip -> (Entry.set_icon_tooltip_text obj icon_pos tooltip)

  method set_input_hints : Gtk_enums.inputhints -> unit = fun hints -> (Entry.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit = fun purpose -> (Entry.set_input_purpose obj purpose)

  method unset_invisible_char : unit -> unit = fun () -> (Entry.unset_invisible_char obj )

  method as_widget = (Entry.as_widget obj)
    method as_entry = obj
end


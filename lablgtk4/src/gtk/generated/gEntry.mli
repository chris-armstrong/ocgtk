class entry : Entry.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gentry_signals.entry_signals
    method get_activates_default : unit -> bool
    method get_alignment : unit -> float
    method get_buffer : unit -> GEntry_buffer.entry_buffer
    method get_completion : unit -> GEntry_completion.entry_completion option
    method get_current_icon_drag_source : unit -> int
    method get_has_frame : unit -> bool
    method get_icon_activatable : Gtk_enums.entryiconposition -> bool
    method get_icon_at_pos : int -> int -> int
    method get_icon_name : Gtk_enums.entryiconposition -> string option
    method get_icon_sensitive : Gtk_enums.entryiconposition -> bool
    method get_icon_storage_type : Gtk_enums.entryiconposition -> Gtk_enums.imagetype
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_max_length : unit -> int
    method get_overwrite_mode : unit -> bool
    method get_placeholder_text : unit -> string option
    method get_progress_fraction : unit -> float
    method get_progress_pulse_step : unit -> float
    method get_visibility : unit -> bool
    method grab_focus_without_selecting : unit -> bool
    method progress_pulse : unit -> unit
    method reset_im_context : unit -> unit
    method set_activates_default : bool -> unit
    method set_alignment : float -> unit
    method set_buffer : #GEntry_buffer.entry_buffer -> unit
    method set_completion : #GEntry_completion.entry_completion option -> unit
    method set_has_frame : bool -> unit
    method set_icon_activatable : Gtk_enums.entryiconposition -> bool -> unit
    method set_icon_from_icon_name : Gtk_enums.entryiconposition -> string option -> unit
    method set_icon_sensitive : Gtk_enums.entryiconposition -> bool -> unit
    method set_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option -> unit
    method set_icon_tooltip_text : Gtk_enums.entryiconposition -> string option -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_max_length : int -> unit
    method set_overwrite_mode : bool -> unit
    method set_placeholder_text : string option -> unit
    method set_progress_fraction : float -> unit
    method set_progress_pulse_step : float -> unit
    method set_visibility : bool -> unit
    method unset_invisible_char : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_entry : Entry.t
  end


(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Entry *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_entry_new"

external new_with_buffer : Gtk.Widget.t -> t = "ml_gtk_entry_new_with_buffer"

(* Properties *)

external get_activates_default : t -> bool = "ml_gtk_entry_get_activates_default"

external set_activates_default : t -> bool -> unit = "ml_gtk_entry_set_activates_default"

external get_enable_emoji_completion : t -> bool = "ml_gtk_entry_get_enable_emoji_completion"

external set_enable_emoji_completion : t -> bool -> unit = "ml_gtk_entry_set_enable_emoji_completion"

external get_has_frame : t -> bool = "ml_gtk_entry_get_has_frame"

external set_has_frame : t -> bool -> unit = "ml_gtk_entry_set_has_frame"

external get_im_module : t -> string = "ml_gtk_entry_get_im_module"

external set_im_module : t -> string -> unit = "ml_gtk_entry_set_im_module"

external get_invisible_char : t -> int = "ml_gtk_entry_get_invisible_char"

external set_invisible_char : t -> int -> unit = "ml_gtk_entry_set_invisible_char"

external get_invisible_char_set : t -> bool = "ml_gtk_entry_get_invisible_char_set"

external set_invisible_char_set : t -> bool -> unit = "ml_gtk_entry_set_invisible_char_set"

external get_max_length : t -> int = "ml_gtk_entry_get_max_length"

external set_max_length : t -> int -> unit = "ml_gtk_entry_set_max_length"

external get_overwrite_mode : t -> bool = "ml_gtk_entry_get_overwrite_mode"

external set_overwrite_mode : t -> bool -> unit = "ml_gtk_entry_set_overwrite_mode"

external get_placeholder_text : t -> string = "ml_gtk_entry_get_placeholder_text"

external set_placeholder_text : t -> string -> unit = "ml_gtk_entry_set_placeholder_text"

external get_primary_icon_activatable : t -> bool = "ml_gtk_entry_get_primary_icon_activatable"

external set_primary_icon_activatable : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_activatable"

external get_primary_icon_name : t -> string = "ml_gtk_entry_get_primary_icon_name"

external set_primary_icon_name : t -> string -> unit = "ml_gtk_entry_set_primary_icon_name"

external get_primary_icon_sensitive : t -> bool = "ml_gtk_entry_get_primary_icon_sensitive"

external set_primary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_sensitive"

external get_primary_icon_tooltip_markup : t -> string = "ml_gtk_entry_get_primary_icon_tooltip_markup"

external set_primary_icon_tooltip_markup : t -> string -> unit = "ml_gtk_entry_set_primary_icon_tooltip_markup"

external get_primary_icon_tooltip_text : t -> string = "ml_gtk_entry_get_primary_icon_tooltip_text"

external set_primary_icon_tooltip_text : t -> string -> unit = "ml_gtk_entry_set_primary_icon_tooltip_text"

external get_progress_fraction : t -> float = "ml_gtk_entry_get_progress_fraction"

external set_progress_fraction : t -> float -> unit = "ml_gtk_entry_set_progress_fraction"

external get_progress_pulse_step : t -> float = "ml_gtk_entry_get_progress_pulse_step"

external set_progress_pulse_step : t -> float -> unit = "ml_gtk_entry_set_progress_pulse_step"

external get_scroll_offset : t -> int = "ml_gtk_entry_get_scroll_offset"

external get_secondary_icon_activatable : t -> bool = "ml_gtk_entry_get_secondary_icon_activatable"

external set_secondary_icon_activatable : t -> bool -> unit = "ml_gtk_entry_set_secondary_icon_activatable"

external get_secondary_icon_name : t -> string = "ml_gtk_entry_get_secondary_icon_name"

external set_secondary_icon_name : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_name"

external get_secondary_icon_sensitive : t -> bool = "ml_gtk_entry_get_secondary_icon_sensitive"

external set_secondary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_secondary_icon_sensitive"

external get_secondary_icon_tooltip_markup : t -> string = "ml_gtk_entry_get_secondary_icon_tooltip_markup"

external set_secondary_icon_tooltip_markup : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_tooltip_markup"

external get_secondary_icon_tooltip_text : t -> string = "ml_gtk_entry_get_secondary_icon_tooltip_text"

external set_secondary_icon_tooltip_text : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_tooltip_text"

external get_show_emoji_icon : t -> bool = "ml_gtk_entry_get_show_emoji_icon"

external set_show_emoji_icon : t -> bool -> unit = "ml_gtk_entry_set_show_emoji_icon"

external get_text_length : t -> int = "ml_gtk_entry_get_text_length"

external get_truncate_multiline : t -> bool = "ml_gtk_entry_get_truncate_multiline"

external set_truncate_multiline : t -> bool -> unit = "ml_gtk_entry_set_truncate_multiline"

external get_visibility : t -> bool = "ml_gtk_entry_get_visibility"

external set_visibility : t -> bool -> unit = "ml_gtk_entry_set_visibility"

external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_entry_set_input_purpose"

external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_entry_set_input_hints"

external set_icon_tooltip_text : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_tooltip_text"

external set_icon_tooltip_markup : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_tooltip_markup"

external set_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool -> unit = "ml_gtk_entry_set_icon_sensitive"

external set_icon_from_icon_name : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_from_icon_name"

external set_icon_activatable : t -> Gtk_enums.entryiconposition -> bool -> unit = "ml_gtk_entry_set_icon_activatable"

external set_completion : t -> Gtk.Widget.t option -> unit = "ml_gtk_entry_set_completion"

external set_buffer : t -> Gtk.Widget.t -> unit = "ml_gtk_entry_set_buffer"

external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"

external reset_im_context : t -> unit = "ml_gtk_entry_reset_im_context"

external progress_pulse : t -> unit = "ml_gtk_entry_progress_pulse"

external grab_focus_without_selecting : t -> bool = "ml_gtk_entry_grab_focus_without_selecting"

external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_entry_get_input_purpose"

external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_entry_get_input_hints"

external get_icon_storage_type : t -> Gtk_enums.entryiconposition -> Gtk_enums.imagetype = "ml_gtk_entry_get_icon_storage_type"

external get_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool = "ml_gtk_entry_get_icon_sensitive"

external get_icon_name : t -> Gtk_enums.entryiconposition -> string = "ml_gtk_entry_get_icon_name"

external get_icon_at_pos : t -> int -> int -> int = "ml_gtk_entry_get_icon_at_pos"

external get_icon_activatable : t -> Gtk_enums.entryiconposition -> bool = "ml_gtk_entry_get_icon_activatable"

external get_current_icon_drag_source : t -> int = "ml_gtk_entry_get_current_icon_drag_source"

external get_completion : t -> Gtk.Widget.t = "ml_gtk_entry_get_completion"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_entry_get_buffer"

external get_alignment : t -> float = "ml_gtk_entry_get_alignment"


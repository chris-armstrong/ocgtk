(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Entry *)

type t = Gtk.Widget.t

(** Create a new Entry *)
external new_ : unit -> t = "ml_gtk_entry_new"

(** Create a new Entry *)
external new_ : unit -> t = "ml_gtk_entry_new_with_buffer"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_entry_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_entry_set_activates_default"

(** Get property: enable-emoji-completion *)
external get_enable_emoji_completion : t -> bool = "ml_gtk_entry_get_enable_emoji_completion"

(** Set property: enable-emoji-completion *)
external set_enable_emoji_completion : t -> bool -> unit = "ml_gtk_entry_set_enable_emoji_completion"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_entry_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_entry_set_has_frame"

(** Get property: invisible-char *)
external get_invisible_char : t -> int = "ml_gtk_entry_get_invisible_char"

(** Set property: invisible-char *)
external set_invisible_char : t -> int -> unit = "ml_gtk_entry_set_invisible_char"

(** Get property: invisible-char-set *)
external get_invisible_char_set : t -> bool = "ml_gtk_entry_get_invisible_char_set"

(** Set property: invisible-char-set *)
external set_invisible_char_set : t -> bool -> unit = "ml_gtk_entry_set_invisible_char_set"

(** Get property: max-length *)
external get_max_length : t -> int = "ml_gtk_entry_get_max_length"

(** Set property: max-length *)
external set_max_length : t -> int -> unit = "ml_gtk_entry_set_max_length"

(** Get property: overwrite-mode *)
external get_overwrite_mode : t -> bool = "ml_gtk_entry_get_overwrite_mode"

(** Set property: overwrite-mode *)
external set_overwrite_mode : t -> bool -> unit = "ml_gtk_entry_set_overwrite_mode"

(** Get property: primary-icon-activatable *)
external get_primary_icon_activatable : t -> bool = "ml_gtk_entry_get_primary_icon_activatable"

(** Set property: primary-icon-activatable *)
external set_primary_icon_activatable : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_activatable"

(** Get property: primary-icon-sensitive *)
external get_primary_icon_sensitive : t -> bool = "ml_gtk_entry_get_primary_icon_sensitive"

(** Set property: primary-icon-sensitive *)
external set_primary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_sensitive"

(** Get property: progress-fraction *)
external get_progress_fraction : t -> float = "ml_gtk_entry_get_progress_fraction"

(** Set property: progress-fraction *)
external set_progress_fraction : t -> float -> unit = "ml_gtk_entry_set_progress_fraction"

(** Get property: progress-pulse-step *)
external get_progress_pulse_step : t -> float = "ml_gtk_entry_get_progress_pulse_step"

(** Set property: progress-pulse-step *)
external set_progress_pulse_step : t -> float -> unit = "ml_gtk_entry_set_progress_pulse_step"

(** Get property: scroll-offset *)
external get_scroll_offset : t -> int = "ml_gtk_entry_get_scroll_offset"

(** Get property: secondary-icon-activatable *)
external get_secondary_icon_activatable : t -> bool = "ml_gtk_entry_get_secondary_icon_activatable"

(** Set property: secondary-icon-activatable *)
external set_secondary_icon_activatable : t -> bool -> unit = "ml_gtk_entry_set_secondary_icon_activatable"

(** Get property: secondary-icon-sensitive *)
external get_secondary_icon_sensitive : t -> bool = "ml_gtk_entry_get_secondary_icon_sensitive"

(** Set property: secondary-icon-sensitive *)
external set_secondary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_secondary_icon_sensitive"

(** Get property: show-emoji-icon *)
external get_show_emoji_icon : t -> bool = "ml_gtk_entry_get_show_emoji_icon"

(** Set property: show-emoji-icon *)
external set_show_emoji_icon : t -> bool -> unit = "ml_gtk_entry_set_show_emoji_icon"

(** Get property: text-length *)
external get_text_length : t -> int = "ml_gtk_entry_get_text_length"

(** Get property: truncate-multiline *)
external get_truncate_multiline : t -> bool = "ml_gtk_entry_get_truncate_multiline"

(** Set property: truncate-multiline *)
external set_truncate_multiline : t -> bool -> unit = "ml_gtk_entry_set_truncate_multiline"

(** Get property: visibility *)
external get_visibility : t -> bool = "ml_gtk_entry_get_visibility"

(** Set property: visibility *)
external set_visibility : t -> bool -> unit = "ml_gtk_entry_set_visibility"

external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"

external set_tabs : t -> unit -> unit = "ml_gtk_entry_set_tabs"

external set_placeholder_text : t -> string -> unit = "ml_gtk_entry_set_placeholder_text"

external set_input_purpose : t -> int -> unit = "ml_gtk_entry_set_input_purpose"

external set_input_hints : t -> int -> unit = "ml_gtk_entry_set_input_hints"

external set_icon_tooltip_text : t -> unit -> string -> unit = "ml_gtk_entry_set_icon_tooltip_text"

external set_icon_tooltip_markup : t -> unit -> string -> unit = "ml_gtk_entry_set_icon_tooltip_markup"

external set_icon_sensitive : t -> unit -> bool -> unit = "ml_gtk_entry_set_icon_sensitive"

external set_icon_from_paintable : t -> unit -> unit -> unit = "ml_gtk_entry_set_icon_from_paintable"

external set_icon_from_icon_name : t -> unit -> string -> unit = "ml_gtk_entry_set_icon_from_icon_name"

external set_icon_from_gicon : t -> unit -> unit -> unit = "ml_gtk_entry_set_icon_from_gicon"

external set_icon_drag_source : t -> unit -> unit -> unit -> unit = "ml_gtk_entry_set_icon_drag_source"

external set_icon_activatable : t -> unit -> bool -> unit = "ml_gtk_entry_set_icon_activatable"

external set_extra_menu : t -> unit -> unit = "ml_gtk_entry_set_extra_menu"

external set_completion : t -> unit -> unit = "ml_gtk_entry_set_completion"

external set_buffer : t -> unit -> unit = "ml_gtk_entry_set_buffer"

external set_attributes : t -> unit -> unit = "ml_gtk_entry_set_attributes"

external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"

external reset_im_context : t -> unit = "ml_gtk_entry_reset_im_context"

external progress_pulse : t -> unit = "ml_gtk_entry_progress_pulse"

external grab_focus_without_selecting : t -> bool = "ml_gtk_entry_grab_focus_without_selecting"

external get_tabs : t -> unit = "ml_gtk_entry_get_tabs"

external get_placeholder_text : t -> string = "ml_gtk_entry_get_placeholder_text"

external get_input_purpose : t -> int = "ml_gtk_entry_get_input_purpose"

external get_input_hints : t -> int = "ml_gtk_entry_get_input_hints"

external get_icon_tooltip_text : t -> unit -> unit = "ml_gtk_entry_get_icon_tooltip_text"

external get_icon_tooltip_markup : t -> unit -> unit = "ml_gtk_entry_get_icon_tooltip_markup"

external get_icon_storage_type : t -> unit -> int = "ml_gtk_entry_get_icon_storage_type"

external get_icon_sensitive : t -> unit -> bool = "ml_gtk_entry_get_icon_sensitive"

external get_icon_paintable : t -> unit -> unit = "ml_gtk_entry_get_icon_paintable"

external get_icon_name : t -> unit -> string = "ml_gtk_entry_get_icon_name"

external get_icon_gicon : t -> unit -> unit = "ml_gtk_entry_get_icon_gicon"

external get_icon_at_pos : t -> unit -> unit -> unit = "ml_gtk_entry_get_icon_at_pos"

external get_icon_area : t -> unit -> unit -> unit = "ml_gtk_entry_get_icon_area"

external get_icon_activatable : t -> unit -> bool = "ml_gtk_entry_get_icon_activatable"

external get_extra_menu : t -> unit = "ml_gtk_entry_get_extra_menu"

external get_current_icon_drag_source : t -> unit = "ml_gtk_entry_get_current_icon_drag_source"

external get_completion : t -> unit = "ml_gtk_entry_get_completion"

external get_buffer : t -> unit = "ml_gtk_entry_get_buffer"

external get_attributes : t -> unit = "ml_gtk_entry_get_attributes"

external get_alignment : t -> float = "ml_gtk_entry_get_alignment"


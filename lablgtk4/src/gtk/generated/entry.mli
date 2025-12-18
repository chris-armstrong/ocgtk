(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Entry *)

type t = [`entry | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Entry *)
external new_ : unit -> t = "ml_gtk_entry_new"

(** Create a new Entry *)
external new_with_buffer : Entry_buffer.t -> t = "ml_gtk_entry_new_with_buffer"

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

(** Get property: im-module *)
external get_im_module : t -> string = "ml_gtk_entry_get_im_module"

(** Set property: im-module *)
external set_im_module : t -> string -> unit = "ml_gtk_entry_set_im_module"

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

(** Get property: placeholder-text *)
external get_placeholder_text : t -> string = "ml_gtk_entry_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> string -> unit = "ml_gtk_entry_set_placeholder_text"

(** Get property: primary-icon-activatable *)
external get_primary_icon_activatable : t -> bool = "ml_gtk_entry_get_primary_icon_activatable"

(** Set property: primary-icon-activatable *)
external set_primary_icon_activatable : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_activatable"

(** Get property: primary-icon-name *)
external get_primary_icon_name : t -> string = "ml_gtk_entry_get_primary_icon_name"

(** Set property: primary-icon-name *)
external set_primary_icon_name : t -> string -> unit = "ml_gtk_entry_set_primary_icon_name"

(** Get property: primary-icon-sensitive *)
external get_primary_icon_sensitive : t -> bool = "ml_gtk_entry_get_primary_icon_sensitive"

(** Set property: primary-icon-sensitive *)
external set_primary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_primary_icon_sensitive"

(** Get property: primary-icon-tooltip-markup *)
external get_primary_icon_tooltip_markup : t -> string = "ml_gtk_entry_get_primary_icon_tooltip_markup"

(** Set property: primary-icon-tooltip-markup *)
external set_primary_icon_tooltip_markup : t -> string -> unit = "ml_gtk_entry_set_primary_icon_tooltip_markup"

(** Get property: primary-icon-tooltip-text *)
external get_primary_icon_tooltip_text : t -> string = "ml_gtk_entry_get_primary_icon_tooltip_text"

(** Set property: primary-icon-tooltip-text *)
external set_primary_icon_tooltip_text : t -> string -> unit = "ml_gtk_entry_set_primary_icon_tooltip_text"

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

(** Get property: secondary-icon-name *)
external get_secondary_icon_name : t -> string = "ml_gtk_entry_get_secondary_icon_name"

(** Set property: secondary-icon-name *)
external set_secondary_icon_name : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_name"

(** Get property: secondary-icon-sensitive *)
external get_secondary_icon_sensitive : t -> bool = "ml_gtk_entry_get_secondary_icon_sensitive"

(** Set property: secondary-icon-sensitive *)
external set_secondary_icon_sensitive : t -> bool -> unit = "ml_gtk_entry_set_secondary_icon_sensitive"

(** Get property: secondary-icon-tooltip-markup *)
external get_secondary_icon_tooltip_markup : t -> string = "ml_gtk_entry_get_secondary_icon_tooltip_markup"

(** Set property: secondary-icon-tooltip-markup *)
external set_secondary_icon_tooltip_markup : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_tooltip_markup"

(** Get property: secondary-icon-tooltip-text *)
external get_secondary_icon_tooltip_text : t -> string = "ml_gtk_entry_get_secondary_icon_tooltip_text"

(** Set property: secondary-icon-tooltip-text *)
external set_secondary_icon_tooltip_text : t -> string -> unit = "ml_gtk_entry_set_secondary_icon_tooltip_text"

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

(** Unsets the invisible char, so that the default invisible char
is used again. See [method@Gtk.Entry.set_invisible_char]. *)
external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"

(** Sets the input purpose which can be used by input methods
to adjust their behavior. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_entry_set_input_purpose"

(** Set additional hints which allow input methods to
fine-tune their behavior. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_entry_set_input_hints"

(** Sets @tooltip as the contents of the tooltip for the icon
at the specified position.

Use %NULL for @tooltip to remove an existing tooltip.

See also [method@Gtk.Widget.set_tooltip_text] and
[method@Gtk.Entry.set_icon_tooltip_markup].

If you unset the widget tooltip via
[method@Gtk.Widget.set_tooltip_text] or
[method@Gtk.Widget.set_tooltip_markup], this sets
[property@Gtk.Widget:has-tooltip] to %FALSE, which suppresses
icon tooltips too. You can resolve this by then calling
[method@Gtk.Widget.set_has_tooltip] to set
[property@Gtk.Widget:has-tooltip] back to %TRUE, or
setting at least one non-empty tooltip on any icon
achieves the same result. *)
external set_icon_tooltip_text : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_tooltip_text"

(** Sets @tooltip as the contents of the tooltip for the icon at
the specified position.

@tooltip is assumed to be marked up with Pango Markup.

Use %NULL for @tooltip to remove an existing tooltip.

See also [method@Gtk.Widget.set_tooltip_markup] and
[method@Gtk.Entry.set_icon_tooltip_text]. *)
external set_icon_tooltip_markup : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_tooltip_markup"

(** Sets the sensitivity for the specified icon. *)
external set_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool -> unit = "ml_gtk_entry_set_icon_sensitive"

(** Sets the icon shown in the entry at the specified position
from the current icon theme.

If the icon name isn’t known, a “broken image” icon will be
displayed instead.

If @icon_name is %NULL, no icon will be shown in the
specified position. *)
external set_icon_from_icon_name : t -> Gtk_enums.entryiconposition -> string option -> unit = "ml_gtk_entry_set_icon_from_icon_name"

(** Sets whether the icon is activatable. *)
external set_icon_activatable : t -> Gtk_enums.entryiconposition -> bool -> unit = "ml_gtk_entry_set_icon_activatable"

(** Sets @completion to be the auxiliary completion object
to use with @entry.

All further configuration of the completion mechanism is
done on @completion using the `GtkEntryCompletion` API.
Completion is disabled if @completion is set to %NULL. *)
external set_completion : t -> Entry_completion.t option -> unit = "ml_gtk_entry_set_completion"

(** Set the `GtkEntryBuffer` object which holds the text for
this widget. *)
external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_entry_set_buffer"

(** Sets the alignment for the contents of the entry.

This controls the horizontal positioning of the contents when
the displayed text is shorter than the width of the entry.

See also: [property@Gtk.Editable:xalign] *)
external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"

(** Reset the input method context of the entry if needed.

This can be necessary in the case where modifying the buffer
would confuse on-going input method behavior. *)
external reset_im_context : t -> unit = "ml_gtk_entry_reset_im_context"

(** Indicates that some progress is made, but you don’t
know how much.

Causes the entry’s progress indicator to enter “activity
mode”, where a block bounces back and forth. Each call to
gtk_entry_progress_pulse() causes the block to move by a
little bit (the amount of movement per pulse is determined
by [method@Gtk.Entry.set_progress_pulse_step]). *)
external progress_pulse : t -> unit = "ml_gtk_entry_progress_pulse"

(** Causes @entry to have keyboard focus.

It behaves like [method@Gtk.Widget.grab_focus], except that it doesn't
select the contents of the entry. You only want to call this on some
special entries which the user usually doesn't want to replace all text
in, such as search-as-you-type entries. *)
external grab_focus_without_selecting : t -> bool = "ml_gtk_entry_grab_focus_without_selecting"

(** Gets the input purpose of the `GtkEntry`. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_entry_get_input_purpose"

(** Gets the input hints of this `GtkEntry`. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_entry_get_input_hints"

(** Gets the type of representation being used by the icon
to store image data.

If the icon has no image data, the return value will
be %GTK_IMAGE_EMPTY. *)
external get_icon_storage_type : t -> Gtk_enums.entryiconposition -> Gtk_enums.imagetype = "ml_gtk_entry_get_icon_storage_type"

(** Returns whether the icon appears sensitive or insensitive. *)
external get_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool = "ml_gtk_entry_get_icon_sensitive"

(** Retrieves the icon name used for the icon.

%NULL is returned if there is no icon or if the icon was set
by some other method (e.g., by `GdkPaintable` or gicon). *)
external get_icon_name : t -> Gtk_enums.entryiconposition -> string option = "ml_gtk_entry_get_icon_name"

(** Finds the icon at the given position and return its index.

The position’s coordinates are relative to the @entry’s
top left corner. If @x, @y doesn’t lie inside an icon,
-1 is returned. This function is intended for use in a
 [signal@Gtk.Widget::query-tooltip] signal handler. *)
external get_icon_at_pos : t -> int -> int -> int = "ml_gtk_entry_get_icon_at_pos"

(** Returns whether the icon is activatable. *)
external get_icon_activatable : t -> Gtk_enums.entryiconposition -> bool = "ml_gtk_entry_get_icon_activatable"

(** Returns the index of the icon which is the source of the
current  DND operation, or -1. *)
external get_current_icon_drag_source : t -> int = "ml_gtk_entry_get_current_icon_drag_source"

(** Returns the auxiliary completion object currently
in use by @entry. *)
external get_completion : t -> Entry_completion.t option = "ml_gtk_entry_get_completion"

(** Get the `GtkEntryBuffer` object which holds the text for
this widget. *)
external get_buffer : t -> Entry_buffer.t = "ml_gtk_entry_get_buffer"

(** Gets the value set by gtk_entry_set_alignment().

See also: [property@Gtk.Editable:xalign] *)
external get_alignment : t -> float = "ml_gtk_entry_get_alignment"


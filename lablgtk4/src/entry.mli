(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Entry *)

type t = [`entry | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Entry *)
external new_ : unit -> t = "ml_gtk_entry_new"

(** Create a new Entry *)
external new_with_buffer : Gtk.widget -> t = "ml_gtk_entry_new_with_buffer"

(* Properties *)

(** Unsets the invisible char, so that the default invisible char
is used again. See [method@Gtk.Entry.set_invisible_char]. *)
external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"

(** Sets whether the contents of the entry are visible or not.

When visibility is set to %FALSE, characters are displayed
as the invisible char, and will also appear that way when
the text in the entry widget is copied elsewhere.

By default, GTK picks the best invisible character available
in the current font, but it can be changed with
[method@Gtk.Entry.set_invisible_char].

Note that you probably want to set [property@Gtk.Entry:input-purpose]
to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
inform input methods about the purpose of this entry,
in addition to setting visibility to %FALSE. *)
external set_visibility : t -> bool -> unit = "ml_gtk_entry_set_visibility"

(** Sets the fraction of total entry width to move the progress
bouncing block for each pulse.

Use [method@Gtk.Entry.progress_pulse] to pulse
the progress. *)
external set_progress_pulse_step : t -> float -> unit = "ml_gtk_entry_set_progress_pulse_step"

(** Causes the entry’s progress indicator to “fill in” the given
fraction of the bar.

The fraction should be between 0.0 and 1.0, inclusive. *)
external set_progress_fraction : t -> float -> unit = "ml_gtk_entry_set_progress_fraction"

(** Sets text to be displayed in @entry when it is empty.

This can be used to give a visual hint of the expected
contents of the `GtkEntry`. *)
external set_placeholder_text : t -> string option -> unit = "ml_gtk_entry_set_placeholder_text"

(** Sets whether the text is overwritten when typing in the `GtkEntry`. *)
external set_overwrite_mode : t -> bool -> unit = "ml_gtk_entry_set_overwrite_mode"

(** Sets the maximum allowed length of the contents of the widget.

If the current contents are longer than the given length, then
they will be truncated to fit. The length is in characters.

This is equivalent to getting @entry's `GtkEntryBuffer` and
calling [method@Gtk.EntryBuffer.set_max_length] on it. *)
external set_max_length : t -> int -> unit = "ml_gtk_entry_set_max_length"

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

(** Sets whether the entry has a beveled frame around it. *)
external set_has_frame : t -> bool -> unit = "ml_gtk_entry_set_has_frame"

(** Sets @completion to be the auxiliary completion object
to use with @entry.

All further configuration of the completion mechanism is
done on @completion using the `GtkEntryCompletion` API.
Completion is disabled if @completion is set to %NULL. *)
external set_completion : t -> Gtk.widget option -> unit = "ml_gtk_entry_set_completion"

(** Set the `GtkEntryBuffer` object which holds the text for
this widget. *)
external set_buffer : t -> Gtk.widget -> unit = "ml_gtk_entry_set_buffer"

(** Sets the alignment for the contents of the entry.

This controls the horizontal positioning of the contents when
the displayed text is shorter than the width of the entry.

See also: [property@Gtk.Editable:xalign] *)
external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"

(** Sets whether pressing Enter in the @entry will activate the default
widget for the window containing the entry.

This usually means that the dialog containing the entry will be closed,
since the default widget is usually one of the dialog buttons. *)
external set_activates_default : t -> bool -> unit = "ml_gtk_entry_set_activates_default"

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

(** Retrieves whether the text in @entry is visible.

See [method@Gtk.Entry.set_visibility]. *)
external get_visibility : t -> bool = "ml_gtk_entry_get_visibility"

(** Retrieves the pulse step set with
gtk_entry_set_progress_pulse_step(). *)
external get_progress_pulse_step : t -> float = "ml_gtk_entry_get_progress_pulse_step"

(** Returns the current fraction of the task that’s been completed.

See [method@Gtk.Entry.set_progress_fraction]. *)
external get_progress_fraction : t -> float = "ml_gtk_entry_get_progress_fraction"

(** Retrieves the text that will be displayed when @entry
is empty and unfocused *)
external get_placeholder_text : t -> string option = "ml_gtk_entry_get_placeholder_text"

(** Gets whether the `GtkEntry` is in overwrite mode. *)
external get_overwrite_mode : t -> bool = "ml_gtk_entry_get_overwrite_mode"

(** Retrieves the maximum allowed length of the text in @entry.

See [method@Gtk.Entry.set_max_length]. *)
external get_max_length : t -> int = "ml_gtk_entry_get_max_length"

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

(** Gets the value set by gtk_entry_set_has_frame(). *)
external get_has_frame : t -> bool = "ml_gtk_entry_get_has_frame"

(** Returns the index of the icon which is the source of the
current  DND operation, or -1. *)
external get_current_icon_drag_source : t -> int = "ml_gtk_entry_get_current_icon_drag_source"

(** Returns the auxiliary completion object currently
in use by @entry. *)
external get_completion : t -> Gtk.widget option = "ml_gtk_entry_get_completion"

(** Get the `GtkEntryBuffer` object which holds the text for
this widget. *)
external get_buffer : t -> Gtk.widget = "ml_gtk_entry_get_buffer"

(** Gets the value set by gtk_entry_set_alignment().

See also: [property@Gtk.Editable:xalign] *)
external get_alignment : t -> float = "ml_gtk_entry_get_alignment"

(** Retrieves the value set by gtk_entry_set_activates_default(). *)
external get_activates_default : t -> bool = "ml_gtk_entry_get_activates_default"


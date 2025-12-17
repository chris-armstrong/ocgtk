(* GENERATED CODE - DO NOT EDIT *)
(* EntryCompletion: EntryCompletion *)

type t = [`entry_completion | `object_] Gobject.obj

(** Create a new EntryCompletion *)
external new_ : unit -> t = "ml_gtk_entry_completion_new"

(** Create a new EntryCompletion *)
external new_with_area : Cell_area_and__cell_area_context.Cell_area.t -> t = "ml_gtk_entry_completion_new_with_area"

(* Properties *)

(** Convenience function for setting up the most used case of this code: a
completion list with just strings.

This function will set up @completion
to have a list displaying all (and just) strings in the completion list,
and to get those strings from @column in the model of @completion.

This functions creates and adds a `GtkCellRendererText` for the selected
column. If you need to set the text column, but don't want the cell
renderer, use g_object_set() to set the
[property@Gtk.EntryCompletion:text-column] property directly. *)
external set_text_column : t -> int -> unit = "ml_gtk_entry_completion_set_text_column"

(** Sets whether the completion popup window will appear even if there is
only a single match.

You may want to set this to %FALSE if you
are using [property@Gtk.EntryCompletion:inline-completion]. *)
external set_popup_single_match : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_single_match"

(** Sets whether the completion popup window will be resized to be the same
width as the entry. *)
external set_popup_set_width : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_set_width"

(** Sets whether the completions should be presented in a popup window. *)
external set_popup_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_completion"

(** Sets the model for a `GtkEntryCompletion`.

If @completion already has a model set, it will remove it
before setting the new model. If model is %NULL, then it
will unset the model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_entry_completion_set_model"

(** Requires the length of the search key for @completion to be at least
@length.

This is useful for long lists, where completing using a small
key takes a lot of time and will come up with meaningless results anyway
(ie, a too large dataset). *)
external set_minimum_key_length : t -> int -> unit = "ml_gtk_entry_completion_set_minimum_key_length"

(** Sets whether it is possible to cycle through the possible completions
inside the entry. *)
external set_inline_selection : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_selection"

(** Sets whether the common prefix of the possible completions should
be automatically inserted in the entry. *)
external set_inline_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_completion"

(** Requests a prefix insertion. *)
external insert_prefix : t -> unit = "ml_gtk_entry_completion_insert_prefix"

(** Returns the column in the model of @completion to get strings from. *)
external get_text_column : t -> int = "ml_gtk_entry_completion_get_text_column"

(** Returns whether the completion popup window will appear even if there is
only a single match. *)
external get_popup_single_match : t -> bool = "ml_gtk_entry_completion_get_popup_single_match"

(** Returns whether the completion popup window will be resized to the
width of the entry. *)
external get_popup_set_width : t -> bool = "ml_gtk_entry_completion_get_popup_set_width"

(** Returns whether the completions should be presented in a popup window. *)
external get_popup_completion : t -> bool = "ml_gtk_entry_completion_get_popup_completion"

(** Returns the model the `GtkEntryCompletion` is using as data source.

Returns %NULL if the model is unset. *)
external get_model : t -> Tree_model.t option = "ml_gtk_entry_completion_get_model"

(** Returns the minimum key length as set for @completion. *)
external get_minimum_key_length : t -> int = "ml_gtk_entry_completion_get_minimum_key_length"

(** Returns %TRUE if inline-selection mode is turned on. *)
external get_inline_selection : t -> bool = "ml_gtk_entry_completion_get_inline_selection"

(** Returns whether the common prefix of the possible completions should
be automatically inserted in the entry. *)
external get_inline_completion : t -> bool = "ml_gtk_entry_completion_get_inline_completion"

(** Gets the entry @completion has been attached to. *)
external get_entry : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_entry_completion_get_entry"

(** Get the original text entered by the user that triggered
the completion or %NULL if there’s no completion ongoing. *)
external get_completion_prefix : t -> string option = "ml_gtk_entry_completion_get_completion_prefix"

(** Requests a completion operation, or in other words a refiltering of the
current list with completions, using the current key.

The completion list view will be updated accordingly. *)
external complete : t -> unit = "ml_gtk_entry_completion_complete"


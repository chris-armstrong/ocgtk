(* GENERATED CODE - DO NOT EDIT *)
(* EntryCompletion: EntryCompletion *)

type t = [`entry_completion | `object_] Gobject.obj

(** Create a new EntryCompletion *)
external new_ : unit -> t = "ml_gtk_entry_completion_new"

(** Create a new EntryCompletion *)
external new_with_area : Cell_area_and__cell_area_context.Cell_area.t -> t = "ml_gtk_entry_completion_new_with_area"

(* Properties *)

(** Get property: inline-completion *)
external get_inline_completion : t -> bool = "ml_gtk_entry_completion_get_inline_completion"

(** Set property: inline-completion *)
external set_inline_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_completion"

(** Get property: inline-selection *)
external get_inline_selection : t -> bool = "ml_gtk_entry_completion_get_inline_selection"

(** Set property: inline-selection *)
external set_inline_selection : t -> bool -> unit = "ml_gtk_entry_completion_set_inline_selection"

(** Get property: minimum-key-length *)
external get_minimum_key_length : t -> int = "ml_gtk_entry_completion_get_minimum_key_length"

(** Set property: minimum-key-length *)
external set_minimum_key_length : t -> int -> unit = "ml_gtk_entry_completion_set_minimum_key_length"

(** Get property: popup-completion *)
external get_popup_completion : t -> bool = "ml_gtk_entry_completion_get_popup_completion"

(** Set property: popup-completion *)
external set_popup_completion : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_completion"

(** Get property: popup-set-width *)
external get_popup_set_width : t -> bool = "ml_gtk_entry_completion_get_popup_set_width"

(** Set property: popup-set-width *)
external set_popup_set_width : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_set_width"

(** Get property: popup-single-match *)
external get_popup_single_match : t -> bool = "ml_gtk_entry_completion_get_popup_single_match"

(** Set property: popup-single-match *)
external set_popup_single_match : t -> bool -> unit = "ml_gtk_entry_completion_set_popup_single_match"

(** Get property: text-column *)
external get_text_column : t -> int = "ml_gtk_entry_completion_get_text_column"

(** Set property: text-column *)
external set_text_column : t -> int -> unit = "ml_gtk_entry_completion_set_text_column"

(** Sets the model for a `GtkEntryCompletion`.

If @completion already has a model set, it will remove it
before setting the new model. If model is %NULL, then it
will unset the model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_entry_completion_set_model"

(** Requests a prefix insertion. *)
external insert_prefix : t -> unit = "ml_gtk_entry_completion_insert_prefix"

(** Returns the model the `GtkEntryCompletion` is using as data source.

Returns %NULL if the model is unset. *)
external get_model : t -> Tree_model.t option = "ml_gtk_entry_completion_get_model"

(** Gets the entry @completion has been attached to. *)
external get_entry : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_entry_completion_get_entry"

(** Get the original text entered by the user that triggered
the completion or %NULL if there’s no completion ongoing. *)
external get_completion_prefix : t -> string option = "ml_gtk_entry_completion_get_completion_prefix"

(** Requests a completion operation, or in other words a refiltering of the
current list with completions, using the current key.

The completion list view will be updated accordingly. *)
external complete : t -> unit = "ml_gtk_entry_completion_complete"


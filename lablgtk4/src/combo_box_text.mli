(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ComboBoxText *)

type t = [`combo_box_text | `combo_box | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new ComboBoxText *)
external new_ : unit -> t = "ml_gtk_combo_box_text_new"

(** Create a new ComboBoxText *)
external new_with_entry : unit -> t = "ml_gtk_combo_box_text_new_with_entry"

(** Removes all the text entries from the combo box. *)
external remove_all : t -> unit = "ml_gtk_combo_box_text_remove_all"

(** Removes the string at @position from @combo_box. *)
external remove : t -> int -> unit = "ml_gtk_combo_box_text_remove"

(** Prepends @text to the list of strings stored in @combo_box.

This is the same as calling [method@Gtk.ComboBoxText.insert_text]
with a position of 0. *)
external prepend_text : t -> string -> unit = "ml_gtk_combo_box_text_prepend_text"

(** Prepends @text to the list of strings stored in @combo_box.

If @id is non-%NULL then it is used as the ID of the row.

This is the same as calling [method@Gtk.ComboBoxText.insert]
with a position of 0. *)
external prepend : t -> string option -> string -> unit = "ml_gtk_combo_box_text_prepend"

(** Inserts @text at @position in the list of strings stored in @combo_box.

If @position is negative then @text is appended.

This is the same as calling [method@Gtk.ComboBoxText.insert]
with a %NULL ID string. *)
external insert_text : t -> int -> string -> unit = "ml_gtk_combo_box_text_insert_text"

(** Inserts @text at @position in the list of strings stored in @combo_box.

If @id is non-%NULL then it is used as the ID of the row.
See [property@Gtk.ComboBox:id-column].

If @position is negative then @text is appended. *)
external insert : t -> int -> string option -> string -> unit = "ml_gtk_combo_box_text_insert"

(** Appends @text to the list of strings stored in @combo_box.

This is the same as calling [method@Gtk.ComboBoxText.insert_text]
with a position of -1. *)
external append_text : t -> string -> unit = "ml_gtk_combo_box_text_append_text"

(** Appends @text to the list of strings stored in @combo_box.

If @id is non-%NULL then it is used as the ID of the row.

This is the same as calling [method@Gtk.ComboBoxText.insert]
with a position of -1. *)
external append : t -> string option -> string -> unit = "ml_gtk_combo_box_text_append"


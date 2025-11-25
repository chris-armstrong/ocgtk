(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextMark *)

type t = Gtk.widget

(** Create a new TextMark *)
external new_ : string option -> bool -> t = "ml_gtk_text_mark_new"

(* Properties *)

external set_visible : t -> bool -> unit = "ml_gtk_text_mark_set_visible"

(** Returns %TRUE if the mark is visible.

A cursor is displayed for visible marks. *)
external get_visible : t -> bool = "ml_gtk_text_mark_get_visible"

(** Returns the mark name.

Returns %NULL for anonymous marks. *)
external get_name : t -> string = "ml_gtk_text_mark_get_name"

(** Determines whether the mark has left gravity. *)
external get_left_gravity : t -> bool = "ml_gtk_text_mark_get_left_gravity"

(** Returns %TRUE if the mark has been removed from its buffer.

See [method@Gtk.TextBuffer.add_mark] for a way to add it
to a buffer again. *)
external get_deleted : t -> bool = "ml_gtk_text_mark_get_deleted"

(** Gets the buffer this mark is located inside.

Returns %NULL if the mark is deleted. *)
external get_buffer : t -> Gtk.widget = "ml_gtk_text_mark_get_buffer"


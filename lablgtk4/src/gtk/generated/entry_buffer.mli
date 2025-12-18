(* GENERATED CODE - DO NOT EDIT *)
(* EntryBuffer: EntryBuffer *)

type t = [`entry_buffer | `object_] Gobject.obj

(** Create a new EntryBuffer *)
external new_ : string option -> int -> t = "ml_gtk_entry_buffer_new"

(* Properties *)

(** Get property: length *)
external get_length : t -> int = "ml_gtk_entry_buffer_get_length"

(** Get property: max-length *)
external get_max_length : t -> int = "ml_gtk_entry_buffer_get_max_length"

(** Set property: max-length *)
external set_max_length : t -> int -> unit = "ml_gtk_entry_buffer_set_max_length"

(** Get property: text *)
external get_text : t -> string = "ml_gtk_entry_buffer_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_entry_buffer_set_text"

(** Inserts @n_chars characters of @chars into the contents of the
buffer, at position @position.

If @n_chars is negative, then characters from chars will be inserted
until a null-terminator is found. If @position or @n_chars are out of
bounds, or the maximum buffer text length is exceeded, then they are
coerced to sane values.

Note that the position and length are in characters, not in bytes. *)
external insert_text : t -> int -> string -> int -> int = "ml_gtk_entry_buffer_insert_text"

(** Used when subclassing `GtkEntryBuffer`. *)
external emit_inserted_text : t -> int -> string -> int -> unit = "ml_gtk_entry_buffer_emit_inserted_text"

(** Used when subclassing `GtkEntryBuffer`. *)
external emit_deleted_text : t -> int -> int -> unit = "ml_gtk_entry_buffer_emit_deleted_text"

(** Deletes a sequence of characters from the buffer.

@n_chars characters are deleted starting at @position.
If @n_chars is negative, then all characters until the
end of the text are deleted.

If @position or @n_chars are out of bounds, then they
are coerced to sane values.

Note that the positions are specified in characters,
not bytes. *)
external delete_text : t -> int -> int -> int = "ml_gtk_entry_buffer_delete_text"


(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EntryBuffer *)

type t = Gtk.widget

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

external insert_text : t -> int -> string -> int -> int = "ml_gtk_entry_buffer_insert_text"

external emit_inserted_text : t -> int -> string -> int -> unit = "ml_gtk_entry_buffer_emit_inserted_text"

external emit_deleted_text : t -> int -> int -> unit = "ml_gtk_entry_buffer_emit_deleted_text"

external delete_text : t -> int -> int -> int = "ml_gtk_entry_buffer_delete_text"


(* GENERATED CODE - DO NOT EDIT *)
(* TextTagTable: TextTagTable *)

type t = [`text_tag_table | `object_] Gobject.obj

(** Create a new TextTagTable *)
external new_ : unit -> t = "ml_gtk_text_tag_table_new"

(* Methods *)
(** Remove a tag from the table.

If a `GtkTextBuffer` has @table as its tag table, the tag is
removed from the buffer. The table’s reference to the tag is
removed, so the tag will end up destroyed if you don’t have
a reference to it. *)
external remove : t -> Text_tag.t -> unit = "ml_gtk_text_tag_table_remove"

(** Look up a named tag. *)
external lookup : t -> string -> Text_tag.t option = "ml_gtk_text_tag_table_lookup"

(** Returns the size of the table (number of tags) *)
external get_size : t -> int = "ml_gtk_text_tag_table_get_size"

(** Add a tag to the table.

The tag is assigned the highest priority in the table.

@tag must not be in a tag table already, and may not have
the same name as an already-added tag. *)
external add : t -> Text_tag.t -> bool = "ml_gtk_text_tag_table_add"


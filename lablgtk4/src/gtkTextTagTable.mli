(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextTagTable *)

type t = Gtk.Widget.t

(** Create a new TextTagTable *)
external new_ : unit -> t = "ml_gtk_text_tag_table_new"

(* Methods *)

(** Add a tag to the table *)
external add : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_add"

(** Remove a tag from the table *)
external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_remove"

(** Lookup a tag by name *)
external lookup : t -> string -> Gtk.Widget.t option = "ml_gtk_text_tag_table_lookup"

(** Get the number of tags in the table *)
external get_size : t -> int = "ml_gtk_text_tag_table_get_size"

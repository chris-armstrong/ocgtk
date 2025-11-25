(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextTag *)

type t = Gtk.widget

(** Create a new TextTag *)
external new_ : string option -> t = "ml_gtk_text_tag_new"

(* Properties *)

(** Sets the priority of a `GtkTextTag`.

Valid priorities start at 0 and go to one less than
[method@Gtk.TextTagTable.get_size]. Each tag in a table
has a unique priority; setting the priority of one tag shifts
the priorities of all the other tags in the table to maintain
a unique priority for each tag.

Higher priority tags “win” if two tags both set the same text
attribute. When adding a tag to a tag table, it will be assigned
the highest priority in the table by default; so normally the
precedence of a set of tags is the order in which they were added
to the table, or created with [method@Gtk.TextBuffer.create_tag],
which adds the tag to the buffer’s table automatically. *)
external set_priority : t -> int -> unit = "ml_gtk_text_tag_set_priority"

(** Get the tag priority. *)
external get_priority : t -> int = "ml_gtk_text_tag_get_priority"

(** Emits the [signal@Gtk.TextTagTable::tag-changed] signal on the
`GtkTextTagTable` where the tag is included.

The signal is already emitted when setting a `GtkTextTag` property.
This function is useful for a `GtkTextTag` subclass. *)
external changed : t -> bool -> unit = "ml_gtk_text_tag_changed"


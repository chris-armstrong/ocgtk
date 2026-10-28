(* GENERATED CODE - DO NOT EDIT *)
(* TextTagTable: TextTagTable *)

[@@@ocaml.text
"Collects the tags in a [GtkTextBuffer].\n\n\
 You may wish to begin by reading the\n\
 text widget conceptual overview,\n\
 which gives an overview of all the objects and data types\n\
 related to the text widget and how they work together.\n\n\
 {b GtkTextTagTables as GtkBuildable}\n\n\
 The [GtkTextTagTable] implementation of the [GtkBuildable] interface\n\
 supports adding tags by specifying “tag” as the “type” attribute\n\
 of a [<child>] element.\n\n\
 An example of a UI definition fragment specifying tags:\n\n\
 {[\n\
 <object class=\"GtkTextTagTable\">\n\
\ <child type=\"tag\">\n\
\   <object class=\"GtkTextTag\"/>\n\
\ </child>\n\
 </object>\n\
 ]}\n\n\
 The class built on this module is in {!Ocgtk.Text_tag_table}."]

type t = [ `text_tag_table | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_text_tag_table_get_type"

external new_ : unit -> t = "ml_gtk_text_tag_table_new"
(** Creates a new [GtkTextTagTable].

    The table contains no tags by default. *)

(* Methods *)

external remove : t -> Text_tag.t -> unit = "ml_gtk_text_tag_table_remove"
(** Remove a tag from the table.

    If a [GtkTextBuffer] has [table] as its tag table, the tag is removed from
    the buffer. The table’s reference to the tag is removed, so the tag will end
    up destroyed if you don’t have a reference to it. *)

external lookup : t -> string -> Text_tag.t option
  = "ml_gtk_text_tag_table_lookup"
(** Look up a named tag. *)

external get_size : t -> int = "ml_gtk_text_tag_table_get_size"
(** Returns the size of the table (number of tags) *)

external add : t -> Text_tag.t -> bool = "ml_gtk_text_tag_table_add"
(** Add a tag to the table.

    The tag is assigned the highest priority in the table.

    [tag] must not be in a tag table already, and may not have the same name as
    an already-added tag. *)

val on_tag_added :
  ?after:bool ->
  t ->
  callback:(tag:Text_tag.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted every time a new tag is added in the [GtkTextTagTable]. *)

val on_tag_changed :
  ?after:bool ->
  t ->
  callback:(tag:Text_tag.t -> size_changed:bool -> unit) ->
  Gobject.Signal.handler_id
(** Emitted every time a tag in the [GtkTextTagTable] changes. *)

val on_tag_removed :
  ?after:bool ->
  t ->
  callback:(tag:Text_tag.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted every time a tag is removed from the [GtkTextTagTable].

    The [tag] is still valid by the time the signal is emitted, but it is not
    associated with a tag table any more. *)

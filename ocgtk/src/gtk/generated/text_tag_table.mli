(* GENERATED CODE - DO NOT EDIT *)
(* TextTagTable: TextTagTable *)

(** Collects the tags in a [GtkTextBuffer].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    {b GtkTextTagTables as GtkBuildable}

    The [GtkTextTagTable] implementation of the [GtkBuildable] interface
    supports adding tags by specifying “tag” as the “type” attribute of a
    [<child>] element.

    An example of a UI definition fragment specifying tags:

    {[
    <object class=”GtkTextTagTable”>
     <child type=”tag”>
       <object class=”GtkTextTag”/>
     </child>
    </object>
    ]} *)

type t = [ `text_tag_table | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_text_tag_table_new"
(** Create a new TextTagTable *)

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

val on_tag_changed :
  ?after:bool ->
  t ->
  callback:(tag:Text_tag.t -> size_changed:bool -> unit) ->
  Gobject.Signal.handler_id

val on_tag_removed :
  ?after:bool ->
  t ->
  callback:(tag:Text_tag.t -> unit) ->
  Gobject.Signal.handler_id

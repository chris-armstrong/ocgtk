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
 Its methods, signals and properties are on {!class-type-text_tag_table_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Text_tag_table}."]

(** The methods, signals and properties of a [GtkTextTagTable]. *)
class type text_tag_table_t = object
  inherit Buildable.buildable_t

  method on_tag_added :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_changed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> size_changed:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_removed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add : Text_tag.text_tag_t -> bool
  method get_size : unit -> int
  method lookup : string -> Text_tag.text_tag_t option
  method remove : Text_tag.text_tag_t -> unit
  method as_text_tag_table : Raw.Text_tag_table.t
end

class text_tag_table : Raw.Text_tag_table.t -> text_tag_table_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Text_tag_table.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTextTagTable], give one already wrapped. *)

val new_ : unit -> text_tag_table_t

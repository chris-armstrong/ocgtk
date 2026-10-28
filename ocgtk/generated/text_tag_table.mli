(** Collects the tags in a [GtkTextBuffer].

    Its methods, signals and properties are on {!class-type-text_tag_table_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Text_tag_table}. *)

(** {1:class Class} *)

class type text_tag_table_t = object
  inherit Buildable.buildable_t

  (** {2:signals Signals} *)

  method on_tag_added :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted every time a new tag is added in the [GtkTextTagTable]. *)

  method on_tag_changed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> size_changed:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted every time a tag in the [GtkTextTagTable] changes. *)

  method on_tag_removed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted every time a tag is removed from the [GtkTextTagTable].

      The [tag] is still valid by the time the signal is emitted, but it is not
      associated with a tag table any more. *)

  (** {2:methods Methods} *)

  method add : Text_tag.text_tag_t -> bool
  (** Add a tag to the table.

      The tag is assigned the highest priority in the table.

      [tag] must not be in a tag table already, and may not have the same name
      as an already-added tag. *)

  method get_size : unit -> int
  (** Returns the size of the table (number of tags) *)

  method lookup : string -> Text_tag.text_tag_t option
  (** Look up a named tag. *)

  method remove : Text_tag.text_tag_t -> unit
  (** Remove a tag from the table.

      If a [GtkTextBuffer] has [table] as its tag table, the tag is removed from
      the buffer. The table’s reference to the tag is removed, so the tag will
      end up destroyed if you don’t have a reference to it. *)

  (** {2:conversions Conversions} *)

  method as_text_tag_table : Raw.Text_tag_table.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [TextTagTable].}\n\n\
     Inherits from: [GObject.Object]\n\n\
     Implements:\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\n\
     Collects the tags in a [GtkTextBuffer].\n\n\
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
     ]}"]

class text_tag_table : Raw.Text_tag_table.t -> text_tag_table_t
(** Wraps a raw handle of {!Ocgtk.Raw.Text_tag_table.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Collects the tags in a [GtkTextBuffer].\n\n\
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
 ]}"]

(** {1:constructors Constructors} *)

val new_ : unit -> text_tag_table_t
(** Creates a new [GtkTextTagTable].

    The table contains no tags by default. *)

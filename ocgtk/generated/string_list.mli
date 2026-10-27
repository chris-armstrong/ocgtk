[@@@ocaml.text
"A list model that wraps an array of strings.\n\n\
 The objects in the model are of type [Gtk.StringObject] and have\n\
 a \"string\" property that can be used inside expressions.\n\n\
 [GtkStringList] is well-suited for any place where you would\n\
 typically use a char*\\[\\], but need a list model.\n\n\
 {b GtkStringList as GtkBuildable}\n\n\
 The [GtkStringList] implementation of the [GtkBuildable] interface\n\
 supports adding items directly using the [<items>] element and\n\
 specifying [<item>] elements for each item. Each [<item>] element\n\
 supports the regular translation attributes “translatable”,\n\
 “context” and “comments”.\n\n\
 Here is a UI definition fragment specifying a [GtkStringList]\n\n\
 {[\n\
 <object class=\"GtkStringList\">\n\
\  <items>\n\
\    <item translatable=\"yes\">Factory</item>\n\
\    <item translatable=\"yes\">Home</item>\n\
\    <item translatable=\"yes\">Subway</item>\n\
\  </items>\n\
 </object>\n\
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-string_list_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.String_list}."]

(** The methods, signals and properties of a [GtkStringList]. *)
class type string_list_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  method append : string -> unit
  (** Appends [string] to [self].

      The [string] will be copied. See [Gtk.StringList.take] for a way to avoid
      that. *)

  method find : string -> int
  (** Gets the position of the [string] in [self].

      If [self] does not contain [string] item, [G_MAXUINT] is returned. *)

  method get_string : int -> string option
  (** Gets the string that is at [position] in [self].

      If [self] does not contain [position] items, [NULL] is returned.

      This function returns the const char *. To get the object wrapping it, use
      g_list_model_get_item(). *)

  method remove : int -> unit
  (** Removes the string at [position] from [self].

      [position] must be smaller than the current length of the list. *)

  method splice : int -> int -> string array option -> unit
  (** Changes [self] by removing [n_removals] strings and adding [additions] to
      it.

      This function is more efficient than [Gtk.StringList.append] and
      [Gtk.StringList.remove], because it only emits the ::items-changed signal
      once for the change.

      This function copies the strings in [additions].

      The parameters [position] and [n_removals] must be correct (ie: [position]
      \+ [n_removals] must be less than or equal to the length of the list at
      the time this function is called). *)

  method take : string -> unit
  [@@ocaml.doc
    "Adds [string] to self at the end, and takes\n\
     ownership of it.\n\n\
     This variant of [Gtk.StringList.append]\n\
     is convenient for formatting strings:\n\n\
     {[\n\
     gtk_string_list_take (self, g_strdup_print (\"%d dollars\", lots));\n\
     ]}"]

  method item_type : Gobject.Type.t
  method n_items : int
  method as_string_list : Raw.String_list.t
end

class string_list : Raw.String_list.t -> string_list_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.String_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStringList], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string array option -> string_list_t
(** Creates a new [GtkStringList] with the given [strings]. *)

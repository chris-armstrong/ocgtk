(* GENERATED CODE - DO NOT EDIT *)
(* StringList: StringList *)

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
 ]}"]

type t = [ `string_list | `object_ ] Gobject.obj

external new_ : string array option -> t = "ml_gtk_string_list_new"
(** Create a new StringList *)

(* Methods *)
external take : t -> string -> unit = "ml_gtk_string_list_take"
[@@ocaml.doc
  "Adds [string] to self at the end, and takes\n\
   ownership of it.\n\n\
   This variant of [Gtk.StringList.append]\n\
   is convenient for formatting strings:\n\n\
   {[\n\
   gtk_string_list_take (self, g_strdup_print (\"%d dollars\", lots));\n\
   ]}"]

external splice : t -> int -> int -> string array option -> unit
  = "ml_gtk_string_list_splice"
(** Changes [self] by removing [n_removals] strings and adding [additions] to
    it.

    This function is more efficient than [Gtk.StringList.append] and
    [Gtk.StringList.remove], because it only emits the ::items-changed signal
    once for the change.

    This function copies the strings in [additions].

    The parameters [position] and [n_removals] must be correct (ie: [position] +
    [n_removals] must be less than or equal to the length of the list at the
    time this function is called). *)

external remove : t -> int -> unit = "ml_gtk_string_list_remove"
(** Removes the string at [position] from [self].

    [position] must be smaller than the current length of the list. *)

external get_string : t -> int -> string option
  = "ml_gtk_string_list_get_string"
(** Gets the string that is at [position] in [self].

    If [self] does not contain [position] items, [NULL] is returned.

    This function returns the const char *. To get the object wrapping it, use
    g_list_model_get_item(). *)

external find : t -> string -> int = "ml_gtk_string_list_find"
(** Gets the position of the [string] in [self].

    If [self] does not contain [string] item, [G_MAXUINT] is returned. *)

external append : t -> string -> unit = "ml_gtk_string_list_append"
(** Appends [string] to [self].

    The [string] will be copied. See [Gtk.StringList.take] for a way to avoid
    that. *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_string_list_get_item_type"
(** Get property: item-type *)

external get_n_items : t -> int = "ml_gtk_string_list_get_n_items"
(** Get property: n-items *)

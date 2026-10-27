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
 Its methods, signals and properties are on {!class-type-string_list_t}. The \
 functions it is built on are in {!Ocgtk.Raw.String_list}."]

(** The methods, signals and properties of a [GtkStringList]. *)
class type string_list_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t
  method append : string -> unit
  method find : string -> int
  method get_string : int -> string option
  method remove : int -> unit
  method splice : int -> int -> string array option -> unit
  method take : string -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_string_list : Raw.String_list.t
end

class string_list : Raw.String_list.t -> string_list_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.String_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStringList], give one already wrapped. *)

val new_ : string array option -> string_list_t

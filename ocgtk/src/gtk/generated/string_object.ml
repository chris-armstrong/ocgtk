(* GENERATED CODE - DO NOT EDIT *)
(* StringObject: StringObject *)

(** The type of items in a [GtkStringList].

    A [GtkStringObject] is a wrapper around a [const char*]; it has a
    [Gtk.StringObject:string] property that can be used for property bindings
    and expressions. *)

type t = [ `string_object | `object_ ] Gobject.obj

external new_ : string -> t = "ml_gtk_string_object_new"
(** Create a new StringObject *)

(* Methods *)

external get_string : t -> string = "ml_gtk_string_object_get_string"
(** Returns the string contained in a [GtkStringObject]. *)

(* Properties *)

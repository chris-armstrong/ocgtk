(** The type of items in a [GtkStringList].

    A [GtkStringObject] is a wrapper around a [const char*]; it has a
    [Gtk.StringObject:string] property that can be used for property bindings
    and expressions.

    Its methods, signals and properties are on {!class-type-string_object_t}.
    The functions it is built on are in {!Ocgtk.Raw.String_object}. *)

(** The methods, signals and properties of a [GtkStringObject]. *)
class type string_object_t = object
  method get_string : unit -> string
  method as_string_object : Raw.String_object.t
end

class string_object : Raw.String_object.t -> string_object_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.String_object.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStringObject], give one already wrapped. *)

val new_ : string -> string_object_t

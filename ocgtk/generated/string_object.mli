(** The type of items in a [GtkStringList].

    Its methods, signals and properties are on {!class-type-string_object_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.String_object}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StringObject].}

    The type of items in a [GtkStringList].

    A [GtkStringObject] is a wrapper around a [const char*]; it has a
    [Gtk.StringObject:string] property that can be used for property bindings
    and expressions. *)
class type string_object_t = object
  (** {2:methods Methods} *)

  method get_string : unit -> string
  (** Returns the string contained in a [GtkStringObject]. *)

  (** {2:conversions Conversions} *)

  method as_string_object : Raw.String_object.t
end

class string_object : Raw.String_object.t -> string_object_t
(** Wraps a raw handle of {!Ocgtk.Raw.String_object.t}. *)

(** {1:description Description}

    The type of items in a [GtkStringList].

    A [GtkStringObject] is a wrapper around a [const char*]; it has a
    [Gtk.StringObject:string] property that can be used for property bindings
    and expressions. *)

(** {1:constructors Constructors} *)

val new_ : string -> string_object_t
(** Wraps a string in an object for use with [GListModel]. *)

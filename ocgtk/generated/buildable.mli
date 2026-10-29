(** Allows objects to extend and customize deserialization from ui files.

    Its methods, signals and properties are on {!class-type-buildable_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Buildable}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Buildable].}

    Allows objects to extend and customize deserialization from ui files.

    The [GtkBuildable] interface includes methods for setting names and
    properties of objects, parsing custom tags and constructing child objects.

    It is implemented by all widgets and many of the non-widget objects that are
    provided by GTK. The main user of this interface is
    {{!Ocgtk.Builder.class-type-builder_t}[Gtk.Builder]}. There should be very
    little need for applications to call any of these functions directly.

    An object only needs to implement this interface if it needs to extend the
    [GtkBuilder] XML format or run any extra routines at deserialization time.
*)
class type buildable_t = object
  (** {2:methods Methods} *)

  method get_buildable_id : unit -> string option
  (** Gets the ID of the [buildable] object.

      [GtkBuilder] sets the name based on the ID attribute of the [<object>] tag
      used to construct the [buildable]. *)

  (** {2:conversions Conversions} *)

  method as_buildable : Raw.Buildable.t
end

class buildable : Raw.Buildable.t -> buildable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Buildable.t}. *)

(** {1:description Description}

    Allows objects to extend and customize deserialization from ui files.

    The [GtkBuildable] interface includes methods for setting names and
    properties of objects, parsing custom tags and constructing child objects.

    It is implemented by all widgets and many of the non-widget objects that are
    provided by GTK. The main user of this interface is
    {{!Ocgtk.Builder.class-type-builder_t}[Gtk.Builder]}. There should be very
    little need for applications to call any of these functions directly.

    An object only needs to implement this interface if it needs to extend the
    [GtkBuilder] XML format or run any extra routines at deserialization time.
*)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)

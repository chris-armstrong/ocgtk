(** Allows objects to extend and customize deserialization from ui files.

    The [GtkBuildable] interface includes methods for setting names and
    properties of objects, parsing custom tags and constructing child objects.

    It is implemented by all widgets and many of the non-widget objects that are
    provided by GTK. The main user of this interface is [Gtk.Builder]. There
    should be very little need for applications to call any of these functions
    directly.

    An object only needs to implement this interface if it needs to extend the
    [GtkBuilder] XML format or run any extra routines at deserialization time.

    Its methods, signals and properties are on {!class-type-buildable_t}. The
    functions it is built on are in {!Ocgtk.Raw.Buildable}. *)

(** The methods, signals and properties of a [GtkBuildable]. *)
class type buildable_t = object
  method get_buildable_id : unit -> string option
  (** Gets the ID of the [buildable] object.

      [GtkBuilder] sets the name based on the ID attribute of the [<object>] tag
      used to construct the [buildable]. *)

  method as_buildable : Raw.Buildable.t
end

class buildable : Raw.Buildable.t -> buildable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Buildable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBuildable], give one already wrapped. *)

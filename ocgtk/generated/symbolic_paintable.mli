(** An interface that supports symbolic colors in paintables.

    [GdkPaintable]s implementing the interface will have the
    [Gtk.SymbolicPaintable.snapshot_symbolic] function called and have the
    colors for drawing symbolic icons passed. At least 4 colors are guaranteed
    to be passed every time.

    These 4 colors are the foreground color, and the colors to use for errors,
    warnings and success information in that order.

    More colors may be added in the future.

    Its methods, signals and properties are on
    {!class-type-symbolic_paintable_t}. The functions it is built on are in
    {!Ocgtk.Raw.Symbolic_paintable}. *)

(** The methods, signals and properties of a [GtkSymbolicPaintable]. *)
class type symbolic_paintable_t = object
  method snapshot_symbolic :
    Ocgdk.Snapshot.snapshot_t ->
    float ->
    float ->
    Ocgdk.Raw.Rgb_a.t array ->
    Gsize.t ->
    unit
  (** Snapshots the paintable with the given colors.

      If less than 4 colors are provided, GTK will pad the array with default
      colors. *)

  method as_symbolic_paintable : Raw.Symbolic_paintable.t
end

class symbolic_paintable : Raw.Symbolic_paintable.t -> symbolic_paintable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Symbolic_paintable.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkSymbolicPaintable], give one already wrapped. *)

(* GENERATED CODE - DO NOT EDIT *)
(* SymbolicPaintable: SymbolicPaintable *)

(** An interface that supports symbolic colors in paintables.

    [GdkPaintable]s implementing the interface will have the
    [Gtk.SymbolicPaintable.snapshot_symbolic] function called and have the
    colors for drawing symbolic icons passed. At least 4 colors are guaranteed
    to be passed every time.

    These 4 colors are the foreground color, and the colors to use for errors,
    warnings and success information in that order.

    More colors may be added in the future. *)

type t = [ `symbolic_paintable ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_symbolic_paintable_from_gobject"

(* Methods *)

external snapshot_symbolic :
  t ->
  Ocgtk_gdk.Gdk.Wrappers.Snapshot.t ->
  float ->
  float ->
  Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array ->
  Gsize.t ->
  unit
  = "ml_gtk_symbolic_paintable_snapshot_symbolic_bytecode"
    "ml_gtk_symbolic_paintable_snapshot_symbolic_native"
(** Snapshots the paintable with the given colors.

    If less than 4 colors are provided, GTK will pad the array with default
    colors. *)

(* GENERATED CODE - DO NOT EDIT *)
(* Native: Native *)

(** An interface for widgets that have their own [Gdk.Surface].

    The obvious example of a [GtkNative] is [GtkWindow].

    Every widget that is not itself a [GtkNative] is contained in one, and you
    can get it with [Gtk.Widget.get_native].

    To get the surface of a [GtkNative], use [Gtk.Native.get_surface]. It is
    also possible to find the [GtkNative] to which a surface belongs, with
    [Gtk.Native.get_for_surface].

    In addition to a [Gdk.Surface], a [GtkNative] also provides a [Gsk.Renderer]
    for rendering on that surface. To get the renderer, use
    [Gtk.Native.get_renderer]. *)

type t = [ `native ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_native_from_gobject"

(* Methods *)

external unrealize : t -> unit = "ml_gtk_native_unrealize"
(** Unrealizes a [GtkNative].

    This should only be used by subclasses. *)

external realize : t -> unit = "ml_gtk_native_realize"
(** Realizes a [GtkNative].

    This should only be used by subclasses. *)

external get_surface_transform : t -> float * float
  = "ml_gtk_native_get_surface_transform"
(** Retrieves the surface transform of [self].

    This is the translation from [self]'s surface coordinates into [self]'s
    widget coordinates. *)

external get_surface : t -> Ocgtk_gdk.Gdk.Wrappers.Surface.t option
  = "ml_gtk_native_get_surface"
(** Returns the surface of this [GtkNative]. *)

external get_renderer : t -> Ocgtk_gsk.Gsk.Wrappers.Renderer.t option
  = "ml_gtk_native_get_renderer"
(** Returns the renderer that is used for this [GtkNative]. *)

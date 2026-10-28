(** An interface for widgets that have their own [Gdk.Surface].

    Its methods, signals and properties are on {!class-type-native_t}. Its full
    description is under {!section-description}. The functions it is built on
    are in {!Ocgtk.Raw.Native}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Native].}

    Requires:
    - {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    An interface for widgets that have their own [Gdk.Surface].

    The obvious example of a [GtkNative] is [GtkWindow].

    Every widget that is not itself a [GtkNative] is contained in one, and you
    can get it with [Gtk.Widget.get_native].

    To get the surface of a [GtkNative], use [Gtk.Native.get_surface]. It is
    also possible to find the [GtkNative] to which a surface belongs, with
    [Gtk.Native.get_for_surface].

    In addition to a [Gdk.Surface], a [GtkNative] also provides a [Gsk.Renderer]
    for rendering on that surface. To get the renderer, use
    [Gtk.Native.get_renderer]. *)
class type native_t = object
  (** {2:methods Methods} *)

  method get_renderer : unit -> Ocgsk.Renderer.renderer_t option
  (** Returns the renderer that is used for this [GtkNative]. *)

  method get_surface : unit -> Ocgdk.Surface.surface_t option
  (** Returns the surface of this [GtkNative]. *)

  method realize : unit -> unit
  (** Realizes a [GtkNative].

      This should only be used by subclasses. *)

  method unrealize : unit -> unit
  (** Unrealizes a [GtkNative].

      This should only be used by subclasses. *)

  (** {2:conversions Conversions} *)

  method as_native : Raw.Native.t
end

class native : Raw.Native.t -> native_t
(** Wraps a raw handle of {!Ocgtk.Raw.Native.t}. *)

(** {1:description Description}

    An interface for widgets that have their own [Gdk.Surface].

    The obvious example of a [GtkNative] is [GtkWindow].

    Every widget that is not itself a [GtkNative] is contained in one, and you
    can get it with [Gtk.Widget.get_native].

    To get the surface of a [GtkNative], use [Gtk.Native.get_surface]. It is
    also possible to find the [GtkNative] to which a surface belongs, with
    [Gtk.Native.get_for_surface].

    In addition to a [Gdk.Surface], a [GtkNative] also provides a [Gsk.Renderer]
    for rendering on that surface. To get the renderer, use
    [Gtk.Native.get_renderer]. *)

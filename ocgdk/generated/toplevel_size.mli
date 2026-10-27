(** Contains information that is useful to compute the size of a toplevel.

    Its methods, signals and properties are on {!class-type-toplevel_size_t}.
    The functions it is built on are in {!Ocgdk.Raw.Toplevel_size}. *)

(** The methods, signals and properties of a [GdkToplevelSize]. *)
class type toplevel_size_t = object
  method set_min_size : int -> int -> unit
  (** Sets the minimum size of the toplevel.

      The minimum size corresponds to the limitations the toplevel can be shrunk
      to, without resulting in incorrect painting. A user of a [GdkToplevel]
      should calculate these given both the existing size, and the bounds
      retrieved from the [GdkToplevelSize] object.

      The minimum size should be within the bounds (see
      [Gdk.ToplevelSize.get_bounds]). *)

  method set_shadow_width : int -> int -> int -> int -> unit
  (** Sets the shadows size of the toplevel.

      The shadow width corresponds to the part of the computed surface size that
      would consist of the shadow margin surrounding the window, would there be
      any.

      Shadow width should only be set if [Gtk.Display.supports_shadow_width] is
      [TRUE]. *)

  method set_size : int -> int -> unit
  (** Sets the size the toplevel prefers to be resized to.

      The size should be within the bounds (see [Gdk.ToplevelSize.get_bounds]).
      The set size should be considered as a hint, and should not be assumed to
      be respected by the windowing system, or backend. *)

  method as_toplevel_size : Raw.Toplevel_size.t
end

class toplevel_size : Raw.Toplevel_size.t -> toplevel_size_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Toplevel_size.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkToplevelSize], give one already wrapped. *)

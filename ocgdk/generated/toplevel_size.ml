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

(* High-level class for ToplevelSize *)
class toplevel_size (obj : Raw.Toplevel_size.t) : toplevel_size_t =
  object (self)
    method set_min_size : int -> int -> unit =
      fun min_width min_height ->
        Raw.Toplevel_size.set_min_size obj min_width min_height

    method set_shadow_width : int -> int -> int -> int -> unit =
      fun left right top bottom ->
        Raw.Toplevel_size.set_shadow_width obj left right top bottom

    method set_size : int -> int -> unit =
      fun width height -> Raw.Toplevel_size.set_size obj width height

    method as_toplevel_size = obj
  end

(** An opaque object representing an iterator which points to a certain position
    in an animation.

    Its methods, signals and properties are on
    {!class-type-pixbuf_animation_iter_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_animation_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PixbufAnimationIter].}

    An opaque object representing an iterator which points to a certain position
    in an animation. *)
class type pixbuf_animation_iter_t = object
  (** {2:methods Methods} *)

  method get_delay_time : unit -> int
  (** Gets the number of milliseconds the current pixbuf should be displayed, or
      -1 if the current pixbuf should be displayed forever.

      The [g_timeout_add()] function conveniently takes a timeout in
      milliseconds, so you can use a timeout to schedule the next update.

      Note that some formats, like GIF, might clamp the timeout values in the
      image file to avoid updates that are just too quick. The minimum timeout
      for GIF images is currently 20 milliseconds. *)

  method get_pixbuf : unit -> Pixbuf.pixbuf_t
  (** Gets the current pixbuf which should be displayed.

      The pixbuf might not be the same size as the animation itself
      (gdk_pixbuf_animation_get_width(), gdk_pixbuf_animation_get_height()).

      This pixbuf should be displayed for
      gdk_pixbuf_animation_iter_get_delay_time() milliseconds.

      The caller of this function does not own a reference to the returned
      pixbuf; the returned pixbuf will become invalid when the iterator advances
      to the next frame, which may happen anytime you call
      gdk_pixbuf_animation_iter_advance().

      Copy the pixbuf to keep it (don't just add a reference), as it may get
      recycled as you advance the iterator. *)

  method on_currently_loading_frame : unit -> bool
  (** Used to determine how to respond to the area_updated signal on
      [GdkPixbufLoader] when loading an animation.

      The [::area_updated] signal is emitted for an area of the frame currently
      streaming in to the loader. So if you're on the currently loading frame,
      you will need to redraw the screen for the updated area. *)

  (** {2:conversions Conversions} *)

  method as_pixbuf_animation_iter : Raw.Pixbuf_animation_iter.t
end

class pixbuf_animation_iter :
  Raw.Pixbuf_animation_iter.t ->
  pixbuf_animation_iter_t
(** Wraps a raw handle of {!Ocgdkpixbuf.Raw.Pixbuf_animation_iter.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)

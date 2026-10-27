(** An opaque object representing an iterator which points to a certain position
    in an animation.

    Its methods, signals and properties are on
    {!class-type-pixbuf_animation_iter_t}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_animation_iter}. *)

(** The methods, signals and properties of a [GdkPixbufAnimationIter]. *)
class type pixbuf_animation_iter_t = object
  method get_delay_time : unit -> int
  method get_pixbuf : unit -> Pixbuf.pixbuf_t
  method on_currently_loading_frame : unit -> bool
  method as_pixbuf_animation_iter : Raw.Pixbuf_animation_iter.t
end

class pixbuf_animation_iter :
  Raw.Pixbuf_animation_iter.t ->
  pixbuf_animation_iter_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_animation_iter.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkPixbufAnimationIter], give one already wrapped. *)

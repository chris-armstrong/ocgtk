(** An opaque struct representing a simple animation.

    Its methods, signals and properties are on
    {!class-type-pixbuf_simple_anim_t}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim}. *)

(** The methods, signals and properties of a [GdkPixbufSimpleAnim]. *)
class type pixbuf_simple_anim_t = object
  inherit Pixbuf_animation.pixbuf_animation_t

  method add_frame : Pixbuf.pixbuf_t -> unit
  (** Adds a new frame to [animation]. The [pixbuf] must have the dimensions
      specified when the animation was constructed. *)

  method get_loop : unit -> bool
  (** Gets whether [animation] should loop indefinitely when it reaches the end.
  *)

  method set_loop : bool -> unit
  (** Sets whether [animation] should loop indefinitely when it reaches the end.
  *)

  method as_pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t
end

class pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t -> pixbuf_simple_anim_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkPixbufSimpleAnim], give one already wrapped. *)

val new_ : int -> int -> float -> pixbuf_simple_anim_t

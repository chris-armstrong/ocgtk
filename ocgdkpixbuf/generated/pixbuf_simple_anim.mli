(** An opaque struct representing a simple animation.

    Its methods, signals and properties are on
    {!class-type-pixbuf_simple_anim_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PixbufSimpleAnim].}

    Inherits from:
    {{!Ocgdkpixbuf.Pixbuf_animation.class-type-pixbuf_animation_t}Ocgdkpixbuf.Pixbuf_animation}

    An opaque struct representing a simple animation. *)
class type pixbuf_simple_anim_t = object
  inherit Pixbuf_animation.pixbuf_animation_t

  (** {2:methods Methods} *)

  method add_frame : Pixbuf.pixbuf_t -> unit
  (** Adds a new frame to [animation]. The [pixbuf] must have the dimensions
      specified when the animation was constructed. *)

  method get_loop : unit -> bool
  (** Gets whether [animation] should loop indefinitely when it reaches the end.
  *)

  method set_loop : bool -> unit
  (** Sets whether [animation] should loop indefinitely when it reaches the end.
  *)

  (** {2:conversions Conversions} *)

  method as_pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t
end

class pixbuf_simple_anim : Raw.Pixbuf_simple_anim.t -> pixbuf_simple_anim_t
(** Wraps a raw handle of {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim.t}. *)

(** {1:constructors Constructors} *)

val new_ : int -> int -> float -> pixbuf_simple_anim_t
(** Creates a new, empty animation. *)

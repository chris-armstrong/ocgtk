(* GENERATED CODE - DO NOT EDIT *)
(* PixbufSimpleAnim: PixbufSimpleAnim *)

type t = [`pixbuf_simple_anim | `pixbuf_animation | `object_] Gobject.obj

(** Create a new PixbufSimpleAnim *)
external new_ : int -> int -> float -> t = "ml_gdk_pixbuf_simple_anim_new"

(* Methods *)
(** Sets whether @animation should loop indefinitely when it reaches the end. *)
external set_loop : t -> bool -> unit = "ml_gdk_pixbuf_simple_anim_set_loop"

(** Gets whether @animation should loop indefinitely when it reaches the end. *)
external get_loop : t -> bool = "ml_gdk_pixbuf_simple_anim_get_loop"

(** Adds a new frame to @animation. The @pixbuf must
have the dimensions specified when the animation
was constructed. *)
external add_frame : t -> Pixbuf.t -> unit = "ml_gdk_pixbuf_simple_anim_add_frame"

(* Properties *)


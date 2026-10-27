(** Bindings for [GdkPixbufSimpleAnimIter].

    Its methods, signals and properties are on
    {!class-type-pixbuf_simple_anim_iter_t}. The functions it is built on are in
    {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim_iter}. *)

(** The methods, signals and properties of a [GdkPixbufSimpleAnimIter]. *)
class type pixbuf_simple_anim_iter_t = object
  inherit Pixbuf_animation_iter.pixbuf_animation_iter_t
  method as_pixbuf_simple_anim_iter : Raw.Pixbuf_simple_anim_iter.t
end

class pixbuf_simple_anim_iter :
  Raw.Pixbuf_simple_anim_iter.t ->
  pixbuf_simple_anim_iter_t
(** Wraps a layer 1 handle, {!Ocgdkpixbuf.Raw.Pixbuf_simple_anim_iter.t}. Apply
    it directly only to convert a handle obtained from layer 1: constructors,
    and methods that return a [GdkPixbufSimpleAnimIter], give one already
    wrapped. *)

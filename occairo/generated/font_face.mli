(** Bindings for [cairo_font_face_t].

    Its methods, signals and properties are on {!class-type-font_face_t}. The
    functions it is built on are in {!Occairo.Raw.Font_face}. *)

(** The methods, signals and properties of a [cairo_font_face_t]. *)
class type font_face_t = object
  method as_font_face : Raw.Font_face.t
end

class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Font_face.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_font_face_t], give one already wrapped. *)

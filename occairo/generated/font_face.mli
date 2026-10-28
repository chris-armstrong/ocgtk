(** Bindings for [FontFace].

    Its methods, signals and properties are on {!class-type-font_face_t}. The
    functions it is built on are in {!Occairo.Raw.Font_face}. *)

(** The methods, signals and properties of a [FontFace]. *)
class type font_face_t = object
  method as_font_face : Raw.Font_face.t
end

class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a raw handle of {!Occairo.Raw.Font_face.t}. *)

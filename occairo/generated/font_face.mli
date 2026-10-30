(** Bindings for [FontFace].

    Its methods, signals and properties are on {!class-type-font_face_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Occairo.Raw.Font_face}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontFace].} *)
class type font_face_t = object
  (** {2:conversions Conversions} *)

  method as_font_face : Raw.Font_face.t
end

class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a raw handle of {!Occairo.Raw.Font_face.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)

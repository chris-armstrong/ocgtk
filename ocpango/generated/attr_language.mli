(** The [PangoAttrLanguage] structure is used to represent attributes that are
    languages.

    Its methods, signals and properties are on {!class-type-attr_language_t}.
    The functions it is built on are in {!Ocpango.Raw.Attr_language}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrLanguage].}

    The [PangoAttrLanguage] structure is used to represent attributes that are
    languages. *)
class type attr_language_t = object
  method as_attr_language : Raw.Attr_language.t
end

class attr_language : Raw.Attr_language.t -> attr_language_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_language.t}. *)

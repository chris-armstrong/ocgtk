(** The [PangoAttrLanguage] structure is used to represent attributes that are
    languages.

    Its methods, signals and properties are on {!class-type-attr_language_t}.
    The functions it is built on are in {!Ocpango.Raw.Attr_language}. *)

(** The methods, signals and properties of a [PangoAttrLanguage]. *)
class type attr_language_t = object
  method as_attr_language : Raw.Attr_language.t
end

class attr_language : Raw.Attr_language.t -> attr_language_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_language.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoAttrLanguage], give one already wrapped. *)

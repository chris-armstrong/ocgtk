(** The [PangoLanguage] structure is used to represent a language.

    [PangoLanguage] pointers can be efficiently copied and compared with each
    other.

    Its methods, signals and properties are on {!class-type-language_t}. The
    functions it is built on are in {!Ocpango.Raw.Language}. *)

(** The methods, signals and properties of a [PangoLanguage]. *)
class type language_t = object
  method get_sample_string : unit -> string
  method includes_script : Enums.script -> bool
  method matches : string -> bool
  method to_string : unit -> string
  method as_language : Raw.Language.t
end

class language : Raw.Language.t -> language_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Language.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoLanguage], give one already wrapped. *)

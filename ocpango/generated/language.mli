(** The [PangoLanguage] structure is used to represent a language.

    [PangoLanguage] pointers can be efficiently copied and compared with each
    other.

    Its methods, signals and properties are on {!class-type-language_t}. The
    functions it is built on are in {!Ocpango.Raw.Language}. *)

(** {b The methods, signals and properties of a [Language].}

    The [PangoLanguage] structure is used to represent a language.

    [PangoLanguage] pointers can be efficiently copied and compared with each
    other. *)
class type language_t = object
  method get_sample_string : unit -> string
  [@@ocaml.doc
    "Get a string that is representative of the characters needed to\n\
     render a particular language.\n\n\
     The sample text may be a pangram, but is not necessarily. It is chosen\n\
     to be demonstrative of normal text in the language, as well as exposing\n\
     font feature requirements unique to the language. It is suitable for use\n\
     as sample text in a font selection dialog.\n\n\
     If [language] is [NULL], the default language as found by\n\
     [Pango.Language.get_default] is used.\n\n\
     If Pango does not have a sample string for [language], the classic\n\
     \"The quick brown fox...\" is returned.  This can be detected by\n\
     comparing the returned pointer value to that returned for (non-existent)\n\
     language code \"xx\".  That is, compare to:\n\n\
     {[\n\
     pango_language_get_sample_string (pango_language_from_string (\"xx\"))\n\
     ]}"]

  method includes_script : Enums.script -> bool
  (** Determines if [script] is one of the scripts used to write [language].

      The returned value is conservative; if nothing is known about the language
      tag [language], [TRUE] will be returned, since, as far as Pango knows,
      [script] might be used to write [language].

      This routine is used in Pango's itemization process when determining if a
      supplied language tag is relevant to a particular section of text. It
      probably is not useful for applications in most circumstances.

      This function uses [Pango.Language.get_scripts] internally. *)

  method matches : string -> bool
  (** Checks if a language tag matches one of the elements in a list of language
      ranges.

      A language tag is considered to match a range in the list if the range is
      '*', the range is exactly the tag, or the range is a prefix of the tag,
      and the character after it in the tag is '-'. *)

  method to_string : unit -> string
  (** Gets the RFC-3066 format string representing the given language tag.

      Returns (transfer none): a string representing the language tag *)

  method as_language : Raw.Language.t
end

class language : Raw.Language.t -> language_t
(** Wraps a raw handle of {!Ocpango.Raw.Language.t}. *)

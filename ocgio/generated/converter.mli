(** [GConverter] is an interface for streaming conversions.

    [GConverter] is implemented by objects that convert binary data in various
    ways. The conversion can be stateful and may fail at any place.

    Some example conversions are: character set conversion, compression,
    decompression and regular expression replace.

    Its methods, signals and properties are on {!class-type-converter_t}. The
    functions it is built on are in {!Ocgio.Raw.Converter}. *)

(** {b The methods, signals and properties of a [Converter].}

    [GConverter] is an interface for streaming conversions.

    [GConverter] is implemented by objects that convert binary data in various
    ways. The conversion can be stateful and may fail at any place.

    Some example conversions are: character set conversion, compression,
    decompression and regular expression replace. *)
class type converter_t = object
  method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result
  (** Applies [converter] to the data in [bytes]. *)

  method reset : unit -> unit
  (** Resets all internal state in the converter, making it behave as if it was
      just created. If the converter has any internal state that would produce
      output then that output is lost. *)

  method as_converter : Raw.Converter.t
end

class converter : Raw.Converter.t -> converter_t
(** Wraps a raw handle of {!Ocgio.Raw.Converter.t}. *)

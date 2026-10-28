(** [GCharsetConverter] is an implementation of [Gio.Converter] based on
    [GLib.IConv].

    Its methods, signals and properties are on
    {!class-type-charset_converter_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Charset_converter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CharsetConverter].}

    [GCharsetConverter] is an implementation of [Gio.Converter] based on
    [GLib.IConv]. *)
class type charset_converter_t = object
  inherit Converter.converter_t
  inherit Initable.initable_t

  method get_num_fallbacks : unit -> int
  (** Gets the number of fallbacks that [converter] has applied so far. *)

  method get_use_fallback : unit -> bool
  (** Gets the [GCharsetConverter:use]-fallback property. *)

  method set_use_fallback : bool -> unit
  (** Sets the [GCharsetConverter:use]-fallback property. *)

  method from_charset : string
  (** The character encoding to convert from. *)

  method to_charset : string
  (** The character encoding to convert to. *)

  method as_charset_converter : Raw.Charset_converter.t
end

class charset_converter : Raw.Charset_converter.t -> charset_converter_t
(** Wraps a raw handle of {!Ocgio.Raw.Charset_converter.t}. *)

(** {1:constructors Constructors} *)

val new_ : string -> string -> (charset_converter_t, GError.t) result
(** Creates a new [GCharsetConverter]. *)

(** [GCharsetConverter] is an implementation of [Gio.Converter] based on
    [GLib.IConv].

    Its methods, signals and properties are on
    {!class-type-charset_converter_t}. The functions it is built on are in
    {!Ocgio.Raw.Charset_converter}. *)

(** The methods, signals and properties of a [GCharsetConverter]. *)
class type charset_converter_t = object
  inherit Converter.converter_t
  inherit Initable.initable_t
  method get_num_fallbacks : unit -> int
  method get_use_fallback : unit -> bool
  method set_use_fallback : bool -> unit
  method from_charset : string
  method to_charset : string
  method as_charset_converter : Raw.Charset_converter.t
end

class charset_converter : Raw.Charset_converter.t -> charset_converter_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Charset_converter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GCharsetConverter], give one already wrapped. *)

val new_ : string -> string -> (charset_converter_t, GError.t) result

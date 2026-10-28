class type converter_t = object
  method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result
  (** Applies [converter] to the data in [bytes]. *)

  method reset : unit -> unit
  (** Resets all internal state in the converter, making it behave as if it was
      just created. If the converter has any internal state that would produce
      output then that output is lost. *)

  method as_converter : Raw.Converter.t
end

(* High-level class for Converter *)
class converter (obj : Raw.Converter.t) : converter_t =
  object (self)
    method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result =
      fun bytes -> Raw.Converter.convert_bytes obj bytes

    method reset : unit -> unit = fun () -> Raw.Converter.reset obj
    method as_converter = obj
  end

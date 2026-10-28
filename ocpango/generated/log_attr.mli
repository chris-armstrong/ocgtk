(** The [PangoLogAttr] structure stores information about the attributes of a
    single character.

    Its methods, signals and properties are on {!class-type-log_attr_t}. The
    functions it is built on are in {!Ocpango.Raw.Log_attr}. *)

(** The methods, signals and properties of a [LogAttr]. *)
class type log_attr_t = object
  method as_log_attr : Raw.Log_attr.t
end

class log_attr : Raw.Log_attr.t -> log_attr_t
(** Wraps a raw handle of {!Ocpango.Raw.Log_attr.t}. *)

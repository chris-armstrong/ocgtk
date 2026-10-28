(** The [PangoLogAttr] structure stores information about the attributes of a
    single character.

    Its methods, signals and properties are on {!class-type-log_attr_t}. The
    functions it is built on are in {!Ocpango.Raw.Log_attr}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LogAttr].}

    The [PangoLogAttr] structure stores information about the attributes of a
    single character. *)
class type log_attr_t = object
  (** {2:conversions Conversions} *)

  method as_log_attr : Raw.Log_attr.t
end

class log_attr : Raw.Log_attr.t -> log_attr_t
(** Wraps a raw handle of {!Ocpango.Raw.Log_attr.t}. *)

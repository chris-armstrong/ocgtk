(** A location in a parse buffer.

    Its methods, signals and properties are on {!class-type-parse_location_t}.
    The functions it is built on are in {!Ocgsk.Raw.Parse_location}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ParseLocation].}

    A location in a parse buffer. *)
class type parse_location_t = object
  method as_parse_location : Raw.Parse_location.t
end

class parse_location : Raw.Parse_location.t -> parse_location_t
(** Wraps a raw handle of {!Ocgsk.Raw.Parse_location.t}. *)

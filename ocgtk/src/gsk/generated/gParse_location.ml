class type parse_location_t = object
  method get_bytes : Gsize.t
  method set_bytes : Gsize.t -> unit
  method get_chars : Gsize.t
  method set_chars : Gsize.t -> unit
  method get_lines : Gsize.t
  method set_lines : Gsize.t -> unit
  method get_line_bytes : Gsize.t
  method set_line_bytes : Gsize.t -> unit
  method get_line_chars : Gsize.t
  method set_line_chars : Gsize.t -> unit
  method as_parse_location : Parse_location.t
end

(* High-level class for ParseLocation *)
class parse_location (obj : Parse_location.t) : parse_location_t =
  object (self)
    method get_bytes : Gsize.t = Parse_location.get_bytes obj
    method set_bytes : Gsize.t -> unit = fun v -> Parse_location.set_bytes obj v
    method get_chars : Gsize.t = Parse_location.get_chars obj
    method set_chars : Gsize.t -> unit = fun v -> Parse_location.set_chars obj v
    method get_lines : Gsize.t = Parse_location.get_lines obj
    method set_lines : Gsize.t -> unit = fun v -> Parse_location.set_lines obj v
    method get_line_bytes : Gsize.t = Parse_location.get_line_bytes obj

    method set_line_bytes : Gsize.t -> unit =
      fun v -> Parse_location.set_line_bytes obj v

    method get_line_chars : Gsize.t = Parse_location.get_line_chars obj

    method set_line_chars : Gsize.t -> unit =
      fun v -> Parse_location.set_line_chars obj v

    method as_parse_location = obj
  end

let make (bytes : Gsize.t) (chars : Gsize.t) (lines : Gsize.t)
    (line_bytes : Gsize.t) (line_chars : Gsize.t) : parse_location_t =
  new parse_location
    (Parse_location.make bytes chars lines line_bytes line_chars)

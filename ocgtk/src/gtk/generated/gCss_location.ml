class type css_location_t = object
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
  method as_css_location : Css_location.t
end

(* High-level class for CssLocation *)
class css_location (obj : Css_location.t) : css_location_t =
  object (self)
    method get_bytes : Gsize.t = Css_location.get_bytes obj
    method set_bytes : Gsize.t -> unit = fun v -> Css_location.set_bytes obj v
    method get_chars : Gsize.t = Css_location.get_chars obj
    method set_chars : Gsize.t -> unit = fun v -> Css_location.set_chars obj v
    method get_lines : Gsize.t = Css_location.get_lines obj
    method set_lines : Gsize.t -> unit = fun v -> Css_location.set_lines obj v
    method get_line_bytes : Gsize.t = Css_location.get_line_bytes obj

    method set_line_bytes : Gsize.t -> unit =
      fun v -> Css_location.set_line_bytes obj v

    method get_line_chars : Gsize.t = Css_location.get_line_chars obj

    method set_line_chars : Gsize.t -> unit =
      fun v -> Css_location.set_line_chars obj v

    method as_css_location = obj
  end

let make (bytes : Gsize.t) (chars : Gsize.t) (lines : Gsize.t)
    (line_bytes : Gsize.t) (line_chars : Gsize.t) : css_location_t =
  new css_location (Css_location.make bytes chars lines line_bytes line_chars)

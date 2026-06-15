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

class css_location : Css_location.t -> css_location_t

val make : Gsize.t -> Gsize.t -> Gsize.t -> Gsize.t -> Gsize.t -> css_location_t

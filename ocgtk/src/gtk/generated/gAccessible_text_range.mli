class type accessible_text_range_t = object
  method get_start : Gsize.t
  method set_start : Gsize.t -> unit
  method get_length : Gsize.t
  method set_length : Gsize.t -> unit
  method as_accessible_text_range : Accessible_text_range.t
end

class accessible_text_range : Accessible_text_range.t -> accessible_text_range_t

val make : Gsize.t -> Gsize.t -> accessible_text_range_t

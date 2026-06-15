class type page_range_t = object
  method get_start : int
  method set_start : int -> unit
  method get_end : int
  method set_end : int -> unit
  method as_page_range : Page_range.t
end

class page_range : Page_range.t -> page_range_t

val make : int -> int -> page_range_t

class type page_range_t = object
  method get_start : int
  method set_start : int -> unit
  method get_end : int
  method set_end : int -> unit
  method as_page_range : Page_range.t
end

(* High-level class for PageRange *)
class page_range (obj : Page_range.t) : page_range_t =
  object (self)
    method get_start : int = Page_range.get_start obj
    method set_start : int -> unit = fun v -> Page_range.set_start obj v
    method get_end : int = Page_range.get_end obj
    method set_end : int -> unit = fun v -> Page_range.set_end obj v
    method as_page_range = obj
  end

let make (start : int) (end_ : int) : page_range_t =
  new page_range (Page_range.make start end_)

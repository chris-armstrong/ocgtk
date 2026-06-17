class type page_range_t = object
  method as_page_range : Page_range.t
end

(* High-level class for PageRange *)
class page_range (obj : Page_range.t) : page_range_t =
  object (self)
    method as_page_range = obj
  end

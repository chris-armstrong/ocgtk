class type page_range_t = object
    method as_page_range : Page_range.t
end

class page_range : Page_range.t -> page_range_t


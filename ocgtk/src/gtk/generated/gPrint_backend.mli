class type print_backend_t = object
    method as_print_backend : Print_backend.t
end

class print_backend : Print_backend.t -> print_backend_t


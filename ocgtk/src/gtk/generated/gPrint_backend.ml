class type print_backend_t = object
    method as_print_backend : Print_backend.t
end

(* High-level class for PrintBackend *)
class print_backend (obj : Print_backend.t) : print_backend_t = object (self)

    method as_print_backend = obj
end


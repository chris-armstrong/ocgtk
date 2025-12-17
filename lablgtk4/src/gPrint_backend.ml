(* High-level class for PrintBackend *)
class print_backend (obj : Print_backend.t) = object (self)

    method as_print_backend = obj
end


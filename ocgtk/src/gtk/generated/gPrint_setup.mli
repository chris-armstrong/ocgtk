class type print_setup_t = object
    method ref : unit -> Print_setup.t
    method unref : unit -> unit
    method as_print_setup : Print_setup.t
end

class print_setup : Print_setup.t -> print_setup_t


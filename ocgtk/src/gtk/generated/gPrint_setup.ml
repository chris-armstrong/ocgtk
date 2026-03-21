class type print_setup_t = object
    method ref : unit -> Print_setup.t
    method unref : unit -> unit
    method as_print_setup : Print_setup.t
end

(* High-level class for PrintSetup *)
class print_setup (obj : Print_setup.t) : print_setup_t = object (self)

  method ref : unit -> Print_setup.t =
    fun () ->
      (Print_setup.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Print_setup.unref obj)

    method as_print_setup = obj
end


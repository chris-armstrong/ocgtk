(* High-level class for PrintSetup *)
class print_setup (obj : Print_setup.t) = object (self)

  method ref : unit -> Print_setup.t = fun () -> (Print_setup.ref obj )

  method unref : unit -> unit = fun () -> (Print_setup.unref obj )

    method as_print_setup = obj
end


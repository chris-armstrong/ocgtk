(* High-level class for TestDBus *)
class test_d_bus (obj : Test_d_bus.t) = object (self)

  method add_service_dir : string -> unit =
    fun path ->
      (Test_d_bus.add_service_dir obj path)

  method down : unit -> unit =
    fun () ->
      (Test_d_bus.down obj)

  method get_bus_address : unit -> string option =
    fun () ->
      (Test_d_bus.get_bus_address obj)

  method stop : unit -> unit =
    fun () ->
      (Test_d_bus.stop obj)

  method up : unit -> unit =
    fun () ->
      (Test_d_bus.up obj)

    method as_test_d_bus = obj
end


class type test_d_bus_t = object
    method add_service_dir : string -> unit
    method down : unit -> unit
    method get_bus_address : unit -> string option
    method get_flags : unit -> Gio_enums.testdbusflags
    method stop : unit -> unit
    method up : unit -> unit
    method as_test_d_bus : Test_d_bus.t
end

(* High-level class for TestDBus *)
class test_d_bus (obj : Test_d_bus.t) : test_d_bus_t = object (self)

  method add_service_dir : string -> unit =
    fun path ->
      (Test_d_bus.add_service_dir obj path)

  method down : unit -> unit =
    fun () ->
      (Test_d_bus.down obj)

  method get_bus_address : unit -> string option =
    fun () ->
      (Test_d_bus.get_bus_address obj)

  method get_flags : unit -> Gio_enums.testdbusflags =
    fun () ->
      (Test_d_bus.get_flags obj)

  method stop : unit -> unit =
    fun () ->
      (Test_d_bus.stop obj)

  method up : unit -> unit =
    fun () ->
      (Test_d_bus.up obj)

    method as_test_d_bus = obj
end


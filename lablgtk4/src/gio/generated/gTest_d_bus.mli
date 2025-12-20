class test_d_bus : Test_d_bus.t ->
  object
    method add_service_dir : string -> unit
    method down : unit -> unit
    method get_bus_address : unit -> string option
    method stop : unit -> unit
    method up : unit -> unit
    method as_test_d_bus : Test_d_bus.t
  end


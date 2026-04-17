class type test_d_bus_t = object
    method add_service_dir : string -> unit
    method down : unit -> unit
    method get_bus_address : unit -> string option
    method get_flags : unit -> Gio_enums.testdbusflags
    method stop : unit -> unit
    method up : unit -> unit
    method as_test_d_bus : Test_d_bus.t
end

class test_d_bus : Test_d_bus.t -> test_d_bus_t

val new_ : Gio_enums.testdbusflags -> test_d_bus_t

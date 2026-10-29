class type test_d_bus_t = object
  (** {2:methods Methods} *)

  method add_service_dir : string -> unit
  (** Add a path where dbus-daemon will look up .service files. This can't be
      called after g_test_dbus_up(). *)

  method down : unit -> unit
  (** Stop the session bus started by g_test_dbus_up().

      This will wait for the singleton returned by g_bus_get() or
      g_bus_get_sync() to be destroyed. This is done to ensure that the next
      unit test won't get a leaked singleton from this test. *)

  method get_bus_address : unit -> string option
  (** Get the address on which dbus-daemon is running. If g_test_dbus_up() has
      not been called yet, [NULL] is returned. This can be used with
      g_dbus_connection_new_for_address(). *)

  method get_flags : unit -> Enums.testdbusflags
  (** Get the flags of the [GTestDBus] object. *)

  method stop : unit -> unit
  (** Stop the session bus started by g_test_dbus_up().

      Unlike g_test_dbus_down(), this won't verify the [GDBusConnection]
      singleton returned by g_bus_get() or g_bus_get_sync() is destroyed. Unit
      tests wanting to verify behaviour after the session bus has been stopped
      can use this function but should still call g_test_dbus_down() when done.
  *)

  method up : unit -> unit
  (** Start a dbus-daemon instance and set DBUS_SESSION_BUS_ADDRESS. After this
      call, it is safe for unit tests to start sending messages on the session
      bus.

      If this function is called from setup callback of g_test_add(),
      g_test_dbus_down() must be called in its teardown callback.

      If this function is called from unit test's main(), then
      g_test_dbus_down() must be called after g_test_run(). *)

  (** {2:conversions Conversions} *)

  method as_test_d_bus : Raw.Test_d_bus.t
end

(* High-level class for TestDBus *)
class test_d_bus (obj : Raw.Test_d_bus.t) : test_d_bus_t =
  object (self)
    method add_service_dir : string -> unit =
      fun path -> Raw.Test_d_bus.add_service_dir obj path

    method down : unit -> unit = fun () -> Raw.Test_d_bus.down obj

    method get_bus_address : unit -> string option =
      fun () -> Raw.Test_d_bus.get_bus_address obj

    method get_flags : unit -> Enums.testdbusflags =
      fun () -> Raw.Test_d_bus.get_flags obj

    method stop : unit -> unit = fun () -> Raw.Test_d_bus.stop obj
    method up : unit -> unit = fun () -> Raw.Test_d_bus.up obj
    method as_test_d_bus = obj
  end

let new_ (flags : Enums.testdbusflags) : test_d_bus_t =
  let obj_ = Raw.Test_d_bus.new_ flags in
  new test_d_bus obj_

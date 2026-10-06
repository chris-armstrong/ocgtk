(* GENERATED CODE - DO NOT EDIT *)
(* TestDBus: TestDBus *)

[@@@ocaml.text
"A helper class for testing code which uses D-Bus without touching the user’s\n\
 session bus.\n\n\
 Note that [GTestDBus] modifies the user’s environment, calling\n\
 [setenv()]). This is not thread-safe, so all [GTestDBus]\n\
 calls should be completed before threads are spawned, or should have\n\
 appropriate locking to ensure no access conflicts to environment variables\n\
 shared between [GTestDBus] and other threads.\n\n\
 {b Creating unit tests using [GTestDBus]}\n\n\
 Testing of D-Bus services can be tricky because normally we only ever run\n\
 D-Bus services over an existing instance of the D-Bus daemon thus we\n\
 usually don’t activate D-Bus services that are not yet installed into the\n\
 target system. The [GTestDBus] object makes this easier for us by taking care\n\
 of the lower level tasks such as running a private D-Bus daemon and looking\n\
 up uninstalled services in customizable locations, typically in your source\n\
 code tree.\n\n\
 The first thing you will need is a separate service description file for the\n\
 D-Bus daemon. Typically a [services] subdirectory of your [tests] directory\n\
 is a good place to put this file.\n\n\
 The service file should list your service along with an absolute path to the\n\
 uninstalled service executable in your source tree. Using autotools we would\n\
 achieve this by adding a file such as [my-server.service.in] in the services\n\
 directory and have it processed by configure.\n\n\
 {[\n\
 [D-BUS Service]\n\
 Name=org.gtk.GDBus.Examples.ObjectManager\n\
 Exec=@abs_top_builddir@/gio/tests/gdbus-example-objectmanager-server\n\
 ]}\n\n\
 You will also need to indicate this service directory in your test\n\
 fixtures, so you will need to pass the path while compiling your\n\
 test cases. Typically this is done with autotools with an added\n\
 preprocessor flag specified to compile your tests such as:\n\n\
 {[\n\
 -DTEST_SERVICES=\\\"\"$(abs_top_builddir)/tests/services\"\\\"\n\
 ]}\n\n\
 Once you have a service definition file which is local to your source tree,\n\
 you can proceed to set up a GTest fixture using the [GTestDBus] scaffolding.\n\n\
 An example of a test fixture for D-Bus services can be found\n\
 here:\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-test-fixture.c}gdbus-test-fixture.c}\n\n\
 Note that these examples only deal with isolating the D-Bus aspect of your\n\
 service. To successfully run isolated unit tests on your service you may need\n\
 some additional modifications to your test case fixture. For example; if your\n\
 service uses [Gio.Settings] and installs a schema then it is important\n\
 that your test service not load the schema in the ordinary installed location\n\
 (chances are that your service and schema files are not yet installed, or\n\
 worse; there is an older version of the schema file sitting in the install\n\
 location).\n\n\
 Most of the time we can work around these obstacles using the\n\
 environment. Since the environment is inherited by the D-Bus daemon\n\
 created by [GTestDBus] and then in turn inherited by any services the\n\
 D-Bus daemon activates, using the setup routine for your fixture is\n\
 a practical place to help sandbox your runtime environment. For the\n\
 rather typical GSettings case we can work around this by setting\n\
 [GSETTINGS_SCHEMA_DIR] to the in tree directory holding your schemas\n\
 in the above [fixture_setup()] routine.\n\n\
 The GSettings schemas need to be locally pre-compiled for this to work. This\n\
 can be achieved by compiling the schemas locally as a step before running\n\
 test cases, an autotools setup might do the following in the directory\n\
 holding schemas:\n\n\
 {[\n\
\    all-am:\n\
\            $(GLIB_COMPILE_SCHEMAS) .\n\n\
\    CLEANFILES += gschemas.compiled\n\
 ]}"]

type t = [ `test_d_bus | `object_ ] Gobject.obj

external new_ : Gio_enums.testdbusflags -> t = "ml_g_test_dbus_new"
(** Create a new TestDBus *)

(* Methods *)

external up : t -> unit = "ml_g_test_dbus_up"
(** Start a dbus-daemon instance and set DBUS_SESSION_BUS_ADDRESS. After this
    call, it is safe for unit tests to start sending messages on the session
    bus.

    If this function is called from setup callback of g_test_add(),
    g_test_dbus_down() must be called in its teardown callback.

    If this function is called from unit test's main(), then g_test_dbus_down()
    must be called after g_test_run(). *)

external stop : t -> unit = "ml_g_test_dbus_stop"
(** Stop the session bus started by g_test_dbus_up().

    Unlike g_test_dbus_down(), this won't verify the [GDBusConnection] singleton
    returned by g_bus_get() or g_bus_get_sync() is destroyed. Unit tests wanting
    to verify behaviour after the session bus has been stopped can use this
    function but should still call g_test_dbus_down() when done. *)

external get_flags : t -> Gio_enums.testdbusflags = "ml_g_test_dbus_get_flags"
(** Get the flags of the [GTestDBus] object. *)

external get_bus_address : t -> string option = "ml_g_test_dbus_get_bus_address"
(** Get the address on which dbus-daemon is running. If g_test_dbus_up() has not
    been called yet, [NULL] is returned. This can be used with
    g_dbus_connection_new_for_address(). *)

external down : t -> unit = "ml_g_test_dbus_down"
(** Stop the session bus started by g_test_dbus_up().

    This will wait for the singleton returned by g_bus_get() or g_bus_get_sync()
    to be destroyed. This is done to ensure that the next unit test won't get a
    leaked singleton from this test. *)

external add_service_dir : t -> string -> unit
  = "ml_g_test_dbus_add_service_dir"
(** Add a path where dbus-daemon will look up .service files. This can't be
    called after g_test_dbus_up(). *)

(* Properties *)

(** [GIOExtensionPoint] provides a mechanism for modules to extend the
    functionality of the library or application that loaded it in an organized
    fashion.

    Its methods, signals and properties are on
    {!class-type-io_extension_point_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Io_extension_point}. *)

(** {1:class Class} *)

class type io_extension_point_t = object
  (** {2:methods Methods} *)

  method get_extension_by_name : string -> Raw.Io_extension.t
  (** Finds a [GIOExtension] for an extension point by name. *)

  method get_extensions : unit -> Raw.Io_extension.t list
  (** Gets a list of all extensions that implement this extension point. The
      list is sorted by priority, beginning with the highest priority. *)

  method get_required_type : unit -> Gobject.Type.t
  (** Gets the required type for [extension_point]. *)

  method set_required_type : Gobject.Type.t -> unit
  (** Sets the required type for [extension_point] to [type]. All
      implementations must henceforth have this type. *)

  (** {2:conversions Conversions} *)

  method as_io_extension_point : Raw.Io_extension_point.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [IOExtensionPoint].}\n\n\
     [GIOExtensionPoint] provides a mechanism for modules to extend the\n\
     functionality of the library or application that loaded it in an\n\
     organized fashion.\n\n\
     An extension point is identified by a name, and it may optionally\n\
     require that any implementation must be of a certain type (or derived\n\
     thereof). Use [Gio.IOExtensionPoint.register] to register an\n\
     extension point, and \
     {{!Ocgio.Io_extension_point.class-type-io_extension_point_t.method-set_required_type}[Gio.IOExtensionPoint.set_required_type]} \
     to\n\
     set a required type.\n\n\
     A module can implement an extension point by specifying the\n\
     [GObject.Type] that implements the functionality. Additionally, each\n\
     implementation of an extension point has a name, and a priority. Use\n\
     [Gio.IOExtensionPoint.implement] to implement an extension point.\n\n\
     {[\n\
     GIOExtensionPoint *ep;\n\n\
     // Register an extension point\n\
     ep = g_io_extension_point_register (\"my-extension-point\");\n\
     g_io_extension_point_set_required_type (ep, MY_TYPE_EXAMPLE);\n\
     ]}\n\n\
     {[\n\
     // Implement an extension point\n\
     G_DEFINE_TYPE (MyExampleImpl, my_example_impl, MY_TYPE_EXAMPLE)\n\
     g_io_extension_point_implement (\"my-extension-point\",\n\
    \                                my_example_impl_get_type (),\n\
    \                                \"my-example\",\n\
    \                                10);\n\
     ]}\n\n\
     It is up to the code that registered the extension point how\n\
     it uses the implementations that have been associated with it.\n\
     Depending on the use case, it may use all implementations, or\n\
     only the one with the highest priority, or pick a specific\n\
     one by name.\n\n\
     To avoid opening all modules just to find out what extension\n\
     points they implement, GIO makes use of a caching mechanism,\n\
     see gio-querymodules.\n\
     You are expected to run this command after installing a\n\
     GIO module.\n\n\
     The [GIO_EXTRA_MODULES] environment variable can be used to\n\
     specify additional directories to automatically load modules\n\
     from. This environment variable has the same syntax as the\n\
     [PATH]. If two modules have the same base name in different\n\
     directories, then the latter one will be ignored. If additional\n\
     directories are specified GIO will load modules from the built-in\n\
     directory last."]

class io_extension_point : Raw.Io_extension_point.t -> io_extension_point_t
(** Wraps a raw handle of {!Ocgio.Raw.Io_extension_point.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 [GIOExtensionPoint] provides a mechanism for modules to extend the\n\
 functionality of the library or application that loaded it in an\n\
 organized fashion.\n\n\
 An extension point is identified by a name, and it may optionally\n\
 require that any implementation must be of a certain type (or derived\n\
 thereof). Use [Gio.IOExtensionPoint.register] to register an\n\
 extension point, and \
 {{!Ocgio.Io_extension_point.class-type-io_extension_point_t.method-set_required_type}[Gio.IOExtensionPoint.set_required_type]} \
 to\n\
 set a required type.\n\n\
 A module can implement an extension point by specifying the\n\
 [GObject.Type] that implements the functionality. Additionally, each\n\
 implementation of an extension point has a name, and a priority. Use\n\
 [Gio.IOExtensionPoint.implement] to implement an extension point.\n\n\
 {[\n\
 GIOExtensionPoint *ep;\n\n\
 // Register an extension point\n\
 ep = g_io_extension_point_register (\"my-extension-point\");\n\
 g_io_extension_point_set_required_type (ep, MY_TYPE_EXAMPLE);\n\
 ]}\n\n\
 {[\n\
 // Implement an extension point\n\
 G_DEFINE_TYPE (MyExampleImpl, my_example_impl, MY_TYPE_EXAMPLE)\n\
 g_io_extension_point_implement (\"my-extension-point\",\n\
\                                my_example_impl_get_type (),\n\
\                                \"my-example\",\n\
\                                10);\n\
 ]}\n\n\
 It is up to the code that registered the extension point how\n\
 it uses the implementations that have been associated with it.\n\
 Depending on the use case, it may use all implementations, or\n\
 only the one with the highest priority, or pick a specific\n\
 one by name.\n\n\
 To avoid opening all modules just to find out what extension\n\
 points they implement, GIO makes use of a caching mechanism,\n\
 see gio-querymodules.\n\
 You are expected to run this command after installing a\n\
 GIO module.\n\n\
 The [GIO_EXTRA_MODULES] environment variable can be used to\n\
 specify additional directories to automatically load modules\n\
 from. This environment variable has the same syntax as the\n\
 [PATH]. If two modules have the same base name in different\n\
 directories, then the latter one will be ignored. If additional\n\
 directories are specified GIO will load modules from the built-in\n\
 directory last."]

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)

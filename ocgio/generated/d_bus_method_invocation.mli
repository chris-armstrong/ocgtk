(** Instances of the [GDBusMethodInvocation] class are used when handling D-Bus
    method calls. It provides a way to asynchronously return results and errors.

    Its methods, signals and properties are on
    {!class-type-d_bus_method_invocation_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_method_invocation}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusMethodInvocation].}

    Instances of the [GDBusMethodInvocation] class are used when handling D-Bus
    method calls. It provides a way to asynchronously return results and errors.

    The normal way to obtain a [GDBusMethodInvocation] object is to receive it
    as an argument to the [handle_method_call()] function in a
    {{!Ocgio.D_bus_interface_v_table.class-type-d_bus_interface_v_table_t}[Gio.DBusInterfaceVTable]}
    that was passed to [Gio.DBusConnection.register_object]. *)
class type d_bus_method_invocation_t = object
  (** {2:methods Methods} *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the [GDBusConnection] the method was invoked on. *)

  method get_interface_name : unit -> string option
  [@@ocaml.doc
    "Gets the name of the D-Bus interface the method was invoked on.\n\n\
     This can be [None] if it was not specified by the sender. See\n\
     [Gio.DBusInterfaceMethodCallFunc] or the\n\
     {{:https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-types-method}D-Bus \
     Specification}\n\
     for details on when this can happen and how it should be handled.\n\n\
     If this method call is a property Get, Set or GetAll call that has\n\
     been redirected to the method call handler then\n\
     \"org.freedesktop.DBus.Properties\" will be returned.  See\n\
     [GDBusInterfaceVTable] for more information."]

  method get_message : unit -> D_bus_message.d_bus_message_t
  (** Gets the [GDBusMessage] for the method invocation. This is useful if you
      need to use low-level protocol features, such as UNIX file descriptor
      passing, that cannot be properly expressed in the [GVariant] API.

      See this \[server\][Gio.DBusConnection] and \[client\][Gio.DBusConnection]
      for an example of how to use this low-level API to send and receive UNIX
      file descriptors. *)

  method get_method_info : unit -> Raw.D_bus_method_info.t option
  (** Gets information about the method call, if any.

      If this method invocation is a property Get, Set or GetAll call that has
      been redirected to the method call handler then [None] will be returned.
      See g_dbus_method_invocation_get_property_info() and
      [GDBusInterfaceVTable] for more information. *)

  method get_method_name : unit -> string
  (** Gets the name of the method that was invoked. *)

  method get_object_path : unit -> string
  (** Gets the object path the method was invoked on. *)

  method get_parameters : unit -> Gvariant.t
  (** Gets the parameters of the method invocation. If there are no input
      parameters then this will return a GVariant with 0 children rather than
      NULL. *)

  method get_property_info : unit -> Raw.D_bus_property_info.t option
  (** Gets information about the property that this method call is for, if any.

      This will only be set in the case of an invocation in response to a
      property Get or Set call that has been directed to the method call handler
      for an object on account of its property_get() or property_set() vtable
      pointers being unset.

      See [GDBusInterfaceVTable] for more information.

      If the call was GetAll, [None] will be returned. *)

  method get_sender : unit -> string option
  (** Gets the bus name that invoked the method.

      This can return [None] if not specified by the caller, e.g. on
      peer-to-peer connections. *)

  method return_dbus_error : string -> string -> unit
  (** Finishes handling a D-Bus method call by returning an error.

      This method will take ownership of [invocation]. See
      [GDBusInterfaceVTable] for more information about the ownership of
      [invocation]. *)

  method return_gerror : GError.t -> unit
  (** Like g_dbus_method_invocation_return_error() but takes a [GError] instead
      of the error domain, error code and message.

      This method will take ownership of [invocation]. See
      [GDBusInterfaceVTable] for more information about the ownership of
      [invocation]. *)

  method return_value : Gvariant.t option -> unit
  [@@ocaml.doc
    "Finishes handling a D-Bus method call by returning [parameters].\n\
     If the [parameters] GVariant is floating, it is consumed.\n\n\
     It is an error if [parameters] is not of the right format: it must be a \
     tuple\n\
     containing the out-parameters of the D-Bus method. Even if the method has a\n\
     single out-parameter, it must be contained in a tuple. If the method has no\n\
     out-parameters, [parameters] may be [None] or an empty tuple.\n\n\
     {[\n\
     GDBusMethodInvocation *invocation = some_invocation;\n\
     g_autofree gchar *result_string = NULL;\n\
     g_autoptr (GError) error = NULL;\n\n\
     result_string = calculate_result (&error);\n\n\
     if (error != NULL)\n\
    \  g_dbus_method_invocation_return_gerror (invocation, error);\n\
     else\n\
    \  g_dbus_method_invocation_return_value (invocation,\n\
    \                                         g_variant_new (\"(s)\", \
     result_string));\n\n\
     // Do not free @invocation here; returning a value does that\n\
     ]}\n\n\
     This method will take ownership of [invocation]. See\n\
     [GDBusInterfaceVTable] for more information about the ownership of\n\
     [invocation].\n\n\
     Since 2.48, if the method call requested for a reply not to be sent\n\
     then this call will sink [parameters] and free [invocation], but\n\
     otherwise do nothing (as per the recommendations of the D-Bus\n\
     specification)."]

  method return_value_with_unix_fd_list :
    Gvariant.t option -> Unix_fd_list.unix_fd_list_t option -> unit
  (** Like g_dbus_method_invocation_return_value() but also takes a
      [GUnixFDList].

      This method is only available on UNIX.

      This method will take ownership of [invocation]. See
      [GDBusInterfaceVTable] for more information about the ownership of
      [invocation]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_method_invocation : Raw.D_bus_method_invocation.t
end

class d_bus_method_invocation :
  Raw.D_bus_method_invocation.t ->
  d_bus_method_invocation_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_method_invocation.t}. *)

(** {1:description Description}

    Instances of the [GDBusMethodInvocation] class are used when handling D-Bus
    method calls. It provides a way to asynchronously return results and errors.

    The normal way to obtain a [GDBusMethodInvocation] object is to receive it
    as an argument to the [handle_method_call()] function in a
    {{!Ocgio.D_bus_interface_v_table.class-type-d_bus_interface_v_table_t}[Gio.DBusInterfaceVTable]}
    that was passed to [Gio.DBusConnection.register_object]. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)

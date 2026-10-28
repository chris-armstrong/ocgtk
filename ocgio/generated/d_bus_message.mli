(** A type for representing D-Bus messages that can be sent or received on a
    [Gio.DBusConnection].

    Its methods, signals and properties are on {!class-type-d_bus_message_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.D_bus_message}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusMessage].}

    Inherits from: [GObject.Object]

    A type for representing D-Bus messages that can be sent or received on a
    [Gio.DBusConnection]. *)
class type d_bus_message_t = object
  (** {2:methods Methods} *)

  method copy : unit -> (d_bus_message_t, GError.t) result
  (** Copies [message]. The copy is a deep copy and the returned [GDBusMessage]
      is completely identical except that it is guaranteed to not be locked.

      This operation can fail if e.g. [message] contains file descriptors and
      the per-process or system-wide open files limit is reached. *)

  method get_arg0 : unit -> string option
  (** Convenience to get the first item in the body of [message].

      See [Gio.DBusMessage.get_arg0_path] for returning object-path-typed arg0
      values. *)

  method get_arg0_path : unit -> string option
  (** Convenience to get the first item in the body of [message].

      See [Gio.DBusMessage.get_arg0] for returning string-typed arg0 values. *)

  method get_body : unit -> Gvariant.t option
  (** Gets the body of a message. *)

  method get_byte_order : unit -> Enums.dbusmessagebyteorder
  (** Gets the byte order of [message]. *)

  method get_destination : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION]
      header field. *)

  method get_error_name : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME] header
      field. *)

  method get_flags : unit -> Enums.dbusmessageflags
  (** Gets the flags for [message]. *)

  method get_header : Enums.dbusmessageheaderfield -> Gvariant.t option
  (** Gets a header field on [message].

      The caller is responsible for checking the type of the returned [GVariant]
      matches what is expected. *)

  method get_interface : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE] header
      field. *)

  method get_locked : unit -> bool
  (** Checks whether [message] is locked. To monitor changes to this value,
      connect to the [GObject::notify] signal to listen for changes on the
      [GDBusMessage:locked] property. *)

  method get_member : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_MEMBER] header
      field. *)

  method get_message_type : unit -> Enums.dbusmessagetype
  (** Gets the type of [message]. *)

  method get_num_unix_fds : unit -> UInt32.t
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS]
      header field. *)

  method get_path : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_PATH] header
      field. *)

  method get_reply_serial : unit -> UInt32.t
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL]
      header field. *)

  method get_sender : unit -> string option
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_SENDER] header
      field. *)

  method get_serial : unit -> UInt32.t
  (** Gets the serial for [message]. *)

  method get_signature : unit -> string
  (** Convenience getter for the [G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE] header
      field.

      This will always be non-[NULL], but may be an empty string. *)

  method get_unix_fd_list : unit -> Unix_fd_list.unix_fd_list_t option
  (** Gets the UNIX file descriptors associated with [message], if any.

      This method is only available on UNIX.

      The file descriptors normally correspond to [G_VARIANT_TYPE_HANDLE] values
      in the body of the message. For example, if g_variant_get_handle() returns
      5, that is intended to be a reference to the file descriptor that can be
      accessed by [g_unix_fd_list_get (list, 5, ...)]. *)

  method lock : unit -> unit
  (** If [message] is locked, does nothing. Otherwise locks the message. *)

  method new_method_error_literal : string -> string -> d_bus_message_t
  (** Creates a new [GDBusMessage] that is an error reply to
      [method_call_message]. *)

  method new_method_reply : unit -> d_bus_message_t
  (** Creates a new [GDBusMessage] that is a reply to [method_call_message]. *)

  method print : int -> string
  (** Produces a human-readable multi-line description of [message].

      The contents of the description has no ABI guarantees, the contents and
      formatting is subject to change at any time. Typical output looks
      something like this:

      {[
      Flags:   none
      Version: 0
      Serial:  4
      Headers:
        path -> objectpath '/org/gtk/GDBus/TestObject'
        interface -> 'org.gtk.GDBus.TestInterface'
        member -> 'GimmeStdout'
        destination -> ':1.146'
      Body: ()
      UNIX File Descriptors:
        (none)
      ]}

      or

      {[
      Flags:   no-reply-expected
      Version: 0
      Serial:  477
      Headers:
        reply-serial -> uint32 4
        destination -> ':1.159'
        sender -> ':1.146'
        num-unix-fds -> uint32 1
      Body: ()
      UNIX File Descriptors:
        fd 12: dev=0:10,mode=020620,ino=5,uid=500,gid=5,rdev=136:2,size=0,atime=1273085037,mtime=1273085851,ctime=1272982635
      ]} *)

  method set_body : Gvariant.t -> unit
  (** Sets the body [message]. As a side-effect the
      [G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE] header field is set to the type
      string of [body] (or cleared if [body] is [NULL]).

      If [body] is floating, [message] assumes ownership of [body]. *)

  method set_byte_order : Enums.dbusmessagebyteorder -> unit
  (** Sets the byte order of [message]. *)

  method set_destination : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION]
      header field. *)

  method set_error_name : string -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME] header
      field. *)

  method set_flags : Enums.dbusmessageflags -> unit
  (** Sets the flags to set on [message]. *)

  method set_header : Enums.dbusmessageheaderfield -> Gvariant.t option -> unit
  (** Sets a header field on [message].

      If [value] is floating, [message] assumes ownership of [value]. *)

  method set_interface : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE] header
      field. *)

  method set_member : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_MEMBER] header
      field. *)

  method set_message_type : Enums.dbusmessagetype -> unit
  (** Sets [message] to be of [type]. *)

  method set_num_unix_fds : UInt32.t -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS]
      header field. *)

  method set_path : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_PATH] header
      field. *)

  method set_reply_serial : UInt32.t -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL]
      header field. *)

  method set_sender : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_SENDER] header
      field. *)

  method set_serial : UInt32.t -> unit
  (** Sets the serial for [message].

      The
      {{:https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-messages}D-Bus
       specification} does not allow the [serial] to be zero. *)

  method set_signature : string option -> unit
  (** Convenience setter for the [G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE] header
      field. *)

  method set_unix_fd_list : Unix_fd_list.unix_fd_list_t option -> unit
  (** Sets the UNIX file descriptors associated with [message]. As a side-effect
      the [G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS] header field is set to the
      number of fds in [fd_list] (or cleared if [fd_list] is [NULL]).

      This method is only available on UNIX.

      When designing D-Bus APIs that are intended to be interoperable, please
      note that non-GDBus implementations of D-Bus can usually only access file
      descriptors if they are referenced by a value of type
      [G_VARIANT_TYPE_HANDLE] in the body of the message. *)

  method to_gerror : unit -> (bool, GError.t) result
  (** If [message] is not of type [G_DBUS_MESSAGE_TYPE_ERROR] does nothing and
      returns [FALSE].

      Otherwise this method encodes the error in [message] as a [GError] using
      g_dbus_error_set_dbus_error() using the information in the
      [G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME] header field of [message] as well
      as the first string item in [message]'s body. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_message : Raw.D_bus_message.t
end

class d_bus_message : Raw.D_bus_message.t -> d_bus_message_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_message.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> d_bus_message_t
(** Creates a new empty [GDBusMessage]. *)

val new_method_call :
  string option -> string -> string option -> string -> d_bus_message_t
(** Creates a new [GDBusMessage] for a method call. *)

val new_signal : string -> string -> string -> d_bus_message_t
(** Creates a new [GDBusMessage] for a signal emission. *)

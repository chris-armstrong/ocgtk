(* GENERATED CODE - DO NOT EDIT *)
(* DBusMessage: DBusMessage *)

type t = [`d_bus_message | `object_] Gobject.obj

(** Create a new DBusMessage *)
external new_ : unit -> t = "ml_g_dbus_message_new"

(** Create a new DBusMessage *)
external new_method_call : string option -> string -> string option -> string -> t = "ml_g_dbus_message_new_method_call"

(** Create a new DBusMessage *)
external new_signal : string -> string -> string -> t = "ml_g_dbus_message_new_signal"

(* Methods *)
(** If @message is not of type %G_DBUS_MESSAGE_TYPE_ERROR does
nothing and returns %FALSE.

Otherwise this method encodes the error in @message as a #GError
using g_dbus_error_set_dbus_error() using the information in the
%G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field of @message as
well as the first string item in @message's body. *)
external to_gerror : t -> (bool, GError.t) result = "ml_g_dbus_message_to_gerror"

(** Sets the UNIX file descriptors associated with @message. As a
side-effect the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header
field is set to the number of fds in @fd_list (or cleared if
@fd_list is %NULL).

This method is only available on UNIX.

When designing D-Bus APIs that are intended to be interoperable,
please note that non-GDBus implementations of D-Bus can usually only
access file descriptors if they are referenced by a value of type
%G_VARIANT_TYPE_HANDLE in the body of the message. *)
external set_unix_fd_list : t -> Unix_fd_list.t option -> unit = "ml_g_dbus_message_set_unix_fd_list"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field. *)
external set_signature : t -> string option -> unit = "ml_g_dbus_message_set_signature"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field. *)
external set_sender : t -> string option -> unit = "ml_g_dbus_message_set_sender"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field. *)
external set_path : t -> string option -> unit = "ml_g_dbus_message_set_path"

(** Sets @message to be of @type. *)
external set_message_type : t -> Gio_enums.dbusmessagetype -> unit = "ml_g_dbus_message_set_message_type"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field. *)
external set_member : t -> string option -> unit = "ml_g_dbus_message_set_member"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field. *)
external set_interface : t -> string option -> unit = "ml_g_dbus_message_set_interface"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field. *)
external set_error_name : t -> string -> unit = "ml_g_dbus_message_set_error_name"

(** Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field. *)
external set_destination : t -> string option -> unit = "ml_g_dbus_message_set_destination"

(** Sets the byte order of @message. *)
external set_byte_order : t -> Gio_enums.dbusmessagebyteorder -> unit = "ml_g_dbus_message_set_byte_order"

(** Produces a human-readable multi-line description of @message.

The contents of the description has no ABI guarantees, the contents
and formatting is subject to change at any time. Typical output
looks something like this:
```
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
```
or
```
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
``` *)
external print : t -> int -> string = "ml_g_dbus_message_print"

(** Creates a new #GDBusMessage that is a reply to @method_call_message. *)
external new_method_reply : t -> t = "ml_g_dbus_message_new_method_reply"

(** Creates a new #GDBusMessage that is an error reply to @method_call_message. *)
external new_method_error_literal : t -> string -> string -> t = "ml_g_dbus_message_new_method_error_literal"

(** If @message is locked, does nothing. Otherwise locks the message. *)
external lock : t -> unit = "ml_g_dbus_message_lock"

(** Gets the UNIX file descriptors associated with @message, if any.

This method is only available on UNIX.

The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
values in the body of the message. For example,
if g_variant_get_handle() returns 5, that is intended to be a reference
to the file descriptor that can be accessed by
`g_unix_fd_list_get (list, 5, ...)`. *)
external get_unix_fd_list : t -> Unix_fd_list.t option = "ml_g_dbus_message_get_unix_fd_list"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field.

This will always be non-%NULL, but may be an empty string. *)
external get_signature : t -> string = "ml_g_dbus_message_get_signature"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field. *)
external get_sender : t -> string option = "ml_g_dbus_message_get_sender"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field. *)
external get_path : t -> string option = "ml_g_dbus_message_get_path"

(** Gets the type of @message. *)
external get_message_type : t -> Gio_enums.dbusmessagetype = "ml_g_dbus_message_get_message_type"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field. *)
external get_member : t -> string option = "ml_g_dbus_message_get_member"

(** Checks whether @message is locked. To monitor changes to this
value, conncet to the #GObject::notify signal to listen for changes
on the #GDBusMessage:locked property. *)
external get_locked : t -> bool = "ml_g_dbus_message_get_locked"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field. *)
external get_interface : t -> string option = "ml_g_dbus_message_get_interface"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field. *)
external get_error_name : t -> string option = "ml_g_dbus_message_get_error_name"

(** Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field. *)
external get_destination : t -> string option = "ml_g_dbus_message_get_destination"

(** Gets the byte order of @message. *)
external get_byte_order : t -> Gio_enums.dbusmessagebyteorder = "ml_g_dbus_message_get_byte_order"

(** Convenience to get the first item in the body of @message.

See [method@Gio.DBusMessage.get_arg0] for returning string-typed arg0 values. *)
external get_arg0_path : t -> string option = "ml_g_dbus_message_get_arg0_path"

(** Convenience to get the first item in the body of @message.

See [method@Gio.DBusMessage.get_arg0_path] for returning object-path-typed
arg0 values. *)
external get_arg0 : t -> string option = "ml_g_dbus_message_get_arg0"

(** Copies @message. The copy is a deep copy and the returned
#GDBusMessage is completely identical except that it is guaranteed
to not be locked.

This operation can fail if e.g. @message contains file descriptors
and the per-process or system-wide open files limit is reached. *)
external copy : t -> (t, GError.t) result = "ml_g_dbus_message_copy"

(* Properties *)


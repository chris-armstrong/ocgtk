(** [GMountOperation] provides a mechanism for interacting with the user. It can
    be used for authenticating mountable operations, such as loop mounting
    files, hard drive partitions or server locations. It can also be used to ask
    the user questions or show a list of applications preventing unmount or
    eject operations from completing.

    Note that [GMountOperation] is used for more than just [Gio.Mount] objects –
    for example it is also used in [Gio.Drive.start] and [Gio.Drive.stop].

    Users should instantiate a subclass of this that implements all the various
    callbacks to show the required dialogs, such as
    {{:https://docs.gtk.org/gtk4/class.MountOperation.html}[GtkMountOperation]}.
    If no user interaction is desired (for example when automounting filesystems
    at login time), usually [NULL] can be passed, see each method taking a
    [GMountOperation] for details.

    Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with
    TrueCrypt and VeraCrypt’.
    {{:https://en.wikipedia.org/wiki/TrueCrypt}TrueCrypt} is a discontinued
    system for encrypting file containers, partitions or whole disks, typically
    used with Windows. {{:https://www.veracrypt.fr/}VeraCrypt} is a maintained
    fork of TrueCrypt with various improvements and auditing fixes.

    Its methods, signals and properties are on {!class-type-mount_operation_t}.
    The functions it is built on are in {!Ocgio.Raw.Mount_operation}. *)

(** The methods, signals and properties of a [GMountOperation]. *)
class type mount_operation_t = object
  method on_aborted :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_ask_password :
    ?after:bool ->
    callback:
      (message:string ->
      default_user:string ->
      default_domain:string ->
      flags:Enums.askpasswordflags ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_reply :
    ?after:bool ->
    callback:(result:Enums.mountoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_show_unmount_progress :
    ?after:bool ->
    callback:(message:string -> time_left:Int64.t -> bytes_left:Int64.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_anonymous : unit -> bool
  method get_choice : unit -> int
  method get_domain : unit -> string option
  method get_is_tcrypt_hidden_volume : unit -> bool
  method get_is_tcrypt_system_volume : unit -> bool
  method get_password : unit -> string option
  method get_password_save : unit -> Enums.passwordsave
  method get_pim : unit -> int
  method get_username : unit -> string option
  method reply : Enums.mountoperationresult -> unit
  method set_anonymous : bool -> unit
  method set_choice : int -> unit
  method set_domain : string option -> unit
  method set_is_tcrypt_hidden_volume : bool -> unit
  method set_is_tcrypt_system_volume : bool -> unit
  method set_password : string option -> unit
  method set_password_save : Enums.passwordsave -> unit
  method set_pim : int -> unit
  method set_username : string option -> unit
  method as_mount_operation : Raw.Mount_operation.t
end

class mount_operation : Raw.Mount_operation.t -> mount_operation_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Mount_operation.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GMountOperation], give one already wrapped. *)

val new_ : unit -> mount_operation_t

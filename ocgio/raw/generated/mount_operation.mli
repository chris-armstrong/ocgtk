(* GENERATED CODE - DO NOT EDIT *)
(* MountOperation: MountOperation *)

(** [GMountOperation] provides a mechanism for interacting with the user. It can
    be used for authenticating mountable operations, such as loop mounting
    files, hard drive partitions or server locations. It can also be used to ask
    the user questions or show a list of applications preventing unmount or
    eject operations from completing.

    Note that [GMountOperation] is used for more than just
    {{!Ocgio.Raw.Mount}[Gio.Mount]} objects – for example it is also used in
    [Gio.Drive.start] and [Gio.Drive.stop].

    Users should instantiate a subclass of this that implements all the various
    callbacks to show the required dialogs, such as
    {{:https://docs.gtk.org/gtk4/class.MountOperation.html}[GtkMountOperation]}.
    If no user interaction is desired (for example when automounting filesystems
    at login time), usually [None] can be passed, see each method taking a
    [GMountOperation] for details.

    Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with
    TrueCrypt and VeraCrypt’.
    {{:https://en.wikipedia.org/wiki/TrueCrypt}TrueCrypt} is a discontinued
    system for encrypting file containers, partitions or whole disks, typically
    used with Windows. {{:https://www.veracrypt.fr/}VeraCrypt} is a maintained
    fork of TrueCrypt with various improvements and auditing fixes.

    The class built on this module is in {!Ocgio.Mount_operation}. *)

type t = [ `mount_operation | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_mount_operation_get_type"

external new_ : unit -> t = "ml_g_mount_operation_new"
(** Creates a new mount operation. *)

(* Methods *)

external set_username : t -> string option -> unit
  = "ml_g_mount_operation_set_username"
(** Sets the user name within [op] to [username]. *)

external set_pim : t -> int -> unit = "ml_g_mount_operation_set_pim"
(** Sets the mount operation's PIM to [pim]. *)

external set_password_save : t -> Ocgio_enums.passwordsave -> unit
  = "ml_g_mount_operation_set_password_save"
(** Sets the state of saving passwords for the mount operation. *)

external set_password : t -> string option -> unit
  = "ml_g_mount_operation_set_password"
(** Sets the mount operation's password to [password]. *)

external set_is_tcrypt_system_volume : t -> bool -> unit
  = "ml_g_mount_operation_set_is_tcrypt_system_volume"
(** Sets the mount operation to use a system volume if [system_volume] is
    [true]. *)

external set_is_tcrypt_hidden_volume : t -> bool -> unit
  = "ml_g_mount_operation_set_is_tcrypt_hidden_volume"
(** Sets the mount operation to use a hidden volume if [hidden_volume] is
    [true]. *)

external set_domain : t -> string option -> unit
  = "ml_g_mount_operation_set_domain"
(** Sets the mount operation's domain. *)

external set_choice : t -> int -> unit = "ml_g_mount_operation_set_choice"
(** Sets a default choice for the mount operation. *)

external set_anonymous : t -> bool -> unit
  = "ml_g_mount_operation_set_anonymous"
(** Sets the mount operation to use an anonymous user if [anonymous] is [true].
*)

external reply : t -> Ocgio_enums.mountoperationresult -> unit
  = "ml_g_mount_operation_reply"
(** Emits the
    {{!Ocgio.Raw.Mount_operation.val-on_reply}[GMountOperation::reply]} signal.
*)

external get_username : t -> string option = "ml_g_mount_operation_get_username"
(** Get the user name from the mount operation. *)

external get_pim : t -> int = "ml_g_mount_operation_get_pim"
(** Gets a PIM from the mount operation. *)

external get_password_save : t -> Ocgio_enums.passwordsave
  = "ml_g_mount_operation_get_password_save"
(** Gets the state of saving passwords for the mount operation. *)

external get_password : t -> string option = "ml_g_mount_operation_get_password"
(** Gets a password from the mount operation. *)

external get_is_tcrypt_system_volume : t -> bool
  = "ml_g_mount_operation_get_is_tcrypt_system_volume"
(** Check to see whether the mount operation is being used for a TCRYPT system
    volume. *)

external get_is_tcrypt_hidden_volume : t -> bool
  = "ml_g_mount_operation_get_is_tcrypt_hidden_volume"
(** Check to see whether the mount operation is being used for a TCRYPT hidden
    volume. *)

external get_domain : t -> string option = "ml_g_mount_operation_get_domain"
(** Gets the domain of the mount operation. *)

external get_choice : t -> int = "ml_g_mount_operation_get_choice"
(** Gets a choice from the mount operation. *)

external get_anonymous : t -> bool = "ml_g_mount_operation_get_anonymous"
(** Check to see whether the mount operation is being used for an anonymous
    user. *)

(* Properties *)

val on_aborted :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted by the backend when e.g. a device becomes unavailable while a mount
    operation is in progress.

    Implementations of GMountOperation should handle this signal by dismissing
    open password dialogs. *)

val on_ask_password :
  ?after:bool ->
  t ->
  callback:
    (message:string ->
    default_user:string ->
    default_domain:string ->
    flags:Ocgio_enums.askpasswordflags ->
    unit) ->
  Gobject.Signal.handler_id
(** Emitted when a mount operation asks the user for a password.

    If the message contains a line break, the first line should be presented as
    a heading. For example, it may be used as the primary text in a
    [GtkMessageDialog]. *)

val on_reply :
  ?after:bool ->
  t ->
  callback:(result:Ocgio_enums.mountoperationresult -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the user has replied to the mount operation. *)

val on_show_unmount_progress :
  ?after:bool ->
  t ->
  callback:(message:string -> time_left:Int64.t -> bytes_left:Int64.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when an unmount operation has been busy for more than some time
    (typically 1.5 seconds).

    When unmounting or ejecting a volume, the kernel might need to flush pending
    data in its buffers to the volume stable storage, and this operation can
    take a considerable amount of time. This signal may be emitted several times
    as long as the unmount operation is outstanding, and then one last time when
    the operation is completed, with [bytes_left] set to zero.

    Implementations of GMountOperation should handle this signal by showing an
    UI notification, and then dismiss it, or show another notification of
    completion, when [bytes_left] reaches zero.

    If the message contains a line break, the first line should be presented as
    a heading. For example, it may be used as the primary text in a
    [GtkMessageDialog]. *)

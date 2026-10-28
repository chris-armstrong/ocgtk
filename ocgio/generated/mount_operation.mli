(** [GMountOperation] provides a mechanism for interacting with the user. It can
    be used for authenticating mountable operations, such as loop mounting
    files, hard drive partitions or server locations. It can also be used to ask
    the user questions or show a list of applications preventing unmount or
    eject operations from completing.

    Its methods, signals and properties are on {!class-type-mount_operation_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Mount_operation}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MountOperation].}

    [GMountOperation] provides a mechanism for interacting with the user. It can
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
    fork of TrueCrypt with various improvements and auditing fixes. *)
class type mount_operation_t = object
  method on_aborted :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted by the backend when e.g. a device becomes unavailable while a
      mount operation is in progress.

      Implementations of GMountOperation should handle this signal by dismissing
      open password dialogs. *)

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
  (** Emitted when a mount operation asks the user for a password.

      If the message contains a line break, the first line should be presented
      as a heading. For example, it may be used as the primary text in a
      [GtkMessageDialog]. *)

  method on_reply :
    ?after:bool ->
    callback:(result:Enums.mountoperationresult -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user has replied to the mount operation. *)

  method on_show_unmount_progress :
    ?after:bool ->
    callback:(message:string -> time_left:Int64.t -> bytes_left:Int64.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an unmount operation has been busy for more than some time
      (typically 1.5 seconds).

      When unmounting or ejecting a volume, the kernel might need to flush
      pending data in its buffers to the volume stable storage, and this
      operation can take a considerable amount of time. This signal may be
      emitted several times as long as the unmount operation is outstanding, and
      then one last time when the operation is completed, with [bytes_left] set
      to zero.

      Implementations of GMountOperation should handle this signal by showing an
      UI notification, and then dismiss it, or show another notification of
      completion, when [bytes_left] reaches zero.

      If the message contains a line break, the first line should be presented
      as a heading. For example, it may be used as the primary text in a
      [GtkMessageDialog]. *)

  method get_anonymous : unit -> bool
  (** Check to see whether the mount operation is being used for an anonymous
      user. *)

  method get_choice : unit -> int
  (** Gets a choice from the mount operation. *)

  method get_domain : unit -> string option
  (** Gets the domain of the mount operation. *)

  method get_is_tcrypt_hidden_volume : unit -> bool
  (** Check to see whether the mount operation is being used for a TCRYPT hidden
      volume. *)

  method get_is_tcrypt_system_volume : unit -> bool
  (** Check to see whether the mount operation is being used for a TCRYPT system
      volume. *)

  method get_password : unit -> string option
  (** Gets a password from the mount operation. *)

  method get_password_save : unit -> Enums.passwordsave
  (** Gets the state of saving passwords for the mount operation. *)

  method get_pim : unit -> int
  (** Gets a PIM from the mount operation. *)

  method get_username : unit -> string option
  (** Get the user name from the mount operation. *)

  method reply : Enums.mountoperationresult -> unit
  (** Emits the [GMountOperation::reply] signal. *)

  method set_anonymous : bool -> unit
  (** Sets the mount operation to use an anonymous user if [anonymous] is
      [TRUE]. *)

  method set_choice : int -> unit
  (** Sets a default choice for the mount operation. *)

  method set_domain : string option -> unit
  (** Sets the mount operation's domain. *)

  method set_is_tcrypt_hidden_volume : bool -> unit
  (** Sets the mount operation to use a hidden volume if [hidden_volume] is
      [TRUE]. *)

  method set_is_tcrypt_system_volume : bool -> unit
  (** Sets the mount operation to use a system volume if [system_volume] is
      [TRUE]. *)

  method set_password : string option -> unit
  (** Sets the mount operation's password to [password]. *)

  method set_password_save : Enums.passwordsave -> unit
  (** Sets the state of saving passwords for the mount operation. *)

  method set_pim : int -> unit
  (** Sets the mount operation's PIM to [pim]. *)

  method set_username : string option -> unit
  (** Sets the user name within [op] to [username]. *)

  method as_mount_operation : Raw.Mount_operation.t
end

class mount_operation : Raw.Mount_operation.t -> mount_operation_t
(** Wraps a raw handle of {!Ocgio.Raw.Mount_operation.t}. *)

(** {1:description Description}

    [GMountOperation] provides a mechanism for interacting with the user. It can
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
    fork of TrueCrypt with various improvements and auditing fixes. *)

(** {1:constructors Constructors} *)

val new_ : unit -> mount_operation_t
(** Creates a new mount operation. *)

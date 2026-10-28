class type mount_operation_t = object
  (** {2:signals Signals} *)

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

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_mount_operation : Raw.Mount_operation.t
end

(* High-level class for MountOperation *)
class mount_operation (obj : Raw.Mount_operation.t) : mount_operation_t =
  object (self)
    method on_aborted ?(after = false) ~callback () =
      Raw.Mount_operation.on_aborted ~after self#as_mount_operation ~callback

    method on_ask_password ?(after = false) ~callback () =
      Raw.Mount_operation.on_ask_password ~after self#as_mount_operation
        ~callback

    method on_reply ?(after = false) ~callback () =
      Raw.Mount_operation.on_reply ~after self#as_mount_operation ~callback

    method on_show_unmount_progress ?(after = false) ~callback () =
      Raw.Mount_operation.on_show_unmount_progress ~after
        self#as_mount_operation ~callback

    method get_anonymous : unit -> bool =
      fun () -> Raw.Mount_operation.get_anonymous obj

    method get_choice : unit -> int =
      fun () -> Raw.Mount_operation.get_choice obj

    method get_domain : unit -> string option =
      fun () -> Raw.Mount_operation.get_domain obj

    method get_is_tcrypt_hidden_volume : unit -> bool =
      fun () -> Raw.Mount_operation.get_is_tcrypt_hidden_volume obj

    method get_is_tcrypt_system_volume : unit -> bool =
      fun () -> Raw.Mount_operation.get_is_tcrypt_system_volume obj

    method get_password : unit -> string option =
      fun () -> Raw.Mount_operation.get_password obj

    method get_password_save : unit -> Enums.passwordsave =
      fun () -> Raw.Mount_operation.get_password_save obj

    method get_pim : unit -> int = fun () -> Raw.Mount_operation.get_pim obj

    method get_username : unit -> string option =
      fun () -> Raw.Mount_operation.get_username obj

    method reply : Enums.mountoperationresult -> unit =
      fun result -> Raw.Mount_operation.reply obj result

    method set_anonymous : bool -> unit =
      fun anonymous -> Raw.Mount_operation.set_anonymous obj anonymous

    method set_choice : int -> unit =
      fun choice -> Raw.Mount_operation.set_choice obj choice

    method set_domain : string option -> unit =
      fun domain -> Raw.Mount_operation.set_domain obj domain

    method set_is_tcrypt_hidden_volume : bool -> unit =
      fun hidden_volume ->
        Raw.Mount_operation.set_is_tcrypt_hidden_volume obj hidden_volume

    method set_is_tcrypt_system_volume : bool -> unit =
      fun system_volume ->
        Raw.Mount_operation.set_is_tcrypt_system_volume obj system_volume

    method set_password : string option -> unit =
      fun password -> Raw.Mount_operation.set_password obj password

    method set_password_save : Enums.passwordsave -> unit =
      fun save -> Raw.Mount_operation.set_password_save obj save

    method set_pim : int -> unit =
      fun pim -> Raw.Mount_operation.set_pim obj pim

    method set_username : string option -> unit =
      fun username -> Raw.Mount_operation.set_username obj username

    method as_mount_operation = obj
  end

let new_ () : mount_operation_t =
  new mount_operation (Raw.Mount_operation.new_ ())

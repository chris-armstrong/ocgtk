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

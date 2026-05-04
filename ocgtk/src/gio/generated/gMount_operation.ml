class type mount_operation_t = object
  method on_aborted : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_ask_password :
    callback:
      (message:string ->
      default_user:string ->
      default_domain:string ->
      flags:Gio_enums.askpasswordflags ->
      unit) ->
    Gobject.Signal.handler_id

  method on_reply :
    callback:(result:Gio_enums.mountoperationresult -> unit) ->
    Gobject.Signal.handler_id

  method on_show_unmount_progress :
    callback:(message:string -> time_left:Int64.t -> bytes_left:Int64.t -> unit) ->
    Gobject.Signal.handler_id

  method get_anonymous : unit -> bool
  method get_choice : unit -> int
  method get_domain : unit -> string option
  method get_is_tcrypt_hidden_volume : unit -> bool
  method get_is_tcrypt_system_volume : unit -> bool
  method get_password : unit -> string option
  method get_password_save : unit -> Gio_enums.passwordsave
  method get_pim : unit -> int
  method get_username : unit -> string option
  method reply : Gio_enums.mountoperationresult -> unit
  method set_anonymous : bool -> unit
  method set_choice : int -> unit
  method set_domain : string option -> unit
  method set_is_tcrypt_hidden_volume : bool -> unit
  method set_is_tcrypt_system_volume : bool -> unit
  method set_password : string option -> unit
  method set_password_save : Gio_enums.passwordsave -> unit
  method set_pim : int -> unit
  method set_username : string option -> unit
  method as_mount_operation : Mount_operation.t
end

(* High-level class for MountOperation *)
class mount_operation (obj : Mount_operation.t) : mount_operation_t =
  object (self)
    method on_aborted ~callback =
      Mount_operation.on_aborted self#as_mount_operation ~callback

    method on_ask_password ~callback =
      Mount_operation.on_ask_password self#as_mount_operation ~callback

    method on_reply ~callback =
      Mount_operation.on_reply self#as_mount_operation ~callback

    method on_show_unmount_progress ~callback =
      Mount_operation.on_show_unmount_progress self#as_mount_operation ~callback

    method get_anonymous : unit -> bool =
      fun () -> Mount_operation.get_anonymous obj

    method get_choice : unit -> int = fun () -> Mount_operation.get_choice obj

    method get_domain : unit -> string option =
      fun () -> Mount_operation.get_domain obj

    method get_is_tcrypt_hidden_volume : unit -> bool =
      fun () -> Mount_operation.get_is_tcrypt_hidden_volume obj

    method get_is_tcrypt_system_volume : unit -> bool =
      fun () -> Mount_operation.get_is_tcrypt_system_volume obj

    method get_password : unit -> string option =
      fun () -> Mount_operation.get_password obj

    method get_password_save : unit -> Gio_enums.passwordsave =
      fun () -> Mount_operation.get_password_save obj

    method get_pim : unit -> int = fun () -> Mount_operation.get_pim obj

    method get_username : unit -> string option =
      fun () -> Mount_operation.get_username obj

    method reply : Gio_enums.mountoperationresult -> unit =
      fun result -> Mount_operation.reply obj result

    method set_anonymous : bool -> unit =
      fun anonymous -> Mount_operation.set_anonymous obj anonymous

    method set_choice : int -> unit =
      fun choice -> Mount_operation.set_choice obj choice

    method set_domain : string option -> unit =
      fun domain -> Mount_operation.set_domain obj domain

    method set_is_tcrypt_hidden_volume : bool -> unit =
      fun hidden_volume ->
        Mount_operation.set_is_tcrypt_hidden_volume obj hidden_volume

    method set_is_tcrypt_system_volume : bool -> unit =
      fun system_volume ->
        Mount_operation.set_is_tcrypt_system_volume obj system_volume

    method set_password : string option -> unit =
      fun password -> Mount_operation.set_password obj password

    method set_password_save : Gio_enums.passwordsave -> unit =
      fun save -> Mount_operation.set_password_save obj save

    method set_pim : int -> unit = fun pim -> Mount_operation.set_pim obj pim

    method set_username : string option -> unit =
      fun username -> Mount_operation.set_username obj username

    method as_mount_operation = obj
  end

let new_ () : mount_operation_t = new mount_operation (Mount_operation.new_ ())

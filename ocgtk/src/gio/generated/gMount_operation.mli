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

class mount_operation : Mount_operation.t -> mount_operation_t

val new_ : unit -> mount_operation_t

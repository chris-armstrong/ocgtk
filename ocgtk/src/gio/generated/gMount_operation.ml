(* Signal class defined in gmount_operation_signals.ml *)

(* High-level class for MountOperation *)
class mount_operation (obj : Mount_operation.t) = object (self)
  inherit Gmount_operation_signals.mount_operation_signals obj

  method get_anonymous : unit -> bool =
    fun () ->
      (Mount_operation.get_anonymous obj)

  method get_choice : unit -> int =
    fun () ->
      (Mount_operation.get_choice obj)

  method get_domain : unit -> string option =
    fun () ->
      (Mount_operation.get_domain obj)

  method get_is_tcrypt_hidden_volume : unit -> bool =
    fun () ->
      (Mount_operation.get_is_tcrypt_hidden_volume obj)

  method get_is_tcrypt_system_volume : unit -> bool =
    fun () ->
      (Mount_operation.get_is_tcrypt_system_volume obj)

  method get_password : unit -> string option =
    fun () ->
      (Mount_operation.get_password obj)

  method get_password_save : unit -> Gio_enums.passwordsave =
    fun () ->
      (Mount_operation.get_password_save obj)

  method get_pim : unit -> int =
    fun () ->
      (Mount_operation.get_pim obj)

  method get_username : unit -> string option =
    fun () ->
      (Mount_operation.get_username obj)

  method reply : Gio_enums.mountoperationresult -> unit =
    fun result ->
      (Mount_operation.reply obj result)

  method set_anonymous : bool -> unit =
    fun anonymous ->
      (Mount_operation.set_anonymous obj anonymous)

  method set_choice : int -> unit =
    fun choice ->
      (Mount_operation.set_choice obj choice)

  method set_domain : string option -> unit =
    fun domain ->
      (Mount_operation.set_domain obj domain)

  method set_is_tcrypt_hidden_volume : bool -> unit =
    fun hidden_volume ->
      (Mount_operation.set_is_tcrypt_hidden_volume obj hidden_volume)

  method set_is_tcrypt_system_volume : bool -> unit =
    fun system_volume ->
      (Mount_operation.set_is_tcrypt_system_volume obj system_volume)

  method set_password : string option -> unit =
    fun password ->
      (Mount_operation.set_password obj password)

  method set_password_save : Gio_enums.passwordsave -> unit =
    fun save ->
      (Mount_operation.set_password_save obj save)

  method set_pim : int -> unit =
    fun pim ->
      (Mount_operation.set_pim obj pim)

  method set_username : string option -> unit =
    fun username ->
      (Mount_operation.set_username obj username)

    method as_mount_operation = obj
end


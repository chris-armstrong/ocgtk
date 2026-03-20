class type unix_mount_point_t = object
    method compare : Unix_mount_point.t -> int
    method copy : unit -> Unix_mount_point.t
    method free : unit -> unit
    method get_device_path : unit -> string
    method get_fs_type : unit -> string
    method get_mount_path : unit -> string
    method get_options : unit -> string option
    method guess_can_eject : unit -> bool
    method guess_icon : unit -> GIcon.icon_t
    method guess_name : unit -> string
    method guess_symbolic_icon : unit -> GIcon.icon_t
    method is_loopback : unit -> bool
    method is_readonly : unit -> bool
    method is_user_mountable : unit -> bool
    method as_unix_mount_point : Unix_mount_point.t
end

(* High-level class for UnixMountPoint *)
class unix_mount_point (obj : Unix_mount_point.t) : unix_mount_point_t = object (self)

  method compare : Unix_mount_point.t -> int =
    fun mount2 ->
      (Unix_mount_point.compare obj mount2)

  method copy : unit -> Unix_mount_point.t =
    fun () ->
      (Unix_mount_point.copy obj)

  method free : unit -> unit =
    fun () ->
      (Unix_mount_point.free obj)

  method get_device_path : unit -> string =
    fun () ->
      (Unix_mount_point.get_device_path obj)

  method get_fs_type : unit -> string =
    fun () ->
      (Unix_mount_point.get_fs_type obj)

  method get_mount_path : unit -> string =
    fun () ->
      (Unix_mount_point.get_mount_path obj)

  method get_options : unit -> string option =
    fun () ->
      (Unix_mount_point.get_options obj)

  method guess_can_eject : unit -> bool =
    fun () ->
      (Unix_mount_point.guess_can_eject obj)

  method guess_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(Unix_mount_point.guess_icon obj)

  method guess_name : unit -> string =
    fun () ->
      (Unix_mount_point.guess_name obj)

  method guess_symbolic_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(Unix_mount_point.guess_symbolic_icon obj)

  method is_loopback : unit -> bool =
    fun () ->
      (Unix_mount_point.is_loopback obj)

  method is_readonly : unit -> bool =
    fun () ->
      (Unix_mount_point.is_readonly obj)

  method is_user_mountable : unit -> bool =
    fun () ->
      (Unix_mount_point.is_user_mountable obj)

    method as_unix_mount_point = obj
end


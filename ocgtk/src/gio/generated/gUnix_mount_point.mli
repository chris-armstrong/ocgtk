class type unix_mount_point_t = object
  method compare : Unix_mount_point.t -> int
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

class unix_mount_point : Unix_mount_point.t -> unix_mount_point_t

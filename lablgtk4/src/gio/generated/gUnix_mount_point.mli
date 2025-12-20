class unix_mount_point : Unix_mount_point.t ->
  object
    method compare : Unix_mount_point.t -> int
    method copy : unit -> Unix_mount_point.t
    method free : unit -> unit
    method get_fs_type : unit -> string
    method get_options : unit -> string option
    method guess_can_eject : unit -> bool
    method guess_name : unit -> string
    method is_loopback : unit -> bool
    method is_readonly : unit -> bool
    method is_user_mountable : unit -> bool
    method as_unix_mount_point : Unix_mount_point.t
  end


class mount_operation : Mount_operation.t ->
  object
    method get_parent : unit -> GApplication_and__window_and__window_group.window option
    method is_showing : unit -> bool
    method set_parent : #GApplication_and__window_and__window_group.window option -> unit
    method as_mount_operation : Mount_operation.t
  end


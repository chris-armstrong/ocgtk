class type mount_operation_t = object
    method get_display : unit -> Ocgtk_gdk.Gdk.display_t
    method get_parent : unit -> GApplication_and__window_and__window_group.window_t option
    method is_showing : unit -> bool
    method set_display : Ocgtk_gdk.Gdk.display_t -> unit
    method set_parent : GApplication_and__window_and__window_group.window_t option -> unit
    method as_mount_operation : Mount_operation.t
end

class mount_operation : Mount_operation.t -> mount_operation_t


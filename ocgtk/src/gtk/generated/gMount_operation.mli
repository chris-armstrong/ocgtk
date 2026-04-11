class type mount_operation_t = object
    inherit Ocgtk_gio.Gio.Mount_operation.mount_operation_t
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_parent : unit -> GApplication_and__window_and__window_group.window_t option
    method is_showing : unit -> bool
    method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit
    method set_parent : GApplication_and__window_and__window_group.window_t option -> unit
end

class mount_operation : Mount_operation.t -> mount_operation_t

val new_ : GApplication_and__window_and__window_group.window_t option -> mount_operation_t

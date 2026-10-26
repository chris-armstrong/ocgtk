class type mount_operation_t = object
  inherit Ocgio.Mount_operation.mount_operation_t
  method get_display : unit -> Ocgdk.Display.display_t

  method get_parent :
    unit -> Application_and__window_and__window_group.window_t option

  method is_showing : unit -> bool
  method set_display : Ocgdk.Display.display_t -> unit

  method set_parent :
    Application_and__window_and__window_group.window_t option -> unit
end

class mount_operation : Raw.Mount_operation.t -> mount_operation_t

val new_ :
  Application_and__window_and__window_group.window_t option -> mount_operation_t

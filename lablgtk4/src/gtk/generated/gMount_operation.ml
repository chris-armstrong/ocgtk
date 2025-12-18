(* High-level class for MountOperation *)
class mount_operation (obj : Mount_operation.t) = object (self)

  method get_parent : unit -> GApplication_and__window_and__window_group.window option = fun () -> Option.map (fun ret -> new GApplication_and__window_and__window_group.window ret) (Mount_operation.get_parent obj )

  method is_showing : unit -> bool = fun () -> (Mount_operation.is_showing obj )

  method set_parent : 'p1. (#GApplication_and__window_and__window_group.window as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Mount_operation.set_parent obj parent)

    method as_mount_operation = obj
end


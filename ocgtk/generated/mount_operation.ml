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

(* High-level class for MountOperation *)
class mount_operation (obj : Raw.Mount_operation.t) : mount_operation_t =
  object (self)
    inherit
      Ocgio.Mount_operation.mount_operation (obj :> Ocgio.Raw.Mount_operation.t)

    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Mount_operation.get_display obj)

    method get_parent :
        unit -> Application_and__window_and__window_group.window_t option =
      fun () ->
        Option.map
          (fun ret -> new Application_and__window_and__window_group.window ret)
          (Raw.Mount_operation.get_parent obj)

    method is_showing : unit -> bool =
      fun () -> Raw.Mount_operation.is_showing obj

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Mount_operation.set_display obj display

    method set_parent :
        Application_and__window_and__window_group.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Mount_operation.set_parent obj parent
  end

let new_ (parent : Application_and__window_and__window_group.window_t option) :
    mount_operation_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = Raw.Mount_operation.new_ parent in
  new mount_operation obj_

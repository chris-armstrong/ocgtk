class type mount_operation_t = object
  inherit Ocgio.Mount_operation.mount_operation_t

  (** {2:methods Methods} *)

  method get_display : unit -> Ocgdk.Display.display_t
  (** Gets the display on which windows of the [GtkMountOperation] will be
      shown. *)

  method get_parent : unit -> Window.window_t option
  (** Gets the transient parent used by the [GtkMountOperation]. *)

  method is_showing : unit -> bool
  (** Returns whether the [GtkMountOperation] is currently displaying a window.
  *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** Sets the display to show windows of the [GtkMountOperation] on. *)

  method set_parent : Window.window_t option -> unit
  (** Sets the transient parent for windows shown by the [GtkMountOperation]. *)
end

(* High-level class for MountOperation *)
class mount_operation (obj : Raw.Mount_operation.t) : mount_operation_t =
  object (self)
    inherit
      Ocgio.Mount_operation.mount_operation (obj :> Ocgio.Raw.Mount_operation.t)

    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Mount_operation.get_display obj)

    method get_parent : unit -> Window.window_t option =
      fun () ->
        Option.map
          (fun ret -> new Window.window ret)
          (Raw.Mount_operation.get_parent obj)

    method is_showing : unit -> bool =
      fun () -> Raw.Mount_operation.is_showing obj

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Mount_operation.set_display obj display

    method set_parent : Window.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Mount_operation.set_parent obj parent
  end

let new_ (parent : Window.window_t option) : mount_operation_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = Raw.Mount_operation.new_ parent in
  new mount_operation obj_

class type mount_operation_t = object
    inherit Ocgtk_gio.Gio.Mount_operation.mount_operation_t
    method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t
    method get_parent : unit -> GApplication_and__window_and__window_group.window_t option
    method is_showing : unit -> bool
    method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit
    method set_parent : GApplication_and__window_and__window_group.window_t option -> unit
end

(* High-level class for MountOperation *)
class mount_operation (obj : Mount_operation.t) : mount_operation_t = object (self)
  inherit Ocgtk_gio.Gio.Mount_operation.mount_operation (obj :> Ocgtk_gio.Gio.Wrappers.Mount_operation.t)

  method get_display : unit -> Ocgtk_gdk.Gdk.Display.display_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Display.display(Mount_operation.get_display obj)

  method get_parent : unit -> GApplication_and__window_and__window_group.window_t option =
    fun () ->
      Option.map (fun ret -> new GApplication_and__window_and__window_group.window ret) (Mount_operation.get_parent obj)

  method is_showing : unit -> bool =
    fun () ->
      (Mount_operation.is_showing obj)

  method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit =
    fun display ->
      let display = display#as_display in
      (Mount_operation.set_display obj display)

  method set_parent : GApplication_and__window_and__window_group.window_t option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Mount_operation.set_parent obj parent)

end

let new_ (parent : GApplication_and__window_and__window_group.window_t option) : mount_operation_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = Mount_operation.new_ parent in
  new mount_operation obj_


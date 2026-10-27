(** Asks the user for passwords and other information required to mount a
    volume.

    [GtkMountOperation] is needed when mounting volumes: It is an implementation
    of [GMountOperation] that can be used with GIO functions for mounting
    volumes such as [Gio.File.mount_enclosing_volume],
    [Gio.File.mount_mountable], [Gio.Volume.mount],
    [Gio.Mount.unmount_with_operation] and others.

    When necessary, [GtkMountOperation] shows dialogs to let the user enter
    passwords, ask questions or show processes blocking unmount.

    Its methods, signals and properties are on {!class-type-mount_operation_t}.
    The functions it is built on are in {!Ocgtk.Raw.Mount_operation}. *)

(** The methods, signals and properties of a [GtkMountOperation]. *)
class type mount_operation_t = object
  inherit Ocgio.Mount_operation.mount_operation_t

  method get_display : unit -> Ocgdk.Display.display_t
  (** Gets the display on which windows of the [GtkMountOperation] will be
      shown. *)

  method get_parent :
    unit -> Application_and__window_and__window_group.window_t option
  (** Gets the transient parent used by the [GtkMountOperation]. *)

  method is_showing : unit -> bool
  (** Returns whether the [GtkMountOperation] is currently displaying a window.
  *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** Sets the display to show windows of the [GtkMountOperation] on. *)

  method set_parent :
    Application_and__window_and__window_group.window_t option -> unit
  (** Sets the transient parent for windows shown by the [GtkMountOperation]. *)
end

class mount_operation : Raw.Mount_operation.t -> mount_operation_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Mount_operation.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMountOperation], give one already wrapped. *)

val new_ :
  Application_and__window_and__window_group.window_t option -> mount_operation_t

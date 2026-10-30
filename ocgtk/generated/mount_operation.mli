(** Asks the user for passwords and other information required to mount a
    volume.

    Its methods, signals and properties are on {!class-type-mount_operation_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Mount_operation}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MountOperation].}

    Inherits from:
    {{!Ocgio.Mount_operation.class-type-mount_operation_t}Ocgio.Mount_operation}

    Asks the user for passwords and other information required to mount a
    volume.

    [GtkMountOperation] is needed when mounting volumes: It is an implementation
    of [GMountOperation] that can be used with GIO functions for mounting
    volumes such as [Gio.File.mount_enclosing_volume],
    [Gio.File.mount_mountable], [Gio.Volume.mount],
    [Gio.Mount.unmount_with_operation] and others.

    When necessary, [GtkMountOperation] shows dialogs to let the user enter
    passwords, ask questions or show processes blocking unmount. *)
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

class mount_operation : Raw.Mount_operation.t -> mount_operation_t
(** Wraps a raw handle of {!Ocgtk.Raw.Mount_operation.t}. *)

(** {1:description Description}

    Asks the user for passwords and other information required to mount a
    volume.

    [GtkMountOperation] is needed when mounting volumes: It is an implementation
    of [GMountOperation] that can be used with GIO functions for mounting
    volumes such as [Gio.File.mount_enclosing_volume],
    [Gio.File.mount_mountable], [Gio.Volume.mount],
    [Gio.Mount.unmount_with_operation] and others.

    When necessary, [GtkMountOperation] shows dialogs to let the user enter
    passwords, ask questions or show processes blocking unmount. *)

(** {1:constructors Constructors} *)

val new_ : Window.window_t option -> mount_operation_t
(** Creates a new [GtkMountOperation]. *)

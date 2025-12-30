(* GENERATED CODE - DO NOT EDIT *)
(* MountOperation: MountOperation *)

type t = [`mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation | `mount_operation] Gobject.obj

(** Create a new MountOperation *)
external new_ : Application_and__window_and__window_group.Window.t option -> t = "ml_gtk_mount_operation_new"

(* Methods *)
(** Sets the transient parent for windows shown by the
`GtkMountOperation`. *)
external set_parent : t -> Application_and__window_and__window_group.Window.t option -> unit = "ml_gtk_mount_operation_set_parent"

(** Returns whether the `GtkMountOperation` is currently displaying
a window. *)
external is_showing : t -> bool = "ml_gtk_mount_operation_is_showing"

(** Gets the transient parent used by the `GtkMountOperation`. *)
external get_parent : t -> Application_and__window_and__window_group.Window.t option = "ml_gtk_mount_operation_get_parent"

(* Properties *)


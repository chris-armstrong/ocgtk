(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MountOperation *)

type t = Gtk.widget

(** Create a new MountOperation *)
external new_ : Gtk.widget option -> t = "ml_gtk_mount_operation_new"

(* Properties *)

(** Sets the transient parent for windows shown by the
`GtkMountOperation`. *)
external set_parent : t -> Gtk.widget option -> unit = "ml_gtk_mount_operation_set_parent"

(** Returns whether the `GtkMountOperation` is currently displaying
a window. *)
external is_showing : t -> bool = "ml_gtk_mount_operation_is_showing"

(** Gets the transient parent used by the `GtkMountOperation`. *)
external get_parent : t -> Gtk.widget option = "ml_gtk_mount_operation_get_parent"


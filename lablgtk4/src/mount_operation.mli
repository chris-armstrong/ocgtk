(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MountOperation *)

type t = Gtk.widget

(** Create a new MountOperation *)
external new_ : Gtk.widget option -> t = "ml_gtk_mount_operation_new"

(* Properties *)

(** Get property: is-showing *)
external get_is_showing : t -> bool = "ml_gtk_mount_operation_get_is_showing"

external set_parent : t -> Gtk.widget option -> unit = "ml_gtk_mount_operation_set_parent"

external is_showing : t -> bool = "ml_gtk_mount_operation_is_showing"

external get_parent : t -> Gtk.widget = "ml_gtk_mount_operation_get_parent"


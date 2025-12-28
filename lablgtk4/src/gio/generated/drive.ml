(* GENERATED CODE - DO NOT EDIT *)
(* Drive: Drive *)

type t = [`drive] Gobject.obj

(* Methods *)
(** Finishes stopping a drive. *)
external stop_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_drive_stop_finish"

(** Finishes starting a drive. *)
external start_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_drive_start_finish"

(** Finishes an operation started with g_drive_poll_for_media() on a drive. *)
external poll_for_media_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_drive_poll_for_media_finish"

(** Checks if the #GDrive and/or its media is considered removable by the user.
See g_drive_is_media_removable(). *)
external is_removable : t -> bool = "ml_g_drive_is_removable"

(** Checks if the @drive supports removable media. *)
external is_media_removable : t -> bool = "ml_g_drive_is_media_removable"

(** Checks if @drive is capable of automatically detecting media changes. *)
external is_media_check_automatic : t -> bool = "ml_g_drive_is_media_check_automatic"

(** Check if @drive has any mountable volumes. *)
external has_volumes : t -> bool = "ml_g_drive_has_volumes"

(** Checks if the @drive has media. Note that the OS may not be polling
the drive for media changes; see g_drive_is_media_check_automatic()
for more details. *)
external has_media : t -> bool = "ml_g_drive_has_media"

(** Gets the icon for @drive. *)
external get_symbolic_icon : t -> Icon.t = "ml_g_drive_get_symbolic_icon"

(** Gets a hint about how a drive can be started/stopped. *)
external get_start_stop_type : t -> Gio_enums.drivestartstoptype = "ml_g_drive_get_start_stop_type"

(** Gets the sort key for @drive, if any. *)
external get_sort_key : t -> string option = "ml_g_drive_get_sort_key"

(** Gets the name of @drive. *)
external get_name : t -> string = "ml_g_drive_get_name"

(** Gets the identifier of the given kind for @drive. The only
identifier currently available is
%G_DRIVE_IDENTIFIER_KIND_UNIX_DEVICE. *)
external get_identifier : t -> string -> string option = "ml_g_drive_get_identifier"

(** Gets the icon for @drive. *)
external get_icon : t -> Icon.t = "ml_g_drive_get_icon"

(** Finishes ejecting a drive. If any errors occurred during the operation,
@error will be set to contain the errors and %FALSE will be returned. *)
external eject_with_operation_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_drive_eject_with_operation_finish"

(** Finishes ejecting a drive. *)
external eject_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_drive_eject_finish"

(** Checks if a drive can be stopped. *)
external can_stop : t -> bool = "ml_g_drive_can_stop"

(** Checks if a drive can be started degraded. *)
external can_start_degraded : t -> bool = "ml_g_drive_can_start_degraded"

(** Checks if a drive can be started. *)
external can_start : t -> bool = "ml_g_drive_can_start"

(** Checks if a drive can be polled for media changes. *)
external can_poll_for_media : t -> bool = "ml_g_drive_can_poll_for_media"

(** Checks if a drive can be ejected. *)
external can_eject : t -> bool = "ml_g_drive_can_eject"


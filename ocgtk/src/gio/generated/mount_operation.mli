(* GENERATED CODE - DO NOT EDIT *)
(* MountOperation: MountOperation *)

type t = [`mount_operation | `object_] Gobject.obj

(** Create a new MountOperation *)
external new_ : unit -> t = "ml_g_mount_operation_new"

(* Methods *)
(** Sets the user name within @op to @username. *)
external set_username : t -> string option -> unit = "ml_g_mount_operation_set_username"

(** Sets the mount operation's PIM to @pim. *)
external set_pim : t -> int -> unit = "ml_g_mount_operation_set_pim"

(** Sets the state of saving passwords for the mount operation. *)
external set_password_save : t -> Gio_enums.passwordsave -> unit = "ml_g_mount_operation_set_password_save"

(** Sets the mount operation's password to @password. *)
external set_password : t -> string option -> unit = "ml_g_mount_operation_set_password"

(** Sets the mount operation to use a system volume if @system_volume is %TRUE. *)
external set_is_tcrypt_system_volume : t -> bool -> unit = "ml_g_mount_operation_set_is_tcrypt_system_volume"

(** Sets the mount operation to use a hidden volume if @hidden_volume is %TRUE. *)
external set_is_tcrypt_hidden_volume : t -> bool -> unit = "ml_g_mount_operation_set_is_tcrypt_hidden_volume"

(** Sets the mount operation's domain. *)
external set_domain : t -> string option -> unit = "ml_g_mount_operation_set_domain"

(** Sets a default choice for the mount operation. *)
external set_choice : t -> int -> unit = "ml_g_mount_operation_set_choice"

(** Sets the mount operation to use an anonymous user if @anonymous is %TRUE. *)
external set_anonymous : t -> bool -> unit = "ml_g_mount_operation_set_anonymous"

(** Emits the #GMountOperation::reply signal. *)
external reply : t -> Gio_enums.mountoperationresult -> unit = "ml_g_mount_operation_reply"

(** Get the user name from the mount operation. *)
external get_username : t -> string option = "ml_g_mount_operation_get_username"

(** Gets a PIM from the mount operation. *)
external get_pim : t -> int = "ml_g_mount_operation_get_pim"

(** Gets the state of saving passwords for the mount operation. *)
external get_password_save : t -> Gio_enums.passwordsave = "ml_g_mount_operation_get_password_save"

(** Gets a password from the mount operation. *)
external get_password : t -> string option = "ml_g_mount_operation_get_password"

(** Check to see whether the mount operation is being used
for a TCRYPT system volume. *)
external get_is_tcrypt_system_volume : t -> bool = "ml_g_mount_operation_get_is_tcrypt_system_volume"

(** Check to see whether the mount operation is being used
for a TCRYPT hidden volume. *)
external get_is_tcrypt_hidden_volume : t -> bool = "ml_g_mount_operation_get_is_tcrypt_hidden_volume"

(** Gets the domain of the mount operation. *)
external get_domain : t -> string option = "ml_g_mount_operation_get_domain"

(** Gets a choice from the mount operation. *)
external get_choice : t -> int = "ml_g_mount_operation_get_choice"

(** Check to see whether the mount operation is being used
for an anonymous user. *)
external get_anonymous : t -> bool = "ml_g_mount_operation_get_anonymous"

(* Properties *)


(* GENERATED CODE - DO NOT EDIT *)
(* Record: RecentInfo *)

(** `GtkRecentInfo` contains the metadata associated with an item in the
recently used files list. *)
type t = Obj.t

(** Decreases the reference count of @info by one.

If the reference count reaches zero, @info is
deallocated, and the memory freed. *)
external unref : t -> unit = "ml_gtk_recent_info_unref"

(** Increases the reference count of @recent_info by one. *)
external ref : t -> Obj.t = "ml_gtk_recent_info_ref"

(** Checks whether two `GtkRecentInfo` point to the same resource. *)
external match_ : t -> Obj.t -> bool = "ml_gtk_recent_info_match"

(** Checks whether the resource is local or not by looking at the
scheme of its URI. *)
external is_local : t -> bool = "ml_gtk_recent_info_is_local"

(** Checks whether @group_name appears inside the groups
registered for the recently used item @info. *)
external has_group : t -> string -> bool = "ml_gtk_recent_info_has_group"

(** Checks whether an application registered this resource using @app_name. *)
external has_application : t -> string -> bool = "ml_gtk_recent_info_has_application"

(** Gets the URI of the resource. *)
external get_uri : t -> string = "ml_gtk_recent_info_get_uri"

(** Gets the value of the “private” flag.

Resources in the recently used list that have this flag
set to %TRUE should only be displayed by the applications
that have registered them. *)
external get_private_hint : t -> bool = "ml_gtk_recent_info_get_private_hint"

(** Gets the MIME type of the resource. *)
external get_mime_type : t -> string = "ml_gtk_recent_info_get_mime_type"

(** Gets the name of the resource.

If none has been defined, the basename
of the resource is obtained. *)
external get_display_name : t -> string = "ml_gtk_recent_info_get_display_name"

(** Gets the (short) description of the resource. *)
external get_description : t -> string = "ml_gtk_recent_info_get_description"

(** Gets the number of days elapsed since the last update
of the resource pointed by @info. *)
external get_age : t -> int = "ml_gtk_recent_info_get_age"

(** Checks whether the resource pointed by @info still exists.
At the moment this check is done only on resources pointing
to local files. *)
external exists : t -> bool = "ml_gtk_recent_info_exists"


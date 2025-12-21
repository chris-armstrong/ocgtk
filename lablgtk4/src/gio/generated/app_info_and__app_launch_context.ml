(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec App_info : sig
  type t = [`app_info] Gobject.obj

  (* Methods *)
  (** Checks if the application supports reading files and directories from URIs. *)
  external supports_uris : t -> bool = "ml_g_app_info_supports_uris"

  (** Checks if the application accepts files as arguments. *)
  external supports_files : t -> bool = "ml_g_app_info_supports_files"

  (** Checks if the application info should be shown in menus that
  list available applications. *)
  external should_show : t -> bool = "ml_g_app_info_should_show"

  (** Sets the application as the last used application for a given type.
  This will make the application appear as first in the list returned
  by g_app_info_get_recommended_for_type(), regardless of the default
  application for that content type. *)
  external set_as_last_used_for_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_last_used_for_type"

  (** Sets the application as the default handler for a given type. *)
  external set_as_default_for_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_default_for_type"

  (** Removes a supported type from an application, if possible. *)
  external remove_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_remove_supports_type"

  (** Gets the installed name of the application. *)
  external get_name : t -> string = "ml_g_app_info_get_name"

  (** Gets the ID of an application. An id is a string that
  identifies the application. The exact format of the id is
  platform dependent. For instance, on Unix this is the
  desktop file id from the xdg menu specification.

  Note that the returned ID may be %NULL, depending on how
  the @appinfo has been constructed. *)
  external get_id : t -> string option = "ml_g_app_info_get_id"

  (** Gets the display name of the application. The display name is often more
  descriptive to the user than the name itself. *)
  external get_display_name : t -> string = "ml_g_app_info_get_display_name"

  (** Gets a human-readable description of an installed application. *)
  external get_description : t -> string option = "ml_g_app_info_get_description"

  (** Tries to delete a #GAppInfo.

  On some platforms, there may be a difference between user-defined
  #GAppInfos which can be deleted, and system-wide ones which cannot.
  See g_app_info_can_delete(). *)
  external delete : t -> bool = "ml_g_app_info_delete"

  (** Checks if a supported content type can be removed from an application. *)
  external can_remove_supports_type : t -> bool = "ml_g_app_info_can_remove_supports_type"

  (** Obtains the information whether the #GAppInfo can be deleted.
  See g_app_info_delete(). *)
  external can_delete : t -> bool = "ml_g_app_info_can_delete"

  (** Adds a content type to the application information to indicate the
  application is capable of opening files with the given content type. *)
  external add_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_add_supports_type"


end = struct
  type t = [`app_info] Gobject.obj

  (* Methods *)
  (** Checks if the application supports reading files and directories from URIs. *)
  external supports_uris : t -> bool = "ml_g_app_info_supports_uris"

  (** Checks if the application accepts files as arguments. *)
  external supports_files : t -> bool = "ml_g_app_info_supports_files"

  (** Checks if the application info should be shown in menus that
  list available applications. *)
  external should_show : t -> bool = "ml_g_app_info_should_show"

  (** Sets the application as the last used application for a given type.
  This will make the application appear as first in the list returned
  by g_app_info_get_recommended_for_type(), regardless of the default
  application for that content type. *)
  external set_as_last_used_for_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_last_used_for_type"

  (** Sets the application as the default handler for a given type. *)
  external set_as_default_for_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_default_for_type"

  (** Removes a supported type from an application, if possible. *)
  external remove_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_remove_supports_type"

  (** Gets the installed name of the application. *)
  external get_name : t -> string = "ml_g_app_info_get_name"

  (** Gets the ID of an application. An id is a string that
  identifies the application. The exact format of the id is
  platform dependent. For instance, on Unix this is the
  desktop file id from the xdg menu specification.

  Note that the returned ID may be %NULL, depending on how
  the @appinfo has been constructed. *)
  external get_id : t -> string option = "ml_g_app_info_get_id"

  (** Gets the display name of the application. The display name is often more
  descriptive to the user than the name itself. *)
  external get_display_name : t -> string = "ml_g_app_info_get_display_name"

  (** Gets a human-readable description of an installed application. *)
  external get_description : t -> string option = "ml_g_app_info_get_description"

  (** Tries to delete a #GAppInfo.

  On some platforms, there may be a difference between user-defined
  #GAppInfos which can be deleted, and system-wide ones which cannot.
  See g_app_info_can_delete(). *)
  external delete : t -> bool = "ml_g_app_info_delete"

  (** Checks if a supported content type can be removed from an application. *)
  external can_remove_supports_type : t -> bool = "ml_g_app_info_can_remove_supports_type"

  (** Obtains the information whether the #GAppInfo can be deleted.
  See g_app_info_delete(). *)
  external can_delete : t -> bool = "ml_g_app_info_can_delete"

  (** Adds a content type to the application information to indicate the
  application is capable of opening files with the given content type. *)
  external add_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_add_supports_type"


end

and App_launch_context
 : sig
  type t = [`app_launch_context | `object_] Gobject.obj

  (** Create a new AppLaunchContext *)
  external new_ : unit -> t = "ml_g_app_launch_context_new"

  (* Methods *)
  (** Called when an application has failed to launch, so that it can cancel
  the application startup notification started in g_app_launch_context_get_startup_notify_id(). *)
  external launch_failed : t -> string -> unit = "ml_g_app_launch_context_launch_failed"


end = struct
  type t = [`app_launch_context | `object_] Gobject.obj

  (** Create a new AppLaunchContext *)
  external new_ : unit -> t = "ml_g_app_launch_context_new"

  (* Methods *)
  (** Called when an application has failed to launch, so that it can cancel
  the application startup notification started in g_app_launch_context_get_startup_notify_id(). *)
  external launch_failed : t -> string -> unit = "ml_g_app_launch_context_launch_failed"


end

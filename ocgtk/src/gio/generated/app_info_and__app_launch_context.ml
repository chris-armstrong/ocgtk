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

  (** Sets the application as the default handler for the given file extension. *)
  external set_as_default_for_extension : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_default_for_extension"

  (** Removes a supported type from an application, if possible. *)
  external remove_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_remove_supports_type"

  (** Finishes a g_app_info_launch_uris_async() operation. *)
  external launch_uris_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_app_info_launch_uris_finish"

  (** Retrieves the list of content types that @app_info claims to support.
  If this information is not provided by the environment, this function
  will return %NULL.
  This function does not take in consideration associations added with
  g_app_info_add_supports_type(), but only those exported directly by
  the application. *)
  external get_supported_types : t -> string array = "ml_g_app_info_get_supported_types"

  (** Gets the installed name of the application. *)
  external get_name : t -> string = "ml_g_app_info_get_name"

  (** Gets the ID of an application. An id is a string that
  identifies the application. The exact format of the id is
  platform dependent. For instance, on Unix this is the
  desktop file id from the xdg menu specification.

  Note that the returned ID may be %NULL, depending on how
  the @appinfo has been constructed. *)
  external get_id : t -> string option = "ml_g_app_info_get_id"

  (** Gets the icon for the application. *)
  external get_icon : t -> Icon.t option = "ml_g_app_info_get_icon"

  (** Gets the executable's name for the installed application.

  This is intended to be used for debugging or labelling what program is going
  to be run. To launch the executable, use g_app_info_launch() and related
  functions, rather than spawning the return value from this function. *)
  external get_executable : t -> string = "ml_g_app_info_get_executable"

  (** Gets the display name of the application. The display name is often more
  descriptive to the user than the name itself. *)
  external get_display_name : t -> string = "ml_g_app_info_get_display_name"

  (** Gets a human-readable description of an installed application. *)
  external get_description : t -> string option = "ml_g_app_info_get_description"

  (** Gets the commandline with which the application will be
  started. *)
  external get_commandline : t -> string option = "ml_g_app_info_get_commandline"

  (** Checks if two #GAppInfos are equal.

  Note that the check *may not* compare each individual
  field, and only does an identity check. In case detecting changes in the
  contents is needed, program code must additionally compare relevant fields. *)
  external equal : t -> t -> bool = "ml_g_app_info_equal"

  (** Creates a duplicate of a #GAppInfo. *)
  external dup : t -> t = "ml_g_app_info_dup"

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

  (** Sets the application as the default handler for the given file extension. *)
  external set_as_default_for_extension : t -> string -> (bool, GError.t) result = "ml_g_app_info_set_as_default_for_extension"

  (** Removes a supported type from an application, if possible. *)
  external remove_supports_type : t -> string -> (bool, GError.t) result = "ml_g_app_info_remove_supports_type"

  (** Finishes a g_app_info_launch_uris_async() operation. *)
  external launch_uris_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_app_info_launch_uris_finish"

  (** Retrieves the list of content types that @app_info claims to support.
  If this information is not provided by the environment, this function
  will return %NULL.
  This function does not take in consideration associations added with
  g_app_info_add_supports_type(), but only those exported directly by
  the application. *)
  external get_supported_types : t -> string array = "ml_g_app_info_get_supported_types"

  (** Gets the installed name of the application. *)
  external get_name : t -> string = "ml_g_app_info_get_name"

  (** Gets the ID of an application. An id is a string that
  identifies the application. The exact format of the id is
  platform dependent. For instance, on Unix this is the
  desktop file id from the xdg menu specification.

  Note that the returned ID may be %NULL, depending on how
  the @appinfo has been constructed. *)
  external get_id : t -> string option = "ml_g_app_info_get_id"

  (** Gets the icon for the application. *)
  external get_icon : t -> Icon.t option = "ml_g_app_info_get_icon"

  (** Gets the executable's name for the installed application.

  This is intended to be used for debugging or labelling what program is going
  to be run. To launch the executable, use g_app_info_launch() and related
  functions, rather than spawning the return value from this function. *)
  external get_executable : t -> string = "ml_g_app_info_get_executable"

  (** Gets the display name of the application. The display name is often more
  descriptive to the user than the name itself. *)
  external get_display_name : t -> string = "ml_g_app_info_get_display_name"

  (** Gets a human-readable description of an installed application. *)
  external get_description : t -> string option = "ml_g_app_info_get_description"

  (** Gets the commandline with which the application will be
  started. *)
  external get_commandline : t -> string option = "ml_g_app_info_get_commandline"

  (** Checks if two #GAppInfos are equal.

  Note that the check *may not* compare each individual
  field, and only does an identity check. In case detecting changes in the
  contents is needed, program code must additionally compare relevant fields. *)
  external equal : t -> t -> bool = "ml_g_app_info_equal"

  (** Creates a duplicate of a #GAppInfo. *)
  external dup : t -> t = "ml_g_app_info_dup"

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
  (** Arranges for @variable to be unset in the child's environment
  when @context is used to launch an application. *)
  external unsetenv : t -> string -> unit = "ml_g_app_launch_context_unsetenv"

  (** Arranges for @variable to be set to @value in the child's
  environment when @context is used to launch an application. *)
  external setenv : t -> string -> string -> unit = "ml_g_app_launch_context_setenv"

  (** Called when an application has failed to launch, so that it can cancel
  the application startup notification started in g_app_launch_context_get_startup_notify_id(). *)
  external launch_failed : t -> string -> unit = "ml_g_app_launch_context_launch_failed"


end = struct
  type t = [`app_launch_context | `object_] Gobject.obj

  (** Create a new AppLaunchContext *)
  external new_ : unit -> t = "ml_g_app_launch_context_new"

  (* Methods *)
  (** Arranges for @variable to be unset in the child's environment
  when @context is used to launch an application. *)
  external unsetenv : t -> string -> unit = "ml_g_app_launch_context_unsetenv"

  (** Arranges for @variable to be set to @value in the child's
  environment when @context is used to launch an application. *)
  external setenv : t -> string -> string -> unit = "ml_g_app_launch_context_setenv"

  (** Called when an application has failed to launch, so that it can cancel
  the application startup notification started in g_app_launch_context_get_startup_notify_id(). *)
  external launch_failed : t -> string -> unit = "ml_g_app_launch_context_launch_failed"


end

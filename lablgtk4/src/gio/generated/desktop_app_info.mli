(* GENERATED CODE - DO NOT EDIT *)
(* DesktopAppInfo: DesktopAppInfo *)

type t = [`desktop_app_info | `object_] Gobject.obj

(** Create a new DesktopAppInfo *)
external new_ : string -> t = "ml_g_desktop_app_info_new"

(** Create a new DesktopAppInfo *)
external new_from_filename : unit -> t = "ml_g_desktop_app_info_new_from_filename"

(** Create a new DesktopAppInfo *)
external new_from_keyfile : unit -> t = "ml_g_desktop_app_info_new_from_keyfile"

(* Methods *)
(** Activates the named application action.

You may only call this function on action names that were
returned from g_desktop_app_info_list_actions().

Note that if the main entry of the desktop file indicates that the
application supports startup notification, and @launch_context is
non-%NULL, then startup notification will be used when activating the
action (and as such, invocation of the action on the receiving side
must signal the end of startup notification when it is completed).
This is the expected behaviour of applications declaring additional
actions, as per the desktop file specification.

As with g_app_info_launch() there is no way to detect failures that
occur while using this function. *)
external launch_action : t -> string -> App_info_and__app_launch_context.App_launch_context.t option -> unit = "ml_g_desktop_app_info_launch_action"

(** Returns whether @key exists in the "Desktop Entry" group
of the keyfile backing @info. *)
external has_key : t -> string -> bool = "ml_g_desktop_app_info_has_key"

(** Looks up a string value in the keyfile backing @info.

The @key is looked up in the "Desktop Entry" group. *)
external get_string : t -> string -> string option = "ml_g_desktop_app_info_get_string"

(** Retrieves the StartupWMClass field from @info. This represents the
WM_CLASS property of the main window of the application, if launched
through @info. *)
external get_startup_wm_class : t -> string option = "ml_g_desktop_app_info_get_startup_wm_class"

(** Checks if the application info should be shown in menus that list available
applications for a specific name of the desktop, based on the
`OnlyShowIn` and `NotShowIn` keys.

@desktop_env should typically be given as %NULL, in which case the
`XDG_CURRENT_DESKTOP` environment variable is consulted.  If you want
to override the default mechanism then you may specify @desktop_env,
but this is not recommended.

Note that g_app_info_should_show() for @info will include this check (with
%NULL for @desktop_env) as well as additional checks. *)
external get_show_in : t -> string option -> bool = "ml_g_desktop_app_info_get_show_in"

(** Gets the value of the NoDisplay key, which helps determine if the
application info should be shown in menus. See
%G_KEY_FILE_DESKTOP_KEY_NO_DISPLAY and g_app_info_should_show(). *)
external get_nodisplay : t -> bool = "ml_g_desktop_app_info_get_nodisplay"

(** Looks up a localized string value in the keyfile backing @info
translated to the current locale.

The @key is looked up in the "Desktop Entry" group. *)
external get_locale_string : t -> string -> string option = "ml_g_desktop_app_info_get_locale_string"

(** A desktop file is hidden if the Hidden key in it is
set to True. *)
external get_is_hidden : t -> bool = "ml_g_desktop_app_info_get_is_hidden"

(** Gets the generic name from the desktop file. *)
external get_generic_name : t -> string option = "ml_g_desktop_app_info_get_generic_name"

(** Gets the categories from the desktop file. *)
external get_categories : t -> string option = "ml_g_desktop_app_info_get_categories"

(** Looks up a boolean value in the keyfile backing @info.

The @key is looked up in the "Desktop Entry" group. *)
external get_boolean : t -> string -> bool = "ml_g_desktop_app_info_get_boolean"

(** Gets the user-visible display name of the "additional application
action" specified by @action_name.

This corresponds to the "Name" key within the keyfile group for the
action. *)
external get_action_name : t -> string -> string = "ml_g_desktop_app_info_get_action_name"

(* Properties *)


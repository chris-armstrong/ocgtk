(* GENERATED CODE - DO NOT EDIT *)
(* DesktopAppInfoLookup: DesktopAppInfoLookup *)

type t = [`desktop_app_info_lookup] Gobject.obj

(* Methods *)
(** Gets the default application for launching applications
using this URI scheme for a particular #GDesktopAppInfoLookup
implementation.

The #GDesktopAppInfoLookup interface and this function is used
to implement g_app_info_get_default_for_uri_scheme() backends
in a GIO module. There is no reason for applications to use it
directly. Applications should use g_app_info_get_default_for_uri_scheme(). *)
external get_default_for_uri_scheme : t -> string -> App_info_and__app_launch_context.App_info.t option = "ml_g_desktop_app_info_lookup_get_default_for_uri_scheme"


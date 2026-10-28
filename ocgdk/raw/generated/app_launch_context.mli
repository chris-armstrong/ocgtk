(* GENERATED CODE - DO NOT EDIT *)
(* AppLaunchContext, a member of the cyclic module App_launch_context_cycle_de440b34 *)

[@@@ocaml.text
"Handles launching an application in a graphical context.\n\n\
 It is an implementation of [GAppLaunchContext] that provides startup\n\
 notification and allows to launch applications on a specific workspace.\n\n\
 {b Launching an application}\n\n\
 {[\n\
 GdkAppLaunchContext *context;\n\n\
 context = gdk_display_get_app_launch_context (display);\n\n\
 gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));\n\n\
 if (!g_app_info_launch_default_for_uri (\"http://www.gtk.org\", context, \
 &error))\n\
\  g_warning (\"Launching failed: %s\\n\", error->message);\n\n\
 g_object_unref (context);\n\
 ]}\n\n\
 The class built on this module is in {!Ocgdk.App_launch_context}."]

include module type of struct
  include App_launch_context_cycle_de440b34.App_launch_context
end

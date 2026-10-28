(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AppLaunchContext from cyclic group App_launch_context_cycle_de440b34 *)

(** Handles launching an application in a graphical context.

    Its methods, signals and properties are on
    {!class-type-app_launch_context_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgdk.Raw.App_launch_context}. *)

(** {1:class Class} *)

class type app_launch_context_t =
  App_launch_context_cycle_de440b34.app_launch_context_t
  [@@ocaml.doc
    "{b The methods, signals and properties of a [AppLaunchContext].}\n\n\
     Handles launching an application in a graphical context.\n\n\
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
     ]}"]

class app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.App_launch_context.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Handles launching an application in a graphical context.\n\n\
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
 ]}"]

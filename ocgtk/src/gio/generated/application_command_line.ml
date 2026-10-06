(* GENERATED CODE - DO NOT EDIT *)
(* ApplicationCommandLine: ApplicationCommandLine *)

[@@@ocaml.text
"[GApplicationCommandLine] represents a command-line invocation of\n\
 an application.\n\n\
 It is created by [Gio.Application] and emitted\n\
 in the [Gio.Application::command-line] signal and virtual function.\n\n\
 The class contains the list of arguments that the program was invoked\n\
 with. It is also possible to query if the commandline invocation was\n\
 local (ie: the current process is running in direct response to the\n\
 invocation) or remote (ie: some other process forwarded the\n\
 commandline to this process).\n\n\
 The [GApplicationCommandLine] object can provide the [argc] and [argv]\n\
 parameters for use with the [GLib.OptionContext] command-line parsing API,\n\
 with the [Gio.ApplicationCommandLine.get_arguments] function. See\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline3.c}gapplication-example-cmdline3.c}\n\
 for an example.\n\n\
 The exit status of the originally-invoked process may be set and\n\
 messages can be printed to stdout or stderr of that process.\n\n\
 For remote invocation, the originally-invoked process exits when\n\
 [Gio.ApplicationCommandLine.done] method is called. This method is\n\
 also automatically called when the object is disposed.\n\n\
 The main use for [GApplicationCommandLine] (and the\n\
 [Gio.Application::command-line] signal) is 'Emacs server' like use cases:\n\
 You can set the [EDITOR] environment variable to have e.g. git use\n\
 your favourite editor to edit commit messages, and if you already\n\
 have an instance of the editor running, the editing will happen\n\
 in the running instance, instead of opening a new one. An important\n\
 aspect of this use case is that the process that gets started by git\n\
 does not return until the editing is done.\n\n\
 Normally, the commandline is completely handled in the\n\
 [Gio.Application::command-line] handler. The launching instance exits\n\
 once the signal handler in the primary instance has returned, and\n\
 the return value of the signal handler becomes the exit status\n\
 of the launching instance.\n\n\
 {[\n\
 static int\n\
 command_line (GApplication            *application,\n\
\              GApplicationCommandLine *cmdline)\n\
 {\n\
\  gchar **argv;\n\
\  gint argc;\n\
\  gint i;\n\n\
\  argv = g_application_command_line_get_arguments (cmdline, &argc);\n\n\
\  g_application_command_line_print (cmdline,\n\
\                                    \"This text is written back\\n\"\n\
\                                    \"to stdout of the caller\\n\");\n\n\
\  for (i = 0; i < argc; i++)\n\
\    g_print (\"argument %d: %s\\n\", i, argv[i]);\n\n\
\  g_strfreev (argv);\n\n\
\  return 0;\n\
 }\n\
 ]}\n\n\
 The complete example can be found here:\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline.c}gapplication-example-cmdline.c}\n\n\
 In more complicated cases, the handling of the commandline can be\n\
 split between the launcher and the primary instance.\n\n\
 {[\n\
 static gboolean\n\
\ test_local_cmdline (GApplication   *application,\n\
\                     gchar        ***arguments,\n\
\                     gint           *exit_status)\n\
 {\n\
\  gint i, j;\n\
\  gchar **argv;\n\n\
\  argv = *arguments;\n\n\
\  if (argv[0] == NULL)\n\
\    {\n\
\      *exit_status = 0;\n\
\      return FALSE;\n\
\    }\n\n\
\  i = 1;\n\
\  while (argv[i])\n\
\    {\n\
\      if (g_str_has_prefix (argv[i], \"--local-\"))\n\
\        {\n\
\          g_print (\"handling argument %s locally\\n\", argv[i]);\n\
\          g_free (argv[i]);\n\
\          for (j = i; argv[j]; j++)\n\
\            argv[j] = argv[j + 1];\n\
\        }\n\
\      else\n\
\        {\n\
\          g_print (\"not handling argument %s locally\\n\", argv[i]);\n\
\          i++;\n\
\        }\n\
\    }\n\n\
\  *exit_status = 0;\n\n\
\  return FALSE;\n\
 }\n\n\
 static void\n\
 test_application_class_init (TestApplicationClass *class)\n\
 {\n\
\  G_APPLICATION_CLASS (class)->local_command_line = test_local_cmdline;\n\n\
\  ...\n\
 }\n\
 ]}\n\n\
 In this example of split commandline handling, options that start\n\
 with [--local-] are handled locally, all other options are passed\n\
 to the [Gio.Application::command-line] handler which runs in the primary\n\
 instance.\n\n\
 The complete example can be found here:\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c}gapplication-example-cmdline2.c}\n\n\
 If handling the commandline requires a lot of work, it may be better to defer \
 it.\n\n\
 {[\n\
 static gboolean\n\
 my_cmdline_handler (gpointer data)\n\
 {\n\
\  GApplicationCommandLine *cmdline = data;\n\n\
\  // do the heavy lifting in an idle\n\n\
\  g_application_command_line_set_exit_status (cmdline, 0);\n\
\  g_object_unref (cmdline); // this releases the application\n\n\
\  return G_SOURCE_REMOVE;\n\
 }\n\n\
 static int\n\
 command_line (GApplication            *application,\n\
\              GApplicationCommandLine *cmdline)\n\
 {\n\
\  // keep the application running until we are done with this commandline\n\
\  g_application_hold (application);\n\n\
\  g_object_set_data_full (G_OBJECT (cmdline),\n\
\                          \"application\", application,\n\
\                          (GDestroyNotify)g_application_release);\n\n\
\  g_object_ref (cmdline);\n\
\  g_idle_add (my_cmdline_handler, cmdline);\n\n\
\  return 0;\n\
 }\n\
 ]}\n\n\
 In this example the commandline is not completely handled before\n\
 the [Gio.Application::command-line] handler returns. Instead, we keep\n\
 a reference to the [GApplicationCommandLine] object and handle it\n\
 later (in this example, in an idle). Note that it is necessary to\n\
 hold the application until you are done with the commandline.\n\n\
 The complete example can be found here:\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline3.c}gapplication-example-cmdline3.c}"]

type t = [ `application_command_line | `object_ ] Gobject.obj

(* Methods *)

external set_exit_status : t -> int -> unit
  = "ml_g_application_command_line_set_exit_status"
(** Sets the exit status that will be used when the invoking process exits.

    The return value of the [GApplication::command]-line signal is passed to
    this function when the handler returns. This is the usual way of setting the
    exit status.

    In the event that you want the remote invocation to continue running and
    want to decide on the exit status in the future, you can use this call. For
    the case of a remote invocation, the remote process will typically exit when
    the last reference is dropped on [cmdline]. The exit status of the remote
    process will be equal to the last value that was set with this function.

    In the case that the commandline invocation is local, the situation is
    slightly more complicated. If the commandline invocation results in the
    mainloop running (ie: because the use-count of the application increased to
    a non-zero value) then the application is considered to have been
    'successful' in a certain sense, and the exit status is always zero. If the
    application use count is zero, though, the exit status of the local
    [GApplicationCommandLine] is used.

    This method is a no-op if g_application_command_line_done() has been called.
*)

external printerr_literal : t -> string -> unit
  = "ml_g_application_command_line_printerr_literal"
(** Prints a message using the stderr print handler in the invoking process.

    Unlike g_application_command_line_printerr(), [message] is not a
    [printf()]-style format string. Use this function if [message] contains text
    you don't have control over, that could include [printf()] escape sequences.
*)

external print_literal : t -> string -> unit
  = "ml_g_application_command_line_print_literal"
(** Prints a message using the stdout print handler in the invoking process.

    Unlike g_application_command_line_print(), [message] is not a
    [printf()]-style format string. Use this function if [message] contains text
    you don't have control over, that could include [printf()] escape sequences.
*)

external getenv : t -> string -> string option
  = "ml_g_application_command_line_getenv"
(** Gets the value of a particular environment variable of the command line
    invocation, as would be returned by g_getenv(). The strings may contain
    non-utf8 data.

    The remote application usually does not send an environment. Use
    [G_APPLICATION_SEND_ENVIRONMENT] to affect that. Even with this flag set it
    is possible that the environment is still not available (due to invocation
    messages from other applications).

    The return value should not be modified or freed and is valid for as long as
    [cmdline] exists. *)

external get_stdin : t -> Input_stream.t option
  = "ml_g_application_command_line_get_stdin"
(** Gets the stdin of the invoking process.

    The [GInputStream] can be used to read data passed to the standard input of
    the invoking process. This doesn't work on all platforms. Presently, it is
    only available on UNIX when using a D-Bus daemon capable of passing file
    descriptors. If stdin is not available then [NULL] will be returned. In the
    future, support may be expanded to other platforms.

    You must only call this function once per commandline invocation. *)

external get_platform_data : t -> Gvariant.t option
  = "ml_g_application_command_line_get_platform_data"
(** Gets the platform data associated with the invocation of [cmdline].

    This is a [GVariant] dictionary containing information about the context in
    which the invocation occurred. It typically contains information like the
    current working directory and the startup notification ID.

    It comes from an untrusted external process and hence the types of all
    values must be validated before being used.

    For local invocation, it will be [NULL]. *)

external get_is_remote : t -> bool
  = "ml_g_application_command_line_get_is_remote"
(** Determines if [cmdline] represents a remote invocation. *)

external get_exit_status : t -> int
  = "ml_g_application_command_line_get_exit_status"
(** Gets the exit status of [cmdline]. See
    g_application_command_line_set_exit_status() for more information. *)

external get_environ : t -> string array
  = "ml_g_application_command_line_get_environ"
(** Gets the contents of the 'environ' variable of the command line invocation,
    as would be returned by g_get_environ(), ie as a [NULL]-terminated list of
    strings in the form 'NAME=VALUE'. The strings may contain non-utf8 data.

    The remote application usually does not send an environment. Use
    [G_APPLICATION_SEND_ENVIRONMENT] to affect that. Even with this flag set it
    is possible that the environment is still not available (due to invocation
    messages from other applications).

    The return value should not be modified or freed and is valid for as long as
    [cmdline] exists.

    See g_application_command_line_getenv() if you are only interested in the
    value of a single environment variable. *)

external get_cwd : t -> string option = "ml_g_application_command_line_get_cwd"
(** Gets the working directory of the command line invocation. The string may
    contain non-utf8 data.

    It is possible that the remote application did not send a working directory,
    so this may be [NULL].

    The return value should not be modified or freed and is valid for as long as
    [cmdline] exists. *)

external get_arguments : t -> string array * int
  = "ml_g_application_command_line_get_arguments"
(** Gets the list of arguments that was passed on the command line.

    The strings in the array may contain non-UTF-8 data on UNIX (such as
    filenames or arguments given in the system locale) but are always in UTF-8
    on Windows.

    If you wish to use the return value with [GOptionContext], you must use
    g_option_context_parse_strv().

    The return value is [NULL]-terminated and should be freed using
    g_strfreev(). *)

external done_ : t -> unit = "ml_g_application_command_line_done"
(** Signals that command line processing is completed.

    For remote invocation, it causes the invoking process to terminate.

    For local invocation, it does nothing.

    This method should be called in the [Gio.Application::command-line] handler,
    after the exit status is set and all messages are printed.

    After this call, g_application_command_line_set_exit_status() has no effect.
    Subsequent calls to this method are no-ops.

    This method is automatically called when the [GApplicationCommandLine]
    object is disposed — so you can omit the call in non-garbage collected
    languages. *)

external create_file_for_arg : t -> string -> App_info_cycle_64c425a0.File.t
  = "ml_g_application_command_line_create_file_for_arg"
(** Creates a [GFile] corresponding to a filename that was given as part of the
    invocation of [cmdline].

    This differs from g_file_new_for_commandline_arg() in that it resolves
    relative pathnames using the current working directory of the invoking
    process rather than the local process. *)

(* Properties *)

class type application_command_line_t = object
  (** {2:methods Methods} *)

  method create_file_for_arg : string -> App_info_cycle_64c425a0.file_t
  (** Creates a [GFile] corresponding to a filename that was given as part of
      the invocation of [cmdline].

      This differs from g_file_new_for_commandline_arg() in that it resolves
      relative pathnames using the current working directory of the invoking
      process rather than the local process. *)

  method done_ : unit -> unit
  (** Signals that command line processing is completed.

      For remote invocation, it causes the invoking process to terminate.

      For local invocation, it does nothing.

      This method should be called in the [Gio.Application::command-line]
      handler, after the exit status is set and all messages are printed.

      After this call, g_application_command_line_set_exit_status() has no
      effect. Subsequent calls to this method are no-ops.

      This method is automatically called when the [GApplicationCommandLine]
      object is disposed — so you can omit the call in non-garbage collected
      languages. *)

  method get_cwd : unit -> string option
  (** Gets the working directory of the command line invocation. The string may
      contain non-utf8 data.

      It is possible that the remote application did not send a working
      directory, so this may be [NULL].

      The return value should not be modified or freed and is valid for as long
      as [cmdline] exists. *)

  method get_environ : unit -> string array
  (** Gets the contents of the 'environ' variable of the command line
      invocation, as would be returned by g_get_environ(), ie as a
      [NULL]-terminated list of strings in the form 'NAME=VALUE'. The strings
      may contain non-utf8 data.

      The remote application usually does not send an environment. Use
      [G_APPLICATION_SEND_ENVIRONMENT] to affect that. Even with this flag set
      it is possible that the environment is still not available (due to
      invocation messages from other applications).

      The return value should not be modified or freed and is valid for as long
      as [cmdline] exists.

      See g_application_command_line_getenv() if you are only interested in the
      value of a single environment variable. *)

  method get_exit_status : unit -> int
  (** Gets the exit status of [cmdline]. See
      g_application_command_line_set_exit_status() for more information. *)

  method get_is_remote : unit -> bool
  (** Determines if [cmdline] represents a remote invocation. *)

  method get_platform_data : unit -> Gvariant.t option
  (** Gets the platform data associated with the invocation of [cmdline].

      This is a [GVariant] dictionary containing information about the context
      in which the invocation occurred. It typically contains information like
      the current working directory and the startup notification ID.

      It comes from an untrusted external process and hence the types of all
      values must be validated before being used.

      For local invocation, it will be [NULL]. *)

  method get_stdin : unit -> Input_stream.input_stream_t option
  (** Gets the stdin of the invoking process.

      The [GInputStream] can be used to read data passed to the standard input
      of the invoking process. This doesn't work on all platforms. Presently, it
      is only available on UNIX when using a D-Bus daemon capable of passing
      file descriptors. If stdin is not available then [NULL] will be returned.
      In the future, support may be expanded to other platforms.

      You must only call this function once per commandline invocation. *)

  method getenv : string -> string option
  (** Gets the value of a particular environment variable of the command line
      invocation, as would be returned by g_getenv(). The strings may contain
      non-utf8 data.

      The remote application usually does not send an environment. Use
      [G_APPLICATION_SEND_ENVIRONMENT] to affect that. Even with this flag set
      it is possible that the environment is still not available (due to
      invocation messages from other applications).

      The return value should not be modified or freed and is valid for as long
      as [cmdline] exists. *)

  method print_literal : string -> unit
  (** Prints a message using the stdout print handler in the invoking process.

      Unlike g_application_command_line_print(), [message] is not a
      [printf()]-style format string. Use this function if [message] contains
      text you don't have control over, that could include [printf()] escape
      sequences. *)

  method printerr_literal : string -> unit
  (** Prints a message using the stderr print handler in the invoking process.

      Unlike g_application_command_line_printerr(), [message] is not a
      [printf()]-style format string. Use this function if [message] contains
      text you don't have control over, that could include [printf()] escape
      sequences. *)

  method set_exit_status : int -> unit
  (** Sets the exit status that will be used when the invoking process exits.

      The return value of the [GApplication::command]-line signal is passed to
      this function when the handler returns. This is the usual way of setting
      the exit status.

      In the event that you want the remote invocation to continue running and
      want to decide on the exit status in the future, you can use this call.
      For the case of a remote invocation, the remote process will typically
      exit when the last reference is dropped on [cmdline]. The exit status of
      the remote process will be equal to the last value that was set with this
      function.

      In the case that the commandline invocation is local, the situation is
      slightly more complicated. If the commandline invocation results in the
      mainloop running (ie: because the use-count of the application increased
      to a non-zero value) then the application is considered to have been
      'successful' in a certain sense, and the exit status is always zero. If
      the application use count is zero, though, the exit status of the local
      [GApplicationCommandLine] is used.

      This method is a no-op if g_application_command_line_done() has been
      called. *)

  (** {2:conversions Conversions} *)

  method as_application_command_line : Raw.Application_command_line.t
end

(* High-level class for ApplicationCommandLine *)
class application_command_line (obj : Raw.Application_command_line.t) :
  application_command_line_t =
  object (self)
    method create_file_for_arg : string -> App_info_cycle_64c425a0.file_t =
      fun arg ->
        new App_info_cycle_64c425a0.file
          (Raw.Application_command_line.create_file_for_arg obj arg)

    method done_ : unit -> unit =
      fun () -> Raw.Application_command_line.done_ obj

    method get_cwd : unit -> string option =
      fun () -> Raw.Application_command_line.get_cwd obj

    method get_environ : unit -> string array =
      fun () -> Raw.Application_command_line.get_environ obj

    method get_exit_status : unit -> int =
      fun () -> Raw.Application_command_line.get_exit_status obj

    method get_is_remote : unit -> bool =
      fun () -> Raw.Application_command_line.get_is_remote obj

    method get_platform_data : unit -> Gvariant.t option =
      fun () -> Raw.Application_command_line.get_platform_data obj

    method get_stdin : unit -> Input_stream.input_stream_t option =
      fun () ->
        Option.map
          (fun ret -> new Input_stream.input_stream ret)
          (Raw.Application_command_line.get_stdin obj)

    method getenv : string -> string option =
      fun name -> Raw.Application_command_line.getenv obj name

    method print_literal : string -> unit =
      fun message -> Raw.Application_command_line.print_literal obj message

    method printerr_literal : string -> unit =
      fun message -> Raw.Application_command_line.printerr_literal obj message

    method set_exit_status : int -> unit =
      fun exit_status ->
        Raw.Application_command_line.set_exit_status obj exit_status

    method as_application_command_line = obj
  end

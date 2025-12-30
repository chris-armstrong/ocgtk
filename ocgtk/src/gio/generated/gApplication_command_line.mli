class application_command_line : Application_command_line.t ->
  object
    method create_file_for_arg : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file
    method done_ : unit -> unit
    method get_cwd : unit -> string option
    method get_exit_status : unit -> int
    method get_is_remote : unit -> bool
    method get_stdin : unit -> GInput_stream.input_stream option
    method getenv : string -> string option
    method print_literal : string -> unit
    method printerr_literal : string -> unit
    method set_exit_status : int -> unit
    method as_application_command_line : Application_command_line.t
  end


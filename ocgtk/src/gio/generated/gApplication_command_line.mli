class type application_command_line_t = object
    method create_file_for_arg : string -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method done_ : unit -> unit
    method get_cwd : unit -> string option
    method get_environ : unit -> string array
    method get_exit_status : unit -> int
    method get_is_remote : unit -> bool
    method get_platform_data : unit -> Gvariant.t option
    method get_stdin : unit -> GInput_stream.input_stream_t option
    method getenv : string -> string option
    method print_literal : string -> unit
    method printerr_literal : string -> unit
    method set_exit_status : int -> unit
    method as_application_command_line : Application_command_line.t
end

class application_command_line : Application_command_line.t -> application_command_line_t


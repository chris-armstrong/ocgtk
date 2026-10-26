class type application_command_line_t = object
  method create_file_for_arg : string -> App_info_cycle_64c425a0.file_t
  method done_ : unit -> unit
  method get_cwd : unit -> string option
  method get_environ : unit -> string array
  method get_exit_status : unit -> int
  method get_is_remote : unit -> bool
  method get_platform_data : unit -> Gvariant.t option
  method get_stdin : unit -> Input_stream.input_stream_t option
  method getenv : string -> string option
  method print_literal : string -> unit
  method printerr_literal : string -> unit
  method set_exit_status : int -> unit
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

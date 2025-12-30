(* High-level class for ApplicationCommandLine *)
class application_command_line (obj : Application_command_line.t) = object (self)

  method create_file_for_arg : string -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file =
    fun arg ->
      new  GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(Application_command_line.create_file_for_arg obj arg)

  method done_ : unit -> unit =
    fun () ->
      (Application_command_line.done_ obj)

  method get_cwd : unit -> string option =
    fun () ->
      (Application_command_line.get_cwd obj)

  method get_exit_status : unit -> int =
    fun () ->
      (Application_command_line.get_exit_status obj)

  method get_is_remote : unit -> bool =
    fun () ->
      (Application_command_line.get_is_remote obj)

  method get_stdin : unit -> GInput_stream.input_stream option =
    fun () ->
      Option.map (fun ret -> new GInput_stream.input_stream ret) (Application_command_line.get_stdin obj)

  method getenv : string -> string option =
    fun name ->
      (Application_command_line.getenv obj name)

  method print_literal : string -> unit =
    fun message ->
      (Application_command_line.print_literal obj message)

  method printerr_literal : string -> unit =
    fun message ->
      (Application_command_line.printerr_literal obj message)

  method set_exit_status : int -> unit =
    fun exit_status ->
      (Application_command_line.set_exit_status obj exit_status)

    method as_application_command_line = obj
end


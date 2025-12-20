(* High-level class for ApplicationCommandLine *)
class application_command_line (obj : Application_command_line.t) = object (self)

  method done_ : unit -> unit =
    fun () ->
      (Application_command_line.done_ obj)

  method get_exit_status : unit -> int =
    fun () ->
      (Application_command_line.get_exit_status obj)

  method get_is_remote : unit -> bool =
    fun () ->
      (Application_command_line.get_is_remote obj)

  method get_stdin : unit -> GInput_stream.input_stream option =
    fun () ->
      Option.map (fun ret -> new GInput_stream.input_stream ret) (Application_command_line.get_stdin obj)

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


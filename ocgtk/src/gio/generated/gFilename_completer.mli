class filename_completer : Filename_completer.t ->
  object
    inherit Gfilename_completer_signals.filename_completer_signals
    method get_completion_suffix : string -> string option
    method get_completions : string -> string array
    method set_dirs_only : bool -> unit
    method as_filename_completer : Filename_completer.t
  end


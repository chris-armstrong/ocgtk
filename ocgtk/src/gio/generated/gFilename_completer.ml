(* Signal class defined in gfilename_completer_signals.ml *)

class type filename_completer_t = object
    inherit Gfilename_completer_signals.filename_completer_signals
    method get_completion_suffix : string -> string option
    method get_completions : string -> string array
    method set_dirs_only : bool -> unit
    method as_filename_completer : Filename_completer.t
end

(* High-level class for FilenameCompleter *)
class filename_completer (obj : Filename_completer.t) : filename_completer_t = object (self)
  inherit Gfilename_completer_signals.filename_completer_signals obj

  method get_completion_suffix : string -> string option =
    fun initial_text ->
      (Filename_completer.get_completion_suffix obj initial_text)

  method get_completions : string -> string array =
    fun initial_text ->
      (Filename_completer.get_completions obj initial_text)

  method set_dirs_only : bool -> unit =
    fun dirs_only ->
      (Filename_completer.set_dirs_only obj dirs_only)

    method as_filename_completer = obj
end

let new_ () : filename_completer_t =
  new filename_completer (Filename_completer.new_ ())


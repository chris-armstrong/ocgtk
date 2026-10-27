(** Completes partial file and directory names given a partial string by looking
    in the file system for clues. Can return a list of possible completion
    strings for widget implementations.

    Its methods, signals and properties are on
    {!class-type-filename_completer_t}. The functions it is built on are in
    {!Ocgio.Raw.Filename_completer}. *)

(** The methods, signals and properties of a [GFilenameCompleter]. *)
class type filename_completer_t = object
  method on_got_completion_data :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_completion_suffix : string -> string option
  method get_completions : string -> string array
  method set_dirs_only : bool -> unit
  method as_filename_completer : Raw.Filename_completer.t
end

class filename_completer : Raw.Filename_completer.t -> filename_completer_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Filename_completer.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GFilenameCompleter], give one already wrapped. *)

val new_ : unit -> filename_completer_t

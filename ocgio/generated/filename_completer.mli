(** Completes partial file and directory names given a partial string by looking
    in the file system for clues. Can return a list of possible completion
    strings for widget implementations.

    Its methods, signals and properties are on
    {!class-type-filename_completer_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Filename_completer}. *)

(** The methods, signals and properties of a [GFilenameCompleter]. *)
class type filename_completer_t = object
  method on_got_completion_data :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the file name completion information comes available. *)

  method get_completion_suffix : string -> string option
  (** Obtains a suffix completion for [initial_text] from [completer].

      Suffix will be an empty string if there's no shared suffix among matching
      completions. If there's no matching completions anyway, [NULL] is
      returned. *)

  method get_completions : string -> string array
  (** Gets an array of completion strings for a given initial text. *)

  method set_dirs_only : bool -> unit
  (** If [dirs_only] is [TRUE], [completer] will only complete directory names,
      and not file names.

      This function needs to be called before waiting for results from the
      completer to be populated. *)

  method as_filename_completer : Raw.Filename_completer.t
end

class filename_completer : Raw.Filename_completer.t -> filename_completer_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Filename_completer.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GFilenameCompleter], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> filename_completer_t
(** Creates a new filename completer. *)

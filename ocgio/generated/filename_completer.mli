(** Completes partial file and directory names given a partial string by looking
    in the file system for clues. Can return a list of possible completion
    strings for widget implementations.

    Its methods, signals and properties are on
    {!class-type-filename_completer_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Filename_completer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FilenameCompleter].}

    Completes partial file and directory names given a partial string by looking
    in the file system for clues. Can return a list of possible completion
    strings for widget implementations. *)
class type filename_completer_t = object
  (** {2:signals Signals} *)

  method on_got_completion_data :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the file name completion information comes available. *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_filename_completer : Raw.Filename_completer.t
end

class filename_completer : Raw.Filename_completer.t -> filename_completer_t
(** Wraps a raw handle of {!Ocgio.Raw.Filename_completer.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> filename_completer_t
(** Creates a new filename completer. *)

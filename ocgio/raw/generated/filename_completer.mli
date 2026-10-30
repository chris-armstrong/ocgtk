(* GENERATED CODE - DO NOT EDIT *)
(* FilenameCompleter: FilenameCompleter *)

(** Completes partial file and directory names given a partial string by looking
    in the file system for clues. Can return a list of possible completion
    strings for widget implementations.

    The class built on this module is in {!Ocgio.Filename_completer}. *)

type t = [ `filename_completer | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_filename_completer_get_type"

external new_ : unit -> t = "ml_g_filename_completer_new"
(** Creates a new filename completer. *)

(* Methods *)

external set_dirs_only : t -> bool -> unit
  = "ml_g_filename_completer_set_dirs_only"
(** If [dirs_only] is [true], [completer] will only complete directory names,
    and not file names.

    This function needs to be called before waiting for results from the
    completer to be populated. *)

external get_completions : t -> string -> string array
  = "ml_g_filename_completer_get_completions"
(** Gets an array of completion strings for a given initial text. *)

external get_completion_suffix : t -> string -> string option
  = "ml_g_filename_completer_get_completion_suffix"
(** Obtains a suffix completion for [initial_text] from [completer].

    Suffix will be an empty string if there's no shared suffix among matching
    completions. If there's no matching completions anyway, [None] is returned.
*)

val on_got_completion_data :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the file name completion information comes available. *)

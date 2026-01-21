(* GENERATED CODE - DO NOT EDIT *)
(* FilenameCompleter: FilenameCompleter *)

type t = [`filename_completer | `object_] Gobject.obj

(** Create a new FilenameCompleter *)
external new_ : unit -> t = "ml_g_filename_completer_new"

(* Methods *)
(** If @dirs_only is %TRUE, @completer will only
complete directory names, and not file names. *)
external set_dirs_only : t -> bool -> unit = "ml_g_filename_completer_set_dirs_only"

(** Gets an array of completion strings for a given initial text. *)
external get_completions : t -> string -> string array = "ml_g_filename_completer_get_completions"

(** Obtains a completion for @initial_text from @completer. *)
external get_completion_suffix : t -> string -> string option = "ml_g_filename_completer_get_completion_suffix"


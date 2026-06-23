(* GENERATED CODE - DO NOT EDIT *)
(* FilenameCompleter: FilenameCompleter *)

type t = [ `filename_completer | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_g_filename_completer_new"
(** Create a new FilenameCompleter *)

(* Methods *)

external set_dirs_only : t -> bool -> unit
  = "ml_g_filename_completer_set_dirs_only"
(** If @dirs_only is %TRUE, @completer will only
complete directory names, and not file names. *)

external get_completions : t -> string -> string array
  = "ml_g_filename_completer_get_completions"
(** Gets an array of completion strings for a given initial text. *)

external get_completion_suffix : t -> string -> string option
  = "ml_g_filename_completer_get_completion_suffix"
(** Obtains a completion for @initial_text from @completer. *)

let on_got_completion_data ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"got-completion-data" ~callback
    ~after:(Option.value after ~default:false)

class type filename_completer_t = object
  (** {2:signals Signals} *)

  method on_got_completion_data :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the file name completion information comes available. *)

  (** {2:methods Methods} *)

  method get_completion_suffix : string -> string option
  (** Obtains a suffix completion for [initial_text] from [completer].

      Suffix will be an empty string if there's no shared suffix among matching
      completions. If there's no matching completions anyway, [None] is
      returned. *)

  method get_completions : string -> string array
  (** Gets an array of completion strings for a given initial text. *)

  method set_dirs_only : bool -> unit
  (** If [dirs_only] is [true], [completer] will only complete directory names,
      and not file names.

      This function needs to be called before waiting for results from the
      completer to be populated. *)

  (** {2:conversions Conversions} *)

  method as_filename_completer : Raw.Filename_completer.t
end

(* High-level class for FilenameCompleter *)
class filename_completer (obj : Raw.Filename_completer.t) : filename_completer_t
  =
  object (self)
    method on_got_completion_data ?(after = false) ~callback () =
      Raw.Filename_completer.on_got_completion_data ~after
        self#as_filename_completer ~callback

    method get_completion_suffix : string -> string option =
      fun initial_text ->
        Raw.Filename_completer.get_completion_suffix obj initial_text

    method get_completions : string -> string array =
      fun initial_text ->
        Raw.Filename_completer.get_completions obj initial_text

    method set_dirs_only : bool -> unit =
      fun dirs_only -> Raw.Filename_completer.set_dirs_only obj dirs_only

    method as_filename_completer = obj
  end

let new_ () : filename_completer_t =
  new filename_completer (Raw.Filename_completer.new_ ())

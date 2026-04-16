(* Signal handlers for FilenameCompleter *)
class filename_completer_signals (obj : Filename_completer.t) =
  object
    method on_got_completion_data ~callback =
      Gobject.Signal.connect_simple obj ~name:"got-completion-data" ~callback
        ~after:false
    (** Emitted when the file name completion information comes available. *)
  end

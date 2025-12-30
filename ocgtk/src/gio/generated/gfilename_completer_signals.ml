(* Signal handlers for FilenameCompleter *)
class filename_completer_signals (obj : Filename_completer.t) = object
  (** Emitted when the file name completion information comes available. *)
  method on_got_completion_data ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"got-completion-data" ~callback ~after:false

end

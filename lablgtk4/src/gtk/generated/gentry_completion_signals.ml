(* Signal handlers for EntryCompletion *)
class entry_completion_signals (obj : Entry_completion.t) = object
  (** Emitted when the filter model has zero
number of rows in completion_complete method.

In other words when `GtkEntryCompletion` is out of suggestions. *)
  method on_no_matches ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"no-matches" ~callback ~after:false

end

(* Signal handlers for EntryCompletion *)
class entry_completion_signals (obj : Entry_completion.t) = object
  method on_cursor_on_match ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cursor-on-match" ~callback ~after:false

  method on_insert_prefix ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-prefix" ~callback ~after:false

  method on_match_selected ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"match-selected" ~callback ~after:false

  method on_no_matches ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"no-matches" ~callback ~after:false

end

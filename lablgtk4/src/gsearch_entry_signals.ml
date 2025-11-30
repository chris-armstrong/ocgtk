(* Signal handlers for SearchEntry *)
class search_entry_signals (obj : Search_entry.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method next_match ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"next-match" ~callback ~after:false

  method previous_match ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"previous-match" ~callback ~after:false

  method search_changed ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"search-changed" ~callback ~after:false

  method search_started ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"search-started" ~callback ~after:false

  method stop_search ~callback =
    Gobject.Signal.connect_simple (Search_entry.as_widget obj :> [`widget] Gobject.obj) ~name:"stop-search" ~callback ~after:false

end

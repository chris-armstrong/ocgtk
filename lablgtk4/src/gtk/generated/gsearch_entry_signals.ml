(* Signal handlers for SearchEntry *)
class search_entry_signals (obj : Search_entry.t) = object
  (** Emitted when the entry is activated.

The keybindings for this signal are all forms of the Enter key. *)
  method on_activate ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  (** Emitted when the user initiates a move to the next match
for the current search string.

This is a [keybinding signal](class.SignalAction.html).

Applications should connect to it, to implement moving
between matches.

The default bindings for this signal is Ctrl-g. *)
  method on_next_match ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"next-match" ~callback ~after:false

  (** Emitted when the user initiates a move to the previous match
for the current search string.

This is a [keybinding signal](class.SignalAction.html).

Applications should connect to it, to implement moving
between matches.

The default bindings for this signal is Ctrl-Shift-g. *)
  method on_previous_match ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"previous-match" ~callback ~after:false

  (** Emitted with a delay. The length of the delay can be
changed with the [property@Gtk.SearchEntry:search-delay]
property. *)
  method on_search_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search-changed" ~callback ~after:false

  (** Emitted when the user initiated a search on the entry. *)
  method on_search_started ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search-started" ~callback ~after:false

  (** Emitted when the user stops a search via keyboard input.

This is a [keybinding signal](class.SignalAction.html).

Applications should connect to it, to implement hiding
the search entry in this case.

The default bindings for this signal is Escape. *)
  method on_stop_search ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"stop-search" ~callback ~after:false

end

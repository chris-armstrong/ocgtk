(* Signal handlers for FileChooserWidget *)
class file_chooser_widget_signals (obj : File_chooser_widget.t) = object
  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser show the user's Desktop
folder in the file list.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>. *)
  method on_desktop_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"desktop-folder" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser go to a child of the
current folder in the file hierarchy. The subfolder that will
be used is displayed in the path bar widget of the file chooser.
For example, if the path bar is showing "/foo/bar/baz", with bar
currently displayed, then this will cause the file chooser to
switch to the "baz" subfolder.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>Down</kbd>. *)
  method on_down_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"down-folder" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser show the user's home
folder in the file list.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>. *)
  method on_home_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"home-folder" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser show a "Location" prompt
when the user pastes into a `GtkFileChooserWidget`.

The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>. *)
  method on_location_popup_on_paste ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"location-popup-on-paste" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to toggle the visibility of a "Location" prompt
which the user can use to manually type the name of the file
he wishes to select.

The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>. *)
  method on_location_toggle_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"location-toggle-popup" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to move the focus to the places sidebar.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>. *)
  method on_places_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"places-shortcut" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser show the Recent location.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>. *)
  method on_recent_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"recent-shortcut" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser show the search entry.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>. *)
  method on_search_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search-shortcut" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser display hidden files.

The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>. *)
  method on_show_hidden ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"show-hidden" ~callback ~after:false

  (** Emitted when the user asks for it.

This is a [keybinding signal](class.SignalAction.html).

This is used to make the file chooser go to the parent
of the current folder in the file hierarchy.

The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>. *)
  method on_up_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"up-folder" ~callback ~after:false

end

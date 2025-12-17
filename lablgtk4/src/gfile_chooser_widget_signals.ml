(* Signal handlers for FileChooserWidget *)
class file_chooser_widget_signals (obj : File_chooser_widget.t) = object
  method on_desktop_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"desktop-folder" ~callback ~after:false

  method on_down_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"down-folder" ~callback ~after:false

  method on_home_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"home-folder" ~callback ~after:false

  method on_location_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"location-popup" ~callback ~after:false

  method on_location_popup_on_paste ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"location-popup-on-paste" ~callback ~after:false

  method on_location_toggle_popup ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"location-toggle-popup" ~callback ~after:false

  method on_places_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"places-shortcut" ~callback ~after:false

  method on_quick_bookmark ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"quick-bookmark" ~callback ~after:false

  method on_recent_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"recent-shortcut" ~callback ~after:false

  method on_search_shortcut ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"search-shortcut" ~callback ~after:false

  method on_show_hidden ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"show-hidden" ~callback ~after:false

  method on_up_folder ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"up-folder" ~callback ~after:false

end

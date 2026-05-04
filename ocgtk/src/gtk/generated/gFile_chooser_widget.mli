class type file_chooser_widget_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GFile_chooser.file_chooser_t

  method on_desktop_folder :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_down_folder : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_home_folder : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_location_popup :
    callback:(path:string -> unit) -> Gobject.Signal.handler_id

  method on_location_popup_on_paste :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_location_toggle_popup :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_places_shortcut :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_quick_bookmark :
    callback:(bookmark_index:int -> unit) -> Gobject.Signal.handler_id

  method on_recent_shortcut :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_search_shortcut :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_show_hidden : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_up_folder : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method search_mode : bool
  method set_search_mode : bool -> unit
  method show_time : bool
  method subtitle : string
  method as_file_chooser_widget : File_chooser_widget.t
end

class file_chooser_widget : File_chooser_widget.t -> file_chooser_widget_t

val new_ : Gtk_enums.filechooseraction -> file_chooser_widget_t

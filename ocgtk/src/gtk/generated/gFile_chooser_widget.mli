class type file_chooser_widget_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit GFile_chooser.file_chooser_t

  method on_desktop_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_down_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_home_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_location_popup :
    ?after:bool ->
    callback:(path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_location_popup_on_paste :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_location_toggle_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_places_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_quick_bookmark :
    ?after:bool ->
    callback:(bookmark_index:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_recent_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_search_shortcut :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_show_hidden :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_up_folder :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method search_mode : bool
  method set_search_mode : bool -> unit
  method show_time : bool
  method subtitle : string
  method as_file_chooser_widget : File_chooser_widget.t
end

class file_chooser_widget : File_chooser_widget.t -> file_chooser_widget_t

val new_ : Gtk_enums.filechooseraction -> file_chooser_widget_t

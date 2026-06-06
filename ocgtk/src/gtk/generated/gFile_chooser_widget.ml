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

(* High-level class for FileChooserWidget *)
class file_chooser_widget (obj : File_chooser_widget.t) : file_chooser_widget_t
  =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
             .Widget
             .t)

    inherit GFile_chooser.file_chooser (File_chooser.from_gobject obj)

    method on_desktop_folder ?(after = false) ~callback () =
      File_chooser_widget.on_desktop_folder ~after self#as_file_chooser_widget
        ~callback

    method on_down_folder ?(after = false) ~callback () =
      File_chooser_widget.on_down_folder ~after self#as_file_chooser_widget
        ~callback

    method on_home_folder ?(after = false) ~callback () =
      File_chooser_widget.on_home_folder ~after self#as_file_chooser_widget
        ~callback

    method on_location_popup ?(after = false) ~callback () =
      File_chooser_widget.on_location_popup ~after self#as_file_chooser_widget
        ~callback

    method on_location_popup_on_paste ?(after = false) ~callback () =
      File_chooser_widget.on_location_popup_on_paste ~after
        self#as_file_chooser_widget ~callback

    method on_location_toggle_popup ?(after = false) ~callback () =
      File_chooser_widget.on_location_toggle_popup ~after
        self#as_file_chooser_widget ~callback

    method on_places_shortcut ?(after = false) ~callback () =
      File_chooser_widget.on_places_shortcut ~after self#as_file_chooser_widget
        ~callback

    method on_quick_bookmark ?(after = false) ~callback () =
      File_chooser_widget.on_quick_bookmark ~after self#as_file_chooser_widget
        ~callback

    method on_recent_shortcut ?(after = false) ~callback () =
      File_chooser_widget.on_recent_shortcut ~after self#as_file_chooser_widget
        ~callback

    method on_search_shortcut ?(after = false) ~callback () =
      File_chooser_widget.on_search_shortcut ~after self#as_file_chooser_widget
        ~callback

    method on_show_hidden ?(after = false) ~callback () =
      File_chooser_widget.on_show_hidden ~after self#as_file_chooser_widget
        ~callback

    method on_up_folder ?(after = false) ~callback () =
      File_chooser_widget.on_up_folder ~after self#as_file_chooser_widget
        ~callback

    method search_mode = File_chooser_widget.get_search_mode obj
    method set_search_mode v = File_chooser_widget.set_search_mode obj v
    method show_time = File_chooser_widget.get_show_time obj
    method subtitle = File_chooser_widget.get_subtitle obj
    method as_file_chooser_widget = obj
  end

let new_ (action : Gtk_enums.filechooseraction) : file_chooser_widget_t =
  let obj_ = File_chooser_widget.new_ action in
  new file_chooser_widget obj_

class type file_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit File_chooser.file_chooser_t

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
  method as_file_chooser_widget : Raw.File_chooser_widget.t
end

(* High-level class for FileChooserWidget *)
class file_chooser_widget (obj : Raw.File_chooser_widget.t) :
  file_chooser_widget_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit File_chooser.file_chooser (Raw.File_chooser.from_gobject obj)

    method on_desktop_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_desktop_folder ~after
        self#as_file_chooser_widget ~callback

    method on_down_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_down_folder ~after self#as_file_chooser_widget
        ~callback

    method on_home_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_home_folder ~after self#as_file_chooser_widget
        ~callback

    method on_location_popup ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_popup ~after
        self#as_file_chooser_widget ~callback

    method on_location_popup_on_paste ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_popup_on_paste ~after
        self#as_file_chooser_widget ~callback

    method on_location_toggle_popup ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_location_toggle_popup ~after
        self#as_file_chooser_widget ~callback

    method on_places_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_places_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_quick_bookmark ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_quick_bookmark ~after
        self#as_file_chooser_widget ~callback

    method on_recent_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_recent_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_search_shortcut ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_search_shortcut ~after
        self#as_file_chooser_widget ~callback

    method on_show_hidden ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_show_hidden ~after self#as_file_chooser_widget
        ~callback

    method on_up_folder ?(after = false) ~callback () =
      Raw.File_chooser_widget.on_up_folder ~after self#as_file_chooser_widget
        ~callback

    method search_mode = Raw.File_chooser_widget.get_search_mode obj
    method set_search_mode v = Raw.File_chooser_widget.set_search_mode obj v
    method show_time = Raw.File_chooser_widget.get_show_time obj
    method subtitle = Raw.File_chooser_widget.get_subtitle obj
    method as_file_chooser_widget = obj
  end

let new_ (action : Enums.filechooseraction) : file_chooser_widget_t =
  let obj_ = Raw.File_chooser_widget.new_ action in
  new file_chooser_widget obj_

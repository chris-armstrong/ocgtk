(* High-level class for SearchBar *)
class search_bar (obj : Search_bar.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Search_bar.as_widget obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Search_bar.get_child obj)

  method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Search_bar.get_key_capture_widget obj)

  method get_search_mode : unit -> bool =
    fun () ->
      (Search_bar.get_search_mode obj)

  method get_show_close_button : unit -> bool =
    fun () ->
      (Search_bar.get_show_close_button obj)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Search_bar.set_child obj child)

  method set_key_capture_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Search_bar.set_key_capture_widget obj widget)

  method set_search_mode : bool -> unit =
    fun search_mode ->
      (Search_bar.set_search_mode obj search_mode)

  method set_show_close_button : bool -> unit =
    fun visible ->
      (Search_bar.set_show_close_button obj visible)

  method search_mode_enabled = Search_bar.get_search_mode_enabled obj
  method set_search_mode_enabled v =  Search_bar.set_search_mode_enabled obj v

  method as_widget = (Search_bar.as_widget obj)
    method as_search_bar = obj
end


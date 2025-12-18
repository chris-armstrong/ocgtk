(* Signal class defined in gassistant_signals.ml *)

(* High-level class for Assistant *)
class assistant (obj : Assistant.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Assistant.as_widget obj)
  inherit Gassistant_signals.assistant_signals obj

  method use_header_bar = Assistant.get_use_header_bar obj

  method add_action_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Assistant.add_action_widget obj child)

  method append_page : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int =
    fun page ->
      let page = page#as_widget in
      (Assistant.append_page obj page)

  method commit : unit -> unit = fun () -> (Assistant.commit obj )

  method get_current_page : unit -> int = fun () -> (Assistant.get_current_page obj )

  method get_n_pages : unit -> int = fun () -> (Assistant.get_n_pages obj )

  method get_nth_page : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun page_num -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Assistant.get_nth_page obj page_num)

  method get_page : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> GAssistant_page.assistant_page =
    fun child ->
      let child = child#as_widget in
      new  GAssistant_page.assistant_page(Assistant.get_page obj child)

  method get_page_complete : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun page ->
      let page = page#as_widget in
      (Assistant.get_page_complete obj page)

  method get_page_title : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string =
    fun page ->
      let page = page#as_widget in
      (Assistant.get_page_title obj page)

  method get_page_type : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> Gtk_enums.assistantpagetype =
    fun page ->
      let page = page#as_widget in
      (Assistant.get_page_type obj page)

  method insert_page : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> int =
    fun page position ->
      let page = page#as_widget in
      (Assistant.insert_page obj page position)

  method next_page : unit -> unit = fun () -> (Assistant.next_page obj )

  method prepend_page : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int =
    fun page ->
      let page = page#as_widget in
      (Assistant.prepend_page obj page)

  method previous_page : unit -> unit = fun () -> (Assistant.previous_page obj )

  method remove_action_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Assistant.remove_action_widget obj child)

  method remove_page : int -> unit = fun page_num -> (Assistant.remove_page obj page_num)

  method set_current_page : int -> unit = fun page_num -> (Assistant.set_current_page obj page_num)

  method set_page_complete : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool -> unit =
    fun page complete ->
      let page = page#as_widget in
      (Assistant.set_page_complete obj page complete)

  method set_page_title : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string -> unit =
    fun page title ->
      let page = page#as_widget in
      (Assistant.set_page_title obj page title)

  method set_page_type : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> Gtk_enums.assistantpagetype -> unit =
    fun page type_ ->
      let page = page#as_widget in
      (Assistant.set_page_type obj page type_)

  method update_buttons_state : unit -> unit = fun () -> (Assistant.update_buttons_state obj )

  method as_widget = (Assistant.as_widget obj)
    method as_assistant = obj
end


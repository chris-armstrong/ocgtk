class type assistant_t = object
  inherit GApplication_and__window_and__window_group.window_t
  method on_apply : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_cancel : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_close : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_escape : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method add_action_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method append_page :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int

  method commit : unit -> unit
  method get_current_page : unit -> int
  method get_n_pages : unit -> int

  method get_nth_page :
    int ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_page :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    GAssistant_page.assistant_page_t

  method get_page_complete :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    bool

  method get_page_title :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    string

  method get_page_type :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    Gtk_enums.assistantpagetype

  method get_pages : unit -> Ocgtk_gio.Gio.List_model.list_model_t

  method insert_page :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int ->
    int

  method next_page : unit -> unit

  method prepend_page :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int

  method previous_page : unit -> unit

  method remove_action_widget :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove_page : int -> unit
  method set_current_page : int -> unit

  method set_page_complete :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    bool ->
    unit

  method set_page_title :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    string ->
    unit

  method set_page_type :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    Gtk_enums.assistantpagetype ->
    unit

  method update_buttons_state : unit -> unit
  method use_header_bar : int
  method as_assistant : Assistant.t
end

(* High-level class for Assistant *)
class assistant (obj : Assistant.t) : assistant_t =
  object (self)
    inherit
      GApplication_and__window_and__window_group.window
        (obj :> Application_and__window_and__window_group.Window.t)

    method on_apply ~callback = Assistant.on_apply self#as_assistant ~callback
    method on_cancel ~callback = Assistant.on_cancel self#as_assistant ~callback
    method on_close ~callback = Assistant.on_close self#as_assistant ~callback
    method on_escape ~callback = Assistant.on_escape self#as_assistant ~callback

    method add_action_widget :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Assistant.add_action_widget obj child

    method append_page :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Assistant.append_page obj page

    method commit : unit -> unit = fun () -> Assistant.commit obj

    method get_current_page : unit -> int =
      fun () -> Assistant.get_current_page obj

    method get_n_pages : unit -> int = fun () -> Assistant.get_n_pages obj

    method get_nth_page :
        int ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun page_num ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Assistant.get_nth_page obj page_num)

    method get_page :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        GAssistant_page.assistant_page_t =
      fun child ->
        let child = child#as_widget in
        new GAssistant_page.assistant_page (Assistant.get_page obj child)

    method get_page_complete :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        bool =
      fun page ->
        let page = page#as_widget in
        Assistant.get_page_complete obj page

    method get_page_title :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        string =
      fun page ->
        let page = page#as_widget in
        Assistant.get_page_title obj page

    method get_page_type :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        Gtk_enums.assistantpagetype =
      fun page ->
        let page = page#as_widget in
        Assistant.get_page_type obj page

    method get_pages : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
      fun () ->
        new Ocgtk_gio.Gio.List_model.list_model (Assistant.get_pages obj)

    method insert_page :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        int ->
        int =
      fun page position ->
        let page = page#as_widget in
        Assistant.insert_page obj page position

    method next_page : unit -> unit = fun () -> Assistant.next_page obj

    method prepend_page :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Assistant.prepend_page obj page

    method previous_page : unit -> unit = fun () -> Assistant.previous_page obj

    method remove_action_widget :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Assistant.remove_action_widget obj child

    method remove_page : int -> unit =
      fun page_num -> Assistant.remove_page obj page_num

    method set_current_page : int -> unit =
      fun page_num -> Assistant.set_current_page obj page_num

    method set_page_complete :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        bool ->
        unit =
      fun page complete ->
        let page = page#as_widget in
        Assistant.set_page_complete obj page complete

    method set_page_title :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        string ->
        unit =
      fun page title ->
        let page = page#as_widget in
        Assistant.set_page_title obj page title

    method set_page_type :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        Gtk_enums.assistantpagetype ->
        unit =
      fun page type_ ->
        let page = page#as_widget in
        Assistant.set_page_type obj page type_

    method update_buttons_state : unit -> unit =
      fun () -> Assistant.update_buttons_state obj

    method use_header_bar = Assistant.get_use_header_bar obj
    method as_assistant = obj
  end

let new_ () : assistant_t = new assistant (Assistant.new_ ())

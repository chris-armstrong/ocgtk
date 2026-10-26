class type assistant_t = object
  inherit Application_and__window_and__window_group.window_t

  method on_apply :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_cancel :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_close :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_escape :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_prepare :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method commit : unit -> unit
  method get_current_page : unit -> int
  method get_n_pages : unit -> int

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Assistant_page.assistant_page_t

  method get_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method get_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string

  method get_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype

  method get_pages : unit -> Ocgio.List_model.list_model_t

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int

  method next_page : unit -> unit

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method previous_page : unit -> unit

  method remove_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_page : int -> unit
  method set_current_page : int -> unit

  method set_page_complete :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method set_page_title :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_page_type :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.assistantpagetype ->
    unit

  method update_buttons_state : unit -> unit
  method use_header_bar : int
  method as_assistant : Raw.Assistant.t
end

(* High-level class for Assistant *)
class assistant (obj : Raw.Assistant.t) : assistant_t =
  object (self)
    inherit
      Application_and__window_and__window_group.window (obj :> Raw.Window.t)

    method on_apply ?(after = false) ~callback () =
      Raw.Assistant.on_apply ~after self#as_assistant ~callback

    method on_cancel ?(after = false) ~callback () =
      Raw.Assistant.on_cancel ~after self#as_assistant ~callback

    method on_close ?(after = false) ~callback () =
      Raw.Assistant.on_close ~after self#as_assistant ~callback

    method on_escape ?(after = false) ~callback () =
      Raw.Assistant.on_escape ~after self#as_assistant ~callback

    method on_prepare ?(after = false) ~callback () =
      Raw.Assistant.on_prepare ~after self#as_assistant ~callback:(fun ~page ->
          callback
            ~page:
              (new
                 Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
                 .widget
                 page))

    method add_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Assistant.add_action_widget obj child

    method append_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.append_page obj page

    method commit : unit -> unit = fun () -> Raw.Assistant.commit obj

    method get_current_page : unit -> int =
      fun () -> Raw.Assistant.get_current_page obj

    method get_n_pages : unit -> int = fun () -> Raw.Assistant.get_n_pages obj

    method get_nth_page :
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun page_num ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Assistant.get_nth_page obj page_num)

    method get_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Assistant_page.assistant_page_t =
      fun child ->
        let child = child#as_widget in
        new Assistant_page.assistant_page (Raw.Assistant.get_page obj child)

    method get_page_complete :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_complete obj page

    method get_page_title :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_title obj page

    method get_page_type :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.assistantpagetype =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.get_page_type obj page

    method get_pages : unit -> Ocgio.List_model.list_model_t =
      fun () -> new Ocgio.List_model.list_model (Raw.Assistant.get_pages obj)

    method insert_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        int =
      fun page position ->
        let page = page#as_widget in
        Raw.Assistant.insert_page obj page position

    method next_page : unit -> unit = fun () -> Raw.Assistant.next_page obj

    method prepend_page :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int =
      fun page ->
        let page = page#as_widget in
        Raw.Assistant.prepend_page obj page

    method previous_page : unit -> unit =
      fun () -> Raw.Assistant.previous_page obj

    method remove_action_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Assistant.remove_action_widget obj child

    method remove_page : int -> unit =
      fun page_num -> Raw.Assistant.remove_page obj page_num

    method set_current_page : int -> unit =
      fun page_num -> Raw.Assistant.set_current_page obj page_num

    method set_page_complete :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun page complete ->
        let page = page#as_widget in
        Raw.Assistant.set_page_complete obj page complete

    method set_page_title :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        unit =
      fun page title ->
        let page = page#as_widget in
        Raw.Assistant.set_page_title obj page title

    method set_page_type :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.assistantpagetype ->
        unit =
      fun page type_ ->
        let page = page#as_widget in
        Raw.Assistant.set_page_type obj page type_

    method update_buttons_state : unit -> unit =
      fun () -> Raw.Assistant.update_buttons_state obj

    method use_header_bar = Raw.Assistant.get_use_header_bar obj
    method as_assistant = obj
  end

let new_ () : assistant_t = new assistant (Raw.Assistant.new_ ())

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

class assistant : Raw.Assistant.t -> assistant_t

val new_ : unit -> assistant_t

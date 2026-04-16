class type assistant_t = object
  inherit GApplication_and__window_and__window_group.window_t
  inherit Gassistant_signals.assistant_signals

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

class assistant : Assistant.t -> assistant_t

val new_ : unit -> assistant_t

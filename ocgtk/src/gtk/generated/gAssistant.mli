class assistant : Assistant.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gassistant_signals.assistant_signals
    method add_action_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method append_page : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int
    method commit : unit -> unit
    method get_current_page : unit -> int
    method get_n_pages : unit -> int
    method get_nth_page : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_page : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> GAssistant_page.assistant_page
    method get_page_complete : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
    method get_page_title : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string
    method get_page_type : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> Gtk_enums.assistantpagetype
    method insert_page : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> int
    method next_page : unit -> unit
    method prepend_page : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int
    method previous_page : unit -> unit
    method remove_action_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove_page : int -> unit
    method set_current_page : int -> unit
    method set_page_complete : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool -> unit
    method set_page_title : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string -> unit
    method set_page_type : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> Gtk_enums.assistantpagetype -> unit
    method update_buttons_state : unit -> unit
    method use_header_bar : int
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_assistant : Assistant.t
  end


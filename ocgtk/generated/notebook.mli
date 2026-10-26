class type notebook_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_change_current_page :
    ?after:bool ->
    callback:(page:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_create_window :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      notebook_t option) ->
    unit ->
    Gobject.Signal.handler_id

  method on_focus_tab :
    ?after:bool ->
    callback:(tab:Enums.notebooktab -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_added :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_removed :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_page_reordered :
    ?after:bool ->
    callback:
      (child:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_reorder_tab :
    ?after:bool ->
    callback:(direction:Enums.directiontype -> move_to_last:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_page :
    ?after:bool ->
    callback:(move_focus:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_switch_page :
    ?after:bool ->
    callback:
      (page:
         Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
         .widget_t ->
      page_num:int ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method append_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method detach_tab :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_action_widget :
    Enums.packtype ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_current_page : unit -> int
  method get_group_name : unit -> string option

  method get_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option

  method get_n_pages : unit -> int

  method get_nth_page :
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Notebook_page.notebook_page_t

  method get_pages : unit -> Ocgio.List_model.list_model_t
  method get_scrollable : unit -> bool
  method get_show_border : unit -> bool
  method get_show_tabs : unit -> bool

  method get_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method get_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string option

  method get_tab_pos : unit -> Enums.positiontype

  method get_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool

  method insert_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int ->
    int

  method insert_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int ->
    int

  method next_page : unit -> unit

  method page_num :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int

  method popup_disable : unit -> unit
  method popup_enable : unit -> unit

  method prepend_page :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method prepend_page_menu :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    int

  method prev_page : unit -> unit
  method remove_page : int -> unit

  method reorder_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method set_action_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.packtype ->
    unit

  method set_current_page : int -> unit
  method set_group_name : string option -> unit

  method set_menu_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_menu_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_scrollable : bool -> unit
  method set_show_border : bool -> unit
  method set_show_tabs : bool -> unit

  method set_tab_detachable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method set_tab_label :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_tab_label_text :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    unit

  method set_tab_pos : Enums.positiontype -> unit

  method set_tab_reorderable :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit

  method enable_popup : bool
  method set_enable_popup : bool -> unit
  method as_notebook : Raw.Notebook.t
end

class notebook : Raw.Notebook.t -> notebook_t

val new_ : unit -> notebook_t

class type notebook_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gnotebook_signals.notebook_signals
    method append_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method append_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method detach_tab : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_action_widget : Gtk_enums.packtype -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_current_page : unit -> int
    method get_group_name : unit -> string option
    method get_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option
    method get_n_pages : unit -> int
    method get_nth_page : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GNotebook_page.notebook_page_t
    method get_pages : unit -> Ocgtk_gio.Gio.list_model_t
    method get_scrollable : unit -> bool
    method get_show_border : unit -> bool
    method get_show_tabs : unit -> bool
    method get_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method get_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option
    method get_tab_pos : unit -> Gtk_enums.positiontype
    method get_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method insert_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int
    method insert_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int -> int
    method next_page : unit -> unit
    method page_num : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int
    method popup_disable : unit -> unit
    method popup_enable : unit -> unit
    method prepend_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method prepend_page_menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> int
    method prev_page : unit -> unit
    method remove_page : int -> unit
    method reorder_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method set_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gtk_enums.packtype -> unit
    method set_current_page : int -> unit
    method set_group_name : string option -> unit
    method set_menu_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_menu_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit
    method set_scrollable : bool -> unit
    method set_show_border : bool -> unit
    method set_show_tabs : bool -> unit
    method set_tab_detachable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method set_tab_label : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_tab_label_text : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string -> unit
    method set_tab_pos : Gtk_enums.positiontype -> unit
    method set_tab_reorderable : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method enable_popup : bool
    method set_enable_popup : bool -> unit
    method as_notebook : Notebook.t
end

class notebook : Notebook.t -> notebook_t


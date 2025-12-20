class notebook_page : Notebook_page.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method detachable : bool
    method set_detachable : bool -> unit
    method menu : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method menu_label : string
    method set_menu_label : string -> unit
    method position : int
    method set_position : int -> unit
    method reorderable : bool
    method set_reorderable : bool -> unit
    method tab : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method tab_expand : bool
    method set_tab_expand : bool -> unit
    method tab_fill : bool
    method set_tab_fill : bool -> unit
    method tab_label : string
    method set_tab_label : string -> unit
    method as_notebook_page : Notebook_page.t
  end


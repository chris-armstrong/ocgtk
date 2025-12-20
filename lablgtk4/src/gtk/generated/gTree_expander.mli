class tree_expander : Tree_expander.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_hide_expander : unit -> bool
    method get_indent_for_depth : unit -> bool
    method get_indent_for_icon : unit -> bool
    method get_list_row : unit -> GTree_list_row.tree_list_row option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_hide_expander : bool -> unit
    method set_indent_for_depth : bool -> unit
    method set_indent_for_icon : bool -> unit
    method set_list_row : #GTree_list_row.tree_list_row option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_tree_expander : Tree_expander.t
  end


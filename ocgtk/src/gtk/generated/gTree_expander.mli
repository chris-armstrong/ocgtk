class type tree_expander_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_hide_expander : unit -> bool
    method get_indent_for_depth : unit -> bool
    method get_indent_for_icon : unit -> bool
    method get_list_row : unit -> GTree_list_row.tree_list_row_t option
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_hide_expander : bool -> unit
    method set_indent_for_depth : bool -> unit
    method set_indent_for_icon : bool -> unit
    method set_list_row : GTree_list_row.tree_list_row_t option -> unit
    method as_tree_expander : Tree_expander.t
end

class tree_expander : Tree_expander.t -> tree_expander_t

val new_ : unit -> tree_expander_t

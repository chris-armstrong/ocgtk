(* High-level class for TreeExpander *)
class tree_expander (obj : Tree_expander.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Tree_expander.as_widget obj)

  method hide_expander = Tree_expander.get_hide_expander obj
  method set_hide_expander v = Tree_expander.set_hide_expander obj v

  method indent_for_depth = Tree_expander.get_indent_for_depth obj
  method set_indent_for_depth v = Tree_expander.set_indent_for_depth obj v

  method indent_for_icon = Tree_expander.get_indent_for_icon obj
  method set_indent_for_icon v = Tree_expander.set_indent_for_icon obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Tree_expander.get_child obj )

  method get_list_row : unit -> GTree_list_row.tree_list_row option = fun () -> Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_expander.get_list_row obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Tree_expander.set_child obj child)

  method set_list_row : 'p1. (#GTree_list_row.tree_list_row as 'p1) option -> unit = fun list_row -> (Tree_expander.set_list_row obj ( list_row |> Option.map (fun x -> x#as_tree_list_row) ))

  method as_widget = (Tree_expander.as_widget obj)
    method as_tree_expander = obj
end


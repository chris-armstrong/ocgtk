class type tree_expander_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_hide_expander : unit -> bool
  method get_indent_for_depth : unit -> bool
  method get_indent_for_icon : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_list_row : unit -> GTree_list_row.tree_list_row_t option

  method set_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_hide_expander : bool -> unit
  method set_indent_for_depth : bool -> unit
  method set_indent_for_icon : bool -> unit
  method set_list_row : GTree_list_row.tree_list_row_t option -> unit
  method as_tree_expander : Tree_expander.t
end

(* High-level class for TreeExpander *)
class tree_expander (obj : Tree_expander.t) : tree_expander_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method get_child :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Tree_expander.get_child obj)

    method get_hide_expander : unit -> bool =
      fun () -> Tree_expander.get_hide_expander obj

    method get_indent_for_depth : unit -> bool =
      fun () -> Tree_expander.get_indent_for_depth obj

    method get_indent_for_icon : unit -> bool =
      fun () -> Tree_expander.get_indent_for_icon obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Tree_expander.get_item obj

    method get_list_row : unit -> GTree_list_row.tree_list_row_t option =
      fun () ->
        Option.map
          (fun ret -> new GTree_list_row.tree_list_row ret)
          (Tree_expander.get_list_row obj)

    method set_child :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Tree_expander.set_child obj child

    method set_hide_expander : bool -> unit =
      fun hide_expander -> Tree_expander.set_hide_expander obj hide_expander

    method set_indent_for_depth : bool -> unit =
      fun indent_for_depth ->
        Tree_expander.set_indent_for_depth obj indent_for_depth

    method set_indent_for_icon : bool -> unit =
      fun indent_for_icon ->
        Tree_expander.set_indent_for_icon obj indent_for_icon

    method set_list_row : GTree_list_row.tree_list_row_t option -> unit =
      fun list_row ->
        let list_row = Option.map (fun c -> c#as_tree_list_row) list_row in
        Tree_expander.set_list_row obj list_row

    method as_tree_expander = obj
  end

let new_ () : tree_expander_t = new tree_expander (Tree_expander.new_ ())

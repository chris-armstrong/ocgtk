class list_item : List_item.t ->
  object
    method accessible_description : string
    method set_accessible_description : string -> unit
    method accessible_label : string
    method set_accessible_label : string -> unit
    method activatable : bool
    method set_activatable : bool -> unit
    method focusable : bool
    method set_focusable : bool -> unit
    method position : int
    method selectable : bool
    method set_selectable : bool -> unit
    method selected : bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_list_item : List_item.t
  end


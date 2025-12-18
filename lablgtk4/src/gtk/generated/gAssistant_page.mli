class assistant_page : Assistant_page.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method as_assistant_page : Assistant_page.t
  end


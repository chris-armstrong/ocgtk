(* High-level class for NotebookPage *)
class notebook_page (obj : Notebook_page.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Notebook_page.get_child obj )

    method as_notebook_page = obj
end


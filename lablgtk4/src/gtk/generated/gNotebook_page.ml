(* High-level class for NotebookPage *)
class notebook_page (obj : Notebook_page.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Notebook_page.get_child obj)

  method detachable = Notebook_page.get_detachable obj
  method set_detachable v =  Notebook_page.set_detachable obj v

  method menu = new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Notebook_page.get_menu obj)

  method menu_label = Notebook_page.get_menu_label obj
  method set_menu_label v =  Notebook_page.set_menu_label obj v

  method position = Notebook_page.get_position obj
  method set_position v =  Notebook_page.set_position obj v

  method reorderable = Notebook_page.get_reorderable obj
  method set_reorderable v =  Notebook_page.set_reorderable obj v

  method tab = new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Notebook_page.get_tab obj)

  method tab_expand = Notebook_page.get_tab_expand obj
  method set_tab_expand v =  Notebook_page.set_tab_expand obj v

  method tab_fill = Notebook_page.get_tab_fill obj
  method set_tab_fill v =  Notebook_page.set_tab_fill obj v

  method tab_label = Notebook_page.get_tab_label obj
  method set_tab_label v =  Notebook_page.set_tab_label obj v

    method as_notebook_page = obj
end


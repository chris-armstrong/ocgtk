(* High-level class for AssistantPage *)
class assistant_page (obj : Assistant_page.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Assistant_page.get_child obj)

  method complete = Assistant_page.get_complete obj
  method set_complete v =  Assistant_page.set_complete obj v

  method page_type = Assistant_page.get_page_type obj
  method set_page_type v =  Assistant_page.set_page_type obj v

  method title = Assistant_page.get_title obj
  method set_title v =  Assistant_page.set_title obj v

    method as_assistant_page = obj
end


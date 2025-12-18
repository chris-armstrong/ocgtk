(* High-level class for AssistantPage *)
class assistant_page (obj : Assistant_page.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Assistant_page.get_child obj )

    method as_assistant_page = obj
end


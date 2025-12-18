(* High-level class for StackPage *)
class stack_page (obj : Stack_page.t) = object (self)

  method icon_name = Stack_page.get_icon_name obj
  method set_icon_name v = Stack_page.set_icon_name obj v

  method name = Stack_page.get_name obj
  method set_name v = Stack_page.set_name obj v

  method needs_attention = Stack_page.get_needs_attention obj
  method set_needs_attention v = Stack_page.set_needs_attention obj v

  method title = Stack_page.get_title obj
  method set_title v = Stack_page.set_title obj v

  method use_underline = Stack_page.get_use_underline obj
  method set_use_underline v = Stack_page.set_use_underline obj v

  method visible = Stack_page.get_visible obj
  method set_visible v = Stack_page.set_visible obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Stack_page.get_child obj )

    method as_stack_page = obj
end


(* High-level class for StackPage *)
class stack_page (obj : Stack_page.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Stack_page.get_child obj )

  method get_icon_name : unit -> string option = fun () -> (Stack_page.get_icon_name obj )

  method get_name : unit -> string option = fun () -> (Stack_page.get_name obj )

  method get_needs_attention : unit -> bool = fun () -> (Stack_page.get_needs_attention obj )

  method get_title : unit -> string option = fun () -> (Stack_page.get_title obj )

  method get_use_underline : unit -> bool = fun () -> (Stack_page.get_use_underline obj )

  method get_visible : unit -> bool = fun () -> (Stack_page.get_visible obj )

  method set_icon_name : string -> unit = fun setting -> (Stack_page.set_icon_name obj setting)

  method set_name : string -> unit = fun setting -> (Stack_page.set_name obj setting)

  method set_needs_attention : bool -> unit = fun setting -> (Stack_page.set_needs_attention obj setting)

  method set_title : string -> unit = fun setting -> (Stack_page.set_title obj setting)

  method set_use_underline : bool -> unit = fun setting -> (Stack_page.set_use_underline obj setting)

  method set_visible : bool -> unit = fun visible -> (Stack_page.set_visible obj visible)

    method as_stack_page = obj
end


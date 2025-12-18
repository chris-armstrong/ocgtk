class stack_page : Stack_page.t ->
  object
    method icon_name : string
    method set_icon_name : string -> unit
    method name : string
    method set_name : string -> unit
    method needs_attention : bool
    method set_needs_attention : bool -> unit
    method title : string
    method set_title : string -> unit
    method use_underline : bool
    method set_use_underline : bool -> unit
    method visible : bool
    method set_visible : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method as_stack_page : Stack_page.t
  end


class stack_page : Stack_page.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_icon_name : unit -> string option
    method get_name : unit -> string option
    method get_needs_attention : unit -> bool
    method get_title : unit -> string option
    method get_use_underline : unit -> bool
    method get_visible : unit -> bool
    method set_icon_name : string -> unit
    method set_name : string -> unit
    method set_needs_attention : bool -> unit
    method set_title : string -> unit
    method set_use_underline : bool -> unit
    method set_visible : bool -> unit
    method as_stack_page : Stack_page.t
  end


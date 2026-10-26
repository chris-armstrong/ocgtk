class type header_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_decoration_layout : unit -> string option
  method get_show_title_buttons : unit -> bool

  method get_title_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_use_native_controls : unit -> bool

  method pack_end :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method pack_start :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method set_decoration_layout : string option -> unit
  method set_show_title_buttons : bool -> unit

  method set_title_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_use_native_controls : bool -> unit
  method as_header_bar : Raw.Header_bar.t
end

class header_bar : Raw.Header_bar.t -> header_bar_t

val new_ : unit -> header_bar_t

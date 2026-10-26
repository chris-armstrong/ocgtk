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

(* High-level class for HeaderBar *)
class header_bar (obj : Raw.Header_bar.t) : header_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_decoration_layout : unit -> string option =
      fun () -> Raw.Header_bar.get_decoration_layout obj

    method get_show_title_buttons : unit -> bool =
      fun () -> Raw.Header_bar.get_show_title_buttons obj

    method get_title_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Header_bar.get_title_widget obj)

    method get_use_native_controls : unit -> bool =
      fun () -> Raw.Header_bar.get_use_native_controls obj

    method pack_end :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.pack_end obj child

    method pack_start :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.pack_start obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Header_bar.remove obj child

    method set_decoration_layout : string option -> unit =
      fun layout -> Raw.Header_bar.set_decoration_layout obj layout

    method set_show_title_buttons : bool -> unit =
      fun setting -> Raw.Header_bar.set_show_title_buttons obj setting

    method set_title_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun title_widget ->
        let title_widget = Option.map (fun c -> c#as_widget) title_widget in
        Raw.Header_bar.set_title_widget obj title_widget

    method set_use_native_controls : bool -> unit =
      fun setting -> Raw.Header_bar.set_use_native_controls obj setting

    method as_header_bar = obj
  end

let new_ () : header_bar_t = new header_bar (Raw.Header_bar.new_ ())

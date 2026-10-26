class type search_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method connect_entry : Editable.editable_t -> unit

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_key_capture_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_search_mode : unit -> bool
  method get_show_close_button : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_key_capture_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_search_mode : bool -> unit
  method set_show_close_button : bool -> unit
  method as_search_bar : Raw.Search_bar.t
end

(* High-level class for SearchBar *)
class search_bar (obj : Raw.Search_bar.t) : search_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method connect_entry : Editable.editable_t -> unit =
      fun entry ->
        let entry = entry#as_editable in
        Raw.Search_bar.connect_entry obj entry

    method get_child :
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
          (Raw.Search_bar.get_child obj)

    method get_key_capture_widget :
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
          (Raw.Search_bar.get_key_capture_widget obj)

    method get_search_mode : unit -> bool =
      fun () -> Raw.Search_bar.get_search_mode obj

    method get_show_close_button : unit -> bool =
      fun () -> Raw.Search_bar.get_show_close_button obj

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Search_bar.set_child obj child

    method set_key_capture_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Search_bar.set_key_capture_widget obj widget

    method set_search_mode : bool -> unit =
      fun search_mode -> Raw.Search_bar.set_search_mode obj search_mode

    method set_show_close_button : bool -> unit =
      fun visible -> Raw.Search_bar.set_show_close_button obj visible

    method as_search_bar = obj
  end

let new_ () : search_bar_t = new search_bar (Raw.Search_bar.new_ ())

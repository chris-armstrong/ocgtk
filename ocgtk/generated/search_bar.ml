class type search_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method connect_entry : Editable.editable_t -> unit
  (** Connects the [GtkEditable] widget passed as the one to be used in this
      search bar.

      The entry should be a descendant of the search bar. Calling this function
      manually is only required if the entry isn’t the direct child of the
      search bar (as in our main example). *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [bar]. *)

  method get_key_capture_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the widget that [bar] is capturing key events from. *)

  method get_search_mode : unit -> bool
  (** Returns whether the search mode is on or off. *)

  method get_show_close_button : unit -> bool
  (** Returns whether the close button is shown. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [bar]. *)

  method set_key_capture_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets [widget] as the widget that [bar] will capture key events from.

      If key events are handled by the search bar, the bar will be shown, and
      the entry populated with the entered text.

      Note that despite the name of this function, the events are only
      'captured' in the bubble phase, which means that editable child widgets of
      [widget] will receive text input before it gets captured. If that is not
      desired, you can capture and forward the events yourself with
      [Gtk.EventControllerKey.forward]. *)

  method set_search_mode : bool -> unit
  (** Switches the search mode on or off. *)

  method set_show_close_button : bool -> unit
  (** Shows or hides the close button.

      Applications that already have a “search” toggle button should not show a
      close button in their search bar, as it duplicates the role of the toggle
      button. *)

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

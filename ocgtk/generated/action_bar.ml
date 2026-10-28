class type action_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the center bar widget of the bar. *)

  method get_revealed : unit -> bool
  (** Gets whether the contents of the action bar are revealed. *)

  method pack_end :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds a child to the action bar, packed with reference to the end of the
      action bar. *)

  method pack_start :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds a child to the action, packed with reference to the start of the
      action bar. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from the action bar. *)

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the center widget for the action bar. *)

  method set_revealed : bool -> unit
  (** Reveals or conceals the content of the action bar.

      Note: this does not show or hide the action bar in the
      [Gtk.Widget:visible] sense, so revealing has no effect if the action bar
      is hidden. *)

  (** {2:conversions Conversions} *)

  method as_action_bar : Raw.Action_bar.t
end

(* High-level class for ActionBar *)
class action_bar (obj : Raw.Action_bar.t) : action_bar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_center_widget :
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
          (Raw.Action_bar.get_center_widget obj)

    method get_revealed : unit -> bool =
      fun () -> Raw.Action_bar.get_revealed obj

    method pack_end :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.pack_end obj child

    method pack_start :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.pack_start obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.remove obj child

    method set_center_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun center_widget ->
        let center_widget = Option.map (fun c -> c#as_widget) center_widget in
        Raw.Action_bar.set_center_widget obj center_widget

    method set_revealed : bool -> unit =
      fun revealed -> Raw.Action_bar.set_revealed obj revealed

    method as_action_bar = obj
  end

let new_ () : action_bar_t = new action_bar (Raw.Action_bar.new_ ())

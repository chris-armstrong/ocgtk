class type overlay_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method add_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Adds [widget] to [overlay].

      The widget will be stacked on top of the main widget added with
      [Gtk.Overlay.set_child].

      The position at which [widget] is placed is determined from its
      [Gtk.Widget:halign] and [Gtk.Widget:valign] properties. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [overlay]. *)

  method get_clip_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Gets whether [widget] should be clipped within the parent. *)

  method get_measure_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Gets whether [widget]'s size is included in the measurement of [overlay].
  *)

  method remove_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes an overlay that was added with gtk_overlay_add_overlay(). *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [overlay]. *)

  method set_clip_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit
  (** Sets whether [widget] should be clipped within the parent. *)

  method set_measure_overlay :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool ->
    unit
  (** Sets whether [widget] is included in the measured size of [overlay].

      The overlay will request the size of the largest child that has this
      property set to [TRUE]. Children who are not included may be drawn outside
      of [overlay]'s allocation if they are too large. *)

  method as_overlay : Raw.Overlay.t
end

(* High-level class for Overlay *)
class overlay (obj : Raw.Overlay.t) : overlay_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method add_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Overlay.add_overlay obj widget

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
          (Raw.Overlay.get_child obj)

    method get_clip_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Overlay.get_clip_overlay obj widget

    method get_measure_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Overlay.get_measure_overlay obj widget

    method remove_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Overlay.remove_overlay obj widget

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Overlay.set_child obj child

    method set_clip_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun widget clip_overlay ->
        let widget = widget#as_widget in
        Raw.Overlay.set_clip_overlay obj widget clip_overlay

    method set_measure_overlay :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool ->
        unit =
      fun widget measure ->
        let widget = widget#as_widget in
        Raw.Overlay.set_measure_overlay obj widget measure

    method as_overlay = obj
  end

let new_ () : overlay_t = new overlay (Raw.Overlay.new_ ())

class type fixed_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_child_transform :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgsk.Transform.transform_t option
  (** Retrieves the transformation for [widget] set using
      gtk_fixed_set_child_transform(). *)

  method move :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    float ->
    float ->
    unit
  (** Sets a translation transformation to the given [x] and [y] coordinates to
      the child [widget] of the [GtkFixed]. *)

  method put :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    float ->
    float ->
    unit
  (** Adds a widget to a [GtkFixed] at the given position. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [fixed]. *)

  method set_child_transform :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgsk.Transform.transform_t option ->
    unit
  (** Sets the transformation for [widget].

      This is a convenience function that retrieves the [Gtk.FixedLayoutChild]
      instance associated to [widget] and calls
      [Gtk.FixedLayoutChild.set_transform]. *)

  (** {2:conversions Conversions} *)

  method as_fixed : Raw.Fixed.t
end

(* High-level class for Fixed *)
class fixed (obj : Raw.Fixed.t) : fixed_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_child_transform :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Ocgsk.Transform.transform_t option =
      fun widget ->
        let widget = widget#as_widget in
        Option.map
          (fun ret -> new Ocgsk.Transform.transform ret)
          (Raw.Fixed.get_child_transform obj widget)

    method move :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        float ->
        float ->
        unit =
      fun widget x y ->
        let widget = widget#as_widget in
        Raw.Fixed.move obj widget x y

    method put :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        float ->
        float ->
        unit =
      fun widget x y ->
        let widget = widget#as_widget in
        Raw.Fixed.put obj widget x y

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Fixed.remove obj widget

    method set_child_transform :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Ocgsk.Transform.transform_t option ->
        unit =
      fun widget transform ->
        let widget = widget#as_widget in
        let transform = Option.map (fun c -> c#as_transform) transform in
        Raw.Fixed.set_child_transform obj widget transform

    method as_fixed = obj
  end

let new_ () : fixed_t = new fixed (Raw.Fixed.new_ ())

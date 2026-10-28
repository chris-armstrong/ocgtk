class type aspect_frame_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [self]. *)

  method get_obey_child : unit -> bool
  (** Returns whether the child's size request should override the set aspect
      ratio of the [GtkAspectFrame]. *)

  method get_ratio : unit -> float
  (** Returns the desired aspect ratio of the child. *)

  method get_xalign : unit -> float
  (** Returns the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method get_yalign : unit -> float
  (** Returns the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [self]. *)

  method set_obey_child : bool -> unit
  (** Sets whether the aspect ratio of the child's size request should override
      the set aspect ratio of the [GtkAspectFrame]. *)

  method set_ratio : float -> unit
  (** Sets the desired aspect ratio of the child. *)

  method set_xalign : float -> unit
  (** Sets the horizontal alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  method set_yalign : float -> unit
  (** Sets the vertical alignment of the child within the allocation of the
      [GtkAspectFrame]. *)

  (** {2:conversions Conversions} *)

  method as_aspect_frame : Raw.Aspect_frame.t
end

(* High-level class for AspectFrame *)
class aspect_frame (obj : Raw.Aspect_frame.t) : aspect_frame_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

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
          (Raw.Aspect_frame.get_child obj)

    method get_obey_child : unit -> bool =
      fun () -> Raw.Aspect_frame.get_obey_child obj

    method get_ratio : unit -> float = fun () -> Raw.Aspect_frame.get_ratio obj

    method get_xalign : unit -> float =
      fun () -> Raw.Aspect_frame.get_xalign obj

    method get_yalign : unit -> float =
      fun () -> Raw.Aspect_frame.get_yalign obj

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Aspect_frame.set_child obj child

    method set_obey_child : bool -> unit =
      fun obey_child -> Raw.Aspect_frame.set_obey_child obj obey_child

    method set_ratio : float -> unit =
      fun ratio -> Raw.Aspect_frame.set_ratio obj ratio

    method set_xalign : float -> unit =
      fun xalign -> Raw.Aspect_frame.set_xalign obj xalign

    method set_yalign : float -> unit =
      fun yalign -> Raw.Aspect_frame.set_yalign obj yalign

    method as_aspect_frame = obj
  end

let new_ (xalign : float) (yalign : float) (ratio : float) (obey_child : bool) :
    aspect_frame_t =
  let obj_ = Raw.Aspect_frame.new_ xalign yalign ratio obey_child in
  new aspect_frame obj_

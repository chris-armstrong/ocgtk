class type graphics_offload_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_black_background : unit -> bool
  (** Returns whether the widget draws a black background.

      See [Gtk.GraphicsOffload.set_black_background]. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child of [self]. *)

  method get_enabled : unit -> Enums.graphicsoffloadenabled
  (** Returns whether offload is enabled for [self]. *)

  method set_black_background : bool -> unit
  (** Sets whether this GtkGraphicsOffload widget will draw a black background.

      A main use case for this is {b _letterboxing_} where black bars are
      visible next to the content if the aspect ratio of the content does not
      match the dimensions of the monitor.

      Using this property for letterboxing instead of CSS allows compositors to
      show content with maximum efficiency, using direct scanout to avoid extra
      copies in the compositor.

      On Wayland, this is implemented using the
      {{:https://wayland.app/protocols/single-pixel-buffer-v1}single-pixel
       buffer} protocol. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child of [self]. *)

  method set_enabled : Enums.graphicsoffloadenabled -> unit
  (** Sets whether this GtkGraphicsOffload widget will attempt to offload the
      content of its child widget. *)

  method as_graphics_offload : Raw.Graphics_offload.t
end

(* High-level class for GraphicsOffload *)
class graphics_offload (obj : Raw.Graphics_offload.t) : graphics_offload_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_black_background : unit -> bool =
      fun () -> Raw.Graphics_offload.get_black_background obj

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
          (Raw.Graphics_offload.get_child obj)

    method get_enabled : unit -> Enums.graphicsoffloadenabled =
      fun () -> Raw.Graphics_offload.get_enabled obj

    method set_black_background : bool -> unit =
      fun value -> Raw.Graphics_offload.set_black_background obj value

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Graphics_offload.set_child obj child

    method set_enabled : Enums.graphicsoffloadenabled -> unit =
      fun enabled -> Raw.Graphics_offload.set_enabled obj enabled

    method as_graphics_offload = obj
  end

let new_
    (child :
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget_t
      option) : graphics_offload_t =
  let child = Option.map (fun c -> c#as_widget) child in
  let obj_ = Raw.Graphics_offload.new_ child in
  new graphics_offload obj_

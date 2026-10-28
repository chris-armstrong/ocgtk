class type scrolled_window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_edge_overshot :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever user initiated scrolling makes the scrolled window firmly
      surpass the limits defined by the adjustment in that orientation.

      A similar behavior without edge resistance is provided by the
      [Gtk.ScrolledWindow::edge-reached] signal.

      Note: The [pos] argument is LTR/RTL aware, so callers should be aware too
      if intending to provide behavior on horizontal edges. *)

  method on_edge_reached :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever user-initiated scrolling makes the scrolled window
      exactly reach the lower or upper limits defined by the adjustment in that
      orientation.

      A similar behavior with edge resistance is provided by the
      [Gtk.ScrolledWindow::edge-overshot] signal.

      Note: The [pos] argument is LTR/RTL aware, so callers should be aware too
      if intending to provide behavior on horizontal edges. *)

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction_type:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when focus is moved away from the scrolled window by a keybinding.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>Tab</kbd> to
      move forward and <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Tab</kbd>` to move
      backward. *)

  method on_scroll_child :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> horizontal:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a keybinding that scrolls is pressed.

      This is a keybinding signal.

      The horizontal or vertical adjustment is updated which triggers a signal
      that the scrolled window’s child may listen to and scroll itself. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [scrolled_window].

      If the scrolled window automatically added a [Gtk.Viewport], this function
      will return the viewport widget, and you can retrieve its child using
      [Gtk.Viewport.get_child]. *)

  method get_hadjustment : unit -> Adjustment.adjustment_t
  (** Returns the horizontal scrollbar’s adjustment.

      This is the adjustment used to connect the horizontal scrollbar to the
      child widget’s horizontal scroll functionality. *)

  method get_has_frame : unit -> bool
  (** Gets whether the scrolled window draws a frame. *)

  method get_hscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the horizontal scrollbar of [scrolled_window]. *)

  method get_kinetic_scrolling : unit -> bool
  (** Returns the specified kinetic scrolling behavior. *)

  method get_max_content_height : unit -> int
  (** Returns the maximum content height set. *)

  method get_max_content_width : unit -> int
  (** Returns the maximum content width set. *)

  method get_min_content_height : unit -> int
  (** Gets the minimal content height of [scrolled_window]. *)

  method get_min_content_width : unit -> int
  (** Gets the minimum content width of [scrolled_window]. *)

  method get_overlay_scrolling : unit -> bool
  (** Returns whether overlay scrolling is enabled for this scrolled window. *)

  method get_placement : unit -> Enums.cornertype
  (** Gets the placement of the contents with respect to the scrollbars. *)

  method get_propagate_natural_height : unit -> bool
  (** Reports whether the natural height of the child will be calculated and
      propagated through the scrolled window’s requested natural height. *)

  method get_propagate_natural_width : unit -> bool
  (** Reports whether the natural width of the child will be calculated and
      propagated through the scrolled window’s requested natural width. *)

  method get_vadjustment : unit -> Adjustment.adjustment_t
  (** Returns the vertical scrollbar’s adjustment.

      This is the adjustment used to connect the vertical scrollbar to the child
      widget’s vertical scroll functionality. *)

  method get_vscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the vertical scrollbar of [scrolled_window]. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [scrolled_window].

      If [child] does not implement the [Gtk.Scrollable] interface, the scrolled
      window will add [child] to a [Gtk.Viewport] instance and then add the
      viewport as its child widget. *)

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the [GtkAdjustment] for the horizontal scrollbar. *)

  method set_has_frame : bool -> unit
  (** Changes the frame drawn around the contents of [scrolled_window]. *)

  method set_kinetic_scrolling : bool -> unit
  (** Turns kinetic scrolling on or off.

      Kinetic scrolling only applies to devices with source
      [GDK_SOURCE_TOUCHSCREEN]. *)

  method set_max_content_height : int -> unit
  (** Sets the maximum height that [scrolled_window] should keep visible.

      The [scrolled_window] will grow up to this height before it starts
      scrolling the content.

      It is a programming error to set the maximum content height to a value
      smaller than [Gtk.ScrolledWindow:min-content-height]. *)

  method set_max_content_width : int -> unit
  (** Sets the maximum width that [scrolled_window] should keep visible.

      The [scrolled_window] will grow up to this width before it starts
      scrolling the content.

      It is a programming error to set the maximum content width to a value
      smaller than [Gtk.ScrolledWindow:min-content-width]. *)

  method set_min_content_height : int -> unit
  (** Sets the minimum height that [scrolled_window] should keep visible.

      Note that this can and (usually will) be smaller than the minimum size of
      the content.

      It is a programming error to set the minimum content height to a value
      greater than [Gtk.ScrolledWindow:max-content-height]. *)

  method set_min_content_width : int -> unit
  (** Sets the minimum width that [scrolled_window] should keep visible.

      Note that this can and (usually will) be smaller than the minimum size of
      the content.

      It is a programming error to set the minimum content width to a value
      greater than [Gtk.ScrolledWindow:max-content-width]. *)

  method set_overlay_scrolling : bool -> unit
  (** Enables or disables overlay scrolling for this scrolled window. *)

  method set_placement : Enums.cornertype -> unit
  (** Sets the placement of the contents with respect to the scrollbars for the
      scrolled window.

      The default is [GTK_CORNER_TOP_LEFT], meaning the child is in the top
      left, with the scrollbars underneath and to the right. Other values in
      [Gtk.CornerType] are [GTK_CORNER_TOP_RIGHT], [GTK_CORNER_BOTTOM_LEFT], and
      [GTK_CORNER_BOTTOM_RIGHT].

      See also [Gtk.ScrolledWindow.get_placement] and
      [Gtk.ScrolledWindow.unset_placement]. *)

  method set_policy : Enums.policytype -> Enums.policytype -> unit
  (** Sets the scrollbar policy for the horizontal and vertical scrollbars.

      The policy determines when the scrollbar should appear; it is a value from
      the [Gtk.PolicyType] enumeration. If [GTK_POLICY_ALWAYS], the scrollbar is
      always present; if [GTK_POLICY_NEVER], the scrollbar is never present; if
      [GTK_POLICY_AUTOMATIC], the scrollbar is present only if needed (that is,
      if the slider part of the bar would be smaller than the trough — the
      display is larger than the page size). *)

  method set_propagate_natural_height : bool -> unit
  (** Sets whether the natural height of the child should be calculated and
      propagated through the scrolled window’s requested natural height. *)

  method set_propagate_natural_width : bool -> unit
  (** Sets whether the natural width of the child should be calculated and
      propagated through the scrolled window’s requested natural width. *)

  method set_vadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the [GtkAdjustment] for the vertical scrollbar. *)

  method unset_placement : unit -> unit
  (** Unsets the placement of the contents with respect to the scrollbars.

      If no window placement is set for a scrolled window, it defaults to
      [GTK_CORNER_TOP_LEFT]. *)

  method hscrollbar_policy : Enums.policytype
  method set_hscrollbar_policy : Enums.policytype -> unit
  method vscrollbar_policy : Enums.policytype
  method set_vscrollbar_policy : Enums.policytype -> unit
  method as_scrolled_window : Raw.Scrolled_window.t
end

(* High-level class for ScrolledWindow *)
class scrolled_window (obj : Raw.Scrolled_window.t) : scrolled_window_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_edge_overshot ?(after = false) ~callback () =
      Raw.Scrolled_window.on_edge_overshot ~after self#as_scrolled_window
        ~callback

    method on_edge_reached ?(after = false) ~callback () =
      Raw.Scrolled_window.on_edge_reached ~after self#as_scrolled_window
        ~callback

    method on_move_focus_out ?(after = false) ~callback () =
      Raw.Scrolled_window.on_move_focus_out ~after self#as_scrolled_window
        ~callback

    method on_scroll_child ?(after = false) ~callback () =
      Raw.Scrolled_window.on_scroll_child ~after self#as_scrolled_window
        ~callback

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
          (Raw.Scrolled_window.get_child obj)

    method get_hadjustment : unit -> Adjustment.adjustment_t =
      fun () ->
        new Adjustment.adjustment (Raw.Scrolled_window.get_hadjustment obj)

    method get_has_frame : unit -> bool =
      fun () -> Raw.Scrolled_window.get_has_frame obj

    method get_hscrollbar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Scrolled_window.get_hscrollbar obj)

    method get_kinetic_scrolling : unit -> bool =
      fun () -> Raw.Scrolled_window.get_kinetic_scrolling obj

    method get_max_content_height : unit -> int =
      fun () -> Raw.Scrolled_window.get_max_content_height obj

    method get_max_content_width : unit -> int =
      fun () -> Raw.Scrolled_window.get_max_content_width obj

    method get_min_content_height : unit -> int =
      fun () -> Raw.Scrolled_window.get_min_content_height obj

    method get_min_content_width : unit -> int =
      fun () -> Raw.Scrolled_window.get_min_content_width obj

    method get_overlay_scrolling : unit -> bool =
      fun () -> Raw.Scrolled_window.get_overlay_scrolling obj

    method get_placement : unit -> Enums.cornertype =
      fun () -> Raw.Scrolled_window.get_placement obj

    method get_propagate_natural_height : unit -> bool =
      fun () -> Raw.Scrolled_window.get_propagate_natural_height obj

    method get_propagate_natural_width : unit -> bool =
      fun () -> Raw.Scrolled_window.get_propagate_natural_width obj

    method get_vadjustment : unit -> Adjustment.adjustment_t =
      fun () ->
        new Adjustment.adjustment (Raw.Scrolled_window.get_vadjustment obj)

    method get_vscrollbar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Scrolled_window.get_vscrollbar obj)

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Scrolled_window.set_child obj child

    method set_hadjustment : Adjustment.adjustment_t option -> unit =
      fun hadjustment ->
        let hadjustment = Option.map (fun c -> c#as_adjustment) hadjustment in
        Raw.Scrolled_window.set_hadjustment obj hadjustment

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Scrolled_window.set_has_frame obj has_frame

    method set_kinetic_scrolling : bool -> unit =
      fun kinetic_scrolling ->
        Raw.Scrolled_window.set_kinetic_scrolling obj kinetic_scrolling

    method set_max_content_height : int -> unit =
      fun height -> Raw.Scrolled_window.set_max_content_height obj height

    method set_max_content_width : int -> unit =
      fun width -> Raw.Scrolled_window.set_max_content_width obj width

    method set_min_content_height : int -> unit =
      fun height -> Raw.Scrolled_window.set_min_content_height obj height

    method set_min_content_width : int -> unit =
      fun width -> Raw.Scrolled_window.set_min_content_width obj width

    method set_overlay_scrolling : bool -> unit =
      fun overlay_scrolling ->
        Raw.Scrolled_window.set_overlay_scrolling obj overlay_scrolling

    method set_placement : Enums.cornertype -> unit =
      fun window_placement ->
        Raw.Scrolled_window.set_placement obj window_placement

    method set_policy : Enums.policytype -> Enums.policytype -> unit =
      fun hscrollbar_policy vscrollbar_policy ->
        Raw.Scrolled_window.set_policy obj hscrollbar_policy vscrollbar_policy

    method set_propagate_natural_height : bool -> unit =
      fun propagate ->
        Raw.Scrolled_window.set_propagate_natural_height obj propagate

    method set_propagate_natural_width : bool -> unit =
      fun propagate ->
        Raw.Scrolled_window.set_propagate_natural_width obj propagate

    method set_vadjustment : Adjustment.adjustment_t option -> unit =
      fun vadjustment ->
        let vadjustment = Option.map (fun c -> c#as_adjustment) vadjustment in
        Raw.Scrolled_window.set_vadjustment obj vadjustment

    method unset_placement : unit -> unit =
      fun () -> Raw.Scrolled_window.unset_placement obj

    method hscrollbar_policy = Raw.Scrolled_window.get_hscrollbar_policy obj

    method set_hscrollbar_policy v =
      Raw.Scrolled_window.set_hscrollbar_policy obj v

    method vscrollbar_policy = Raw.Scrolled_window.get_vscrollbar_policy obj

    method set_vscrollbar_policy v =
      Raw.Scrolled_window.set_vscrollbar_policy obj v

    method as_scrolled_window = obj
  end

let new_ () : scrolled_window_t =
  new scrolled_window (Raw.Scrolled_window.new_ ())

class type popover_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t
  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_closed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_autohide : unit -> bool
  (** Returns whether the popover is modal.

      See [Gtk.Popover.set_autohide] for the implications of this. *)

  method get_cascade_popdown : unit -> bool
  (** Returns whether the popover will close after a modal child is closed. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [popover]. *)

  method get_has_arrow : unit -> bool
  (** Gets whether this popover is showing an arrow pointing at the widget that
      it is relative to. *)

  method get_mnemonics_visible : unit -> bool
  (** Gets whether mnemonics are visible. *)

  method get_position : unit -> Enums.positiontype
  (** Returns the preferred position of [popover]. *)

  method popdown : unit -> unit
  (** Pops [popover] down.

      This may have the side-effect of closing a parent popover as well. See
      [Gtk.Popover:cascade-popdown]. *)

  method popup : unit -> unit
  (** Pops [popover] up. *)

  method present : unit -> unit
  (** Allocate a size for the [GtkPopover].

      This function needs to be called in size-allocate by widgets who have a
      [GtkPopover] as child. When using a layout manager, this is happening
      automatically.

      To make a popover appear on screen, use [Gtk.Popover.popup]. *)

  method set_autohide : bool -> unit
  (** Sets whether [popover] is modal.

      A modal popover will grab the keyboard focus on it when being displayed.
      Focus will wrap around within the popover. Clicking outside the popover
      area or pressing Esc will dismiss the popover.

      Called this function on an already showing popup with a new autohide value
      different from the current one, will cause the popup to be hidden. *)

  method set_cascade_popdown : bool -> unit
  (** If [cascade_popdown] is [TRUE], the popover will be closed when a child
      modal popover is closed.

      If [FALSE], [popover] will stay visible. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [popover]. *)

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the default widget of a [GtkPopover].

      The default widget is the widget that’s activated when the user presses
      Enter in a dialog (for example). This function sets or unsets the default
      widget for a [GtkPopover]. *)

  method set_has_arrow : bool -> unit
  (** Sets whether this popover should draw an arrow pointing at the widget it
      is relative to. *)

  method set_mnemonics_visible : bool -> unit
  (** Sets whether mnemonics should be visible. *)

  method set_offset : int -> int -> unit
  (** Sets the offset to use when calculating the position of the popover.

      These values are used when preparing the [Gdk.PopupLayout] for positioning
      the popover. *)

  method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit
  (** Sets the rectangle that [popover] points to.

      This is in the coordinate space of the [popover] parent. *)

  method set_position : Enums.positiontype -> unit
  (** Sets the preferred position for [popover] to appear.

      If the [popover] is currently visible, it will be immediately updated.

      This preference will be respected where possible, although on lack of
      space (eg. if close to the window edges), the [GtkPopover] may choose to
      appear on the opposite side. *)

  method as_popover : Raw.Popover.t
end

(* High-level class for Popover *)
class popover (obj : Raw.Popover.t) : popover_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Native.native (Raw.Native.from_gobject obj)

    inherit
      Shortcut_manager.shortcut_manager (Raw.Shortcut_manager.from_gobject obj)

    method on_activate_default ?(after = false) ~callback () =
      Raw.Popover.on_activate_default ~after self#as_popover ~callback

    method on_closed ?(after = false) ~callback () =
      Raw.Popover.on_closed ~after self#as_popover ~callback

    method get_autohide : unit -> bool = fun () -> Raw.Popover.get_autohide obj

    method get_cascade_popdown : unit -> bool =
      fun () -> Raw.Popover.get_cascade_popdown obj

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
          (Raw.Popover.get_child obj)

    method get_has_arrow : unit -> bool =
      fun () -> Raw.Popover.get_has_arrow obj

    method get_mnemonics_visible : unit -> bool =
      fun () -> Raw.Popover.get_mnemonics_visible obj

    method get_position : unit -> Enums.positiontype =
      fun () -> Raw.Popover.get_position obj

    method popdown : unit -> unit = fun () -> Raw.Popover.popdown obj
    method popup : unit -> unit = fun () -> Raw.Popover.popup obj
    method present : unit -> unit = fun () -> Raw.Popover.present obj

    method set_autohide : bool -> unit =
      fun autohide -> Raw.Popover.set_autohide obj autohide

    method set_cascade_popdown : bool -> unit =
      fun cascade_popdown -> Raw.Popover.set_cascade_popdown obj cascade_popdown

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Popover.set_child obj child

    method set_default_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Popover.set_default_widget obj widget

    method set_has_arrow : bool -> unit =
      fun has_arrow -> Raw.Popover.set_has_arrow obj has_arrow

    method set_mnemonics_visible : bool -> unit =
      fun mnemonics_visible ->
        Raw.Popover.set_mnemonics_visible obj mnemonics_visible

    method set_offset : int -> int -> unit =
      fun x_offset y_offset -> Raw.Popover.set_offset obj x_offset y_offset

    method set_pointing_to : Ocgdk.Rectangle.rectangle_t option -> unit =
      fun rect ->
        let rect = Option.map (fun c -> c#as_rectangle) rect in
        Raw.Popover.set_pointing_to obj rect

    method set_position : Enums.positiontype -> unit =
      fun position -> Raw.Popover.set_position obj position

    method as_popover = obj
  end

let new_ () : popover_t = new popover (Raw.Popover.new_ ())

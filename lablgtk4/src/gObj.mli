(**************************************************************************)
(*                LablGTK4 - OCaml bindings for GTK4                      *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level GTK4 Widget Wrappers

    This module provides OCaml-friendly object-oriented wrappers around
    GTK4 widgets. Key differences from GTK3:

    - No [event_ops] (removed - use [controller_ops] instead)
    - Focus uses [focusable] property (not [can_focus])
    - CSS classes are first-class (not via style context)
    - Event handling via controllers (not signals)
*)

(** {2 Base Widget Class} *)

(** Base widget implementation class.

    All GTK4 widgets inherit from this class, which provides common
    functionality for visibility, sizing, focus, CSS, and event controllers. *)
class virtual widget_impl : Gtk.widget -> object
  method private obj : Gtk.widget
  (** Access the underlying GTK widget pointer *)

  (** {3 Visibility} *)

  method show : unit
  (** Show the widget. Note: widgets are visible by default in GTK4 *)

  method hide : unit
  (** Hide the widget *)

  method visible : bool
  (** Get visibility state *)

  method set_visible : bool -> unit
  (** Set visibility state *)

  (** {3 Size and Allocation} *)

  method width : int
  (** Get the widget's current width *)

  method height : int
  (** Get the widget's current height *)

  method set_size_request : width:int -> height:int -> unit
  (** Set minimum size request *)

  method size_request : int * int
  (** Get size request as (width, height) tuple *)

  (** {3 Properties} *)

  method sensitive : bool
  (** Get sensitive state (whether widget accepts input) *)

  method set_sensitive : bool -> unit
  (** Set sensitive state *)

  method name : string
  (** Get widget name *)

  method set_name : string -> unit
  (** Set widget name *)

  (** {3 Focus} *)

  method focusable : bool
  (** Get focusable property (was [can_focus] in GTK3) *)

  method set_focusable : bool -> unit
  (** Set focusable property *)

  method has_focus : bool
  (** Check if widget currently has keyboard focus *)

  method grab_focus : unit
  (** Try to grab keyboard focus *)

  (** {3 CSS Styling} *)

  method add_css_class : string -> unit
  (** Add a CSS class to this widget *)

  method remove_css_class : string -> unit
  (** Remove a CSS class from this widget *)

  method has_css_class : string -> bool
  (** Check if widget has a specific CSS class *)

  method css_classes : string list
  (** Get all CSS classes applied to this widget *)

  (** {3 Widget Hierarchy} *)

  method parent : widget option
  (** Get parent widget, if any *)

  method root : widget option
  (** Get root widget (top-level window), if attached *)

  (** {3 Event Controllers} *)

  method add_controller : EventController.t -> unit
  (** Add an event controller to this widget.
      The widget takes ownership of the controller. *)

  method remove_controller : EventController.t -> unit
  (** Remove an event controller from this widget *)

  (** {3 Drawing and Layout} *)

  method queue_draw : unit
  (** Queue a redraw of this widget *)

  method queue_resize : unit
  (** Queue a resize/relayout of this widget *)

  (** {3 GObject Integration} *)

  method as_gobject : Gobject.obj
  (** Cast to GObject for signal/property access *)

  method coerce : widget
  (** Coerce to base widget type *)
end

and widget = widget_impl
(** Type alias for base widget class *)

(** {2 Event Controller Helper} *)

(** Helper class for convenient event controller management.

    This class provides convenient methods for attaching event handlers
    without manually creating and configuring controllers.

    Example:
    {[
      let button = GButton.button ~label:"Click me" () in
      ignore (button#controllers#on_click ~callback:(fun ~n_press ~x ~y ->
        Printf.printf "Clicked at %f, %f\\n" x y
      ))
    ]} *)
class controller_ops : Gtk.widget -> object
  (** {3 Keyboard Events} *)

  method on_key_pressed :
    callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> bool) ->
    Gobject.signal_id
  (** Add keyboard event handler.

      Callback receives:
      - [keyval]: Key symbol (e.g., GDK_KEY_a)
      - [keycode]: Hardware key code
      - [state]: Modifier keys (Shift, Ctrl, etc.)

      Return [true] to stop event propagation, [false] to continue. *)

  method on_key_released :
    callback:(keyval:int -> keycode:int -> state:Gdk.ModifierType.t -> unit) ->
    Gobject.signal_id
  (** Add key release handler *)

  (** {3 Mouse Events} *)

  method on_click :
    ?button:int ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    Gobject.signal_id
  (** Add mouse click handler.

      - [button]: Which button to listen for (0=all, 1=primary, 2=middle, 3=right)
      - [n_press]: Click count (1=single, 2=double, 3=triple, etc.)
      - [x], [y]: Click coordinates relative to widget *)

  method on_click_released :
    ?button:int ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    Gobject.signal_id
  (** Add mouse button release handler *)

  method on_motion :
    callback:(x:float -> y:float -> unit) ->
    Gobject.signal_id
  (** Add mouse motion handler.
      Called when pointer moves within widget bounds. *)

  method on_enter :
    callback:(x:float -> y:float -> unit) ->
    Gobject.signal_id
  (** Add mouse enter handler.
      Called when pointer enters widget area. *)

  method on_leave :
    callback:(unit -> unit) ->
    Gobject.signal_id
  (** Add mouse leave handler.
      Called when pointer leaves widget area. *)

  (** {3 Controller Management} *)

  method controllers : EventController.t list
  (** Get list of all attached controllers created by this helper *)
end

(** {2 Full Widget Class} *)

(** Widget class with controller helper included.

    This is the recommended base class for most widgets. *)
class virtual ['a] widget_full : Gtk.widget -> object
  inherit widget_impl

  method controllers : controller_ops
  (** Access the controller operations helper *)
end

(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level widget wrapper classes for GTK4 *)

(** {2 Base Classes} *)

(** Controller operations helper - GTK4's event handling system *)
class controller_ops : [`widget] Gobject.obj ->
  object
    (** Add a keyboard key-pressed handler *)
    method on_key_pressed :
      callback:(keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> bool) ->
      Gobject.Signal.handler_id

    (** Add a keyboard key-released handler *)
    method on_key_released :
      callback:(keyval:int -> keycode:int -> state:Gdk.Tags.modifier_type list -> unit) ->
      Gobject.Signal.handler_id

    (** Add a click/button press handler
        @param button 0=all buttons, 1=primary (left), 2=middle, 3=secondary (right) *)
    method on_click :
      button:int ->
      callback:(n_press:int -> x:float -> y:float -> unit) ->
      Gobject.Signal.handler_id

    (** Add a mouse motion handler *)
    method on_motion :
      callback:(x:float -> y:float -> unit) ->
      Gobject.Signal.handler_id

    (** Add a mouse enter handler *)
    method on_enter :
      callback:(x:float -> y:float -> unit) ->
      Gobject.Signal.handler_id

    (** Add a mouse leave handler *)
    method on_leave :
      callback:(unit -> unit) ->
      Gobject.Signal.handler_id

    (** Get list of all attached controllers *)
    method controllers : EventController.t list
  end

(** Base widget implementation *)
class virtual widget_impl : [`widget] Gobject.obj ->
  object
    method private obj : [`widget] Gobject.obj

    (** {3 Visibility} *)

    method show : unit
    method hide : unit
    method visible : bool
    method set_visible : bool -> unit

    (** {3 Size} *)

    method width : int
    method height : int
    method allocated_width : int
    method allocated_height : int
    method set_size_request : width:int -> height:int -> unit
    method size_request : int * int

    (** {3 Focus} *)

    method focusable : bool
    method set_focusable : bool -> unit
    method has_focus : bool
    method grab_focus : unit

    (** {3 CSS Classes (NEW in GTK4)} *)

    method add_css_class : string -> unit
    method remove_css_class : string -> unit
    method has_css_class : string -> bool
    method css_classes : string list

    (** {3 State} *)

    method sensitive : bool
    method set_sensitive : bool -> unit
    method name : string
    method set_name : string -> unit

    (** {3 Hierarchy} *)

    method parent : [`widget] Gobject.obj option
    method root : [`widget] Gobject.obj option

    (** {3 Drawing} *)

    method queue_draw : unit
    method queue_resize : unit

    (** {3 Event Controllers (NEW in GTK4)} *)

    method add_controller : EventController.t -> unit
    method remove_controller : EventController.t -> unit

    (** {3 Packing Properties (NEW in GTK4)} *)

    method hexpand : bool
    method set_hexpand : bool -> unit
    method vexpand : bool
    method set_vexpand : bool -> unit
    method halign : Gtk.align
    method set_halign : Gtk.align -> unit
    method valign : Gtk.align
    method set_valign : Gtk.align -> unit
    method margin_start : int
    method set_margin_start : int -> unit
    method margin_end : int
    method set_margin_end : int -> unit
    method margin_top : int
    method set_margin_top : int -> unit
    method margin_bottom : int
    method set_margin_bottom : int -> unit

    (** {3 Conversion} *)

    method as_widget : [`widget] Gobject.obj
  end

(** Concrete widget class that can be instantiated *)
class widget : [`widget] Gobject.obj ->
  object
    inherit widget_impl
  end

(** Widget with controller operations *)
class virtual widget_full : [`widget] Gobject.obj ->
  object
    inherit widget_impl

    (** Access controller operations helper *)
    method controllers : controller_ops

    (** Connect to any GObject signal *)
    method connect : string -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  end

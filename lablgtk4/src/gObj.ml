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

(** High-level GTK4 widget wrappers *)

(** Base widget class implementation *)
class virtual widget_impl (obj : Gtk.widget) = object (self)
  method private obj = obj

  (* Visibility *)
  method show = Gtk.Widget.show obj
  method hide = Gtk.Widget.hide obj
  method visible = Gtk.Widget.get_visible obj
  method set_visible v = Gtk.Widget.set_visible obj v

  (* Size *)
  method width = Gtk.Widget.get_width obj
  method height = Gtk.Widget.get_height obj
  method set_size_request ~width ~height =
    Gtk.Widget.set_size_request obj ~width ~height
  method size_request = Gtk.Widget.get_size_request obj

  (* Properties *)
  method sensitive = Gtk.Widget.get_sensitive obj
  method set_sensitive s = Gtk.Widget.set_sensitive obj s
  method name = Gtk.Widget.get_name obj
  method set_name n = Gtk.Widget.set_name obj n

  (* Focus - NOTE: uses focusable not can_focus (GTK4 change) *)
  method focusable = Gtk.Widget.get_focusable obj
  method set_focusable f = Gtk.Widget.set_focusable obj f
  method has_focus = Gtk.Widget.has_focus obj
  method grab_focus = ignore (Gtk.Widget.grab_focus obj)

  (* CSS *)
  method add_css_class cls = Gtk.Widget.add_css_class obj cls
  method remove_css_class cls = Gtk.Widget.remove_css_class obj cls
  method has_css_class cls = Gtk.Widget.has_css_class obj cls
  method css_classes = Gtk.Widget.get_css_classes obj

  (* Hierarchy *)
  method parent = Gtk.Widget.get_parent obj
  method root = Gtk.Widget.get_root obj

  (* Controllers *)
  method add_controller ctrl = Gtk.Widget.add_controller obj ctrl
  method remove_controller ctrl = Gtk.Widget.remove_controller obj ctrl

  (* Drawing *)
  method queue_draw = Gtk.Widget.queue_draw obj
  method queue_resize = Gtk.Widget.queue_resize obj

  (* GObject integration *)
  method as_gobject = (Obj.magic obj : Gobject.obj)
  method coerce = (self :> widget_impl)
end

and widget = widget_impl

(** Controller operations helper *)
class controller_ops (widget : Gtk.widget) = object (self)
  val mutable controllers : EventController.t list = []

  (* Keyboard events *)
  method on_key_pressed ~callback =
    let ctrl = EventControllerKey.new_ () in
    let sig_id = EventControllerKey.connect_key_pressed ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_key_released ~callback =
    let ctrl = EventControllerKey.new_ () in
    let sig_id = EventControllerKey.connect_key_released ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  (* Mouse click events *)
  method on_click ?(button = 0) ~callback =
    let gesture = GestureClick.new_ () in
    GestureClick.set_button gesture button;
    let sig_id = GestureClick.connect_pressed gesture ~callback in
    Gtk.Widget.add_controller widget gesture;
    controllers <- gesture :: controllers;
    sig_id

  method on_click_released ?(button = 0) ~callback =
    let gesture = GestureClick.new_ () in
    GestureClick.set_button gesture button;
    let sig_id = GestureClick.connect_released gesture ~callback in
    Gtk.Widget.add_controller widget gesture;
    controllers <- gesture :: controllers;
    sig_id

  (* Mouse motion events *)
  method on_motion ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_motion ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_enter ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_enter ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  method on_leave ~callback =
    let ctrl = EventControllerMotion.new_ () in
    let sig_id = EventControllerMotion.connect_leave ctrl ~callback in
    Gtk.Widget.add_controller widget ctrl;
    controllers <- ctrl :: controllers;
    sig_id

  (* Get all controllers *)
  method controllers = controllers
end

(** Full widget class with controller helper *)
class virtual ['a] widget_full obj = object
  inherit widget_impl obj
  val controllers_ops = new controller_ops obj
  method controllers = controllers_ops
end

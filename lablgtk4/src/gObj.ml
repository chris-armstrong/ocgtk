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

(** {2 Controller Operations Helper} *)

(** Convenient event controller management - GTK4's new event system *)
class controller_ops (widget : [`widget] Gobject.obj) = object (self)
  val mutable controllers : EventController.t list = []

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

  method on_click ~button ~callback =
    let gesture = GestureClick.new_ () in
    GestureClick.set_button gesture button;
    let sig_id = GestureClick.connect_pressed gesture ~callback in
    Gtk.Widget.add_controller widget gesture;
    controllers <- gesture :: controllers;
    sig_id

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

  method controllers = controllers
end

(** {2 Base Widget Implementation} *)

class virtual widget_impl (obj : [`widget] Gobject.obj) = object (self)
  method private obj = obj

  (* Visibility *)
  method show = Gtk.Widget.show obj
  method hide = Gtk.Widget.hide obj
  method visible = Gtk.Widget.get_visible obj
  method set_visible v = Gtk.Widget.set_visible obj v

  (* Size *)
  method width = Gtk.Widget.get_width obj
  method height = Gtk.Widget.get_height obj
  method allocated_width = Gtk.Widget.get_allocated_width obj
  method allocated_height = Gtk.Widget.get_allocated_height obj
  method set_size_request ~width ~height =
    Gtk.Widget.set_size_request obj ~width ~height
  method size_request = Gtk.Widget.get_size_request obj

  (* Focus - NOTE: focusable not can_focus in GTK4! *)
  method focusable = Gtk.Widget.get_focusable obj
  method set_focusable f = Gtk.Widget.set_focusable obj f
  method has_focus = Gtk.Widget.has_focus obj
  method grab_focus = ignore (Gtk.Widget.grab_focus obj)

  (* CSS classes - NEW in GTK4 *)
  method add_css_class cls = Gtk.Widget.add_css_class obj cls
  method remove_css_class cls = Gtk.Widget.remove_css_class obj cls
  method has_css_class cls = Gtk.Widget.has_css_class obj cls
  method css_classes = Gtk.Widget.get_css_classes obj

  (* State *)
  method sensitive = Gtk.Widget.get_sensitive obj
  method set_sensitive s = Gtk.Widget.set_sensitive obj s
  method name = Gtk.Widget.get_name obj
  method set_name n = Gtk.Widget.set_name obj n

  (* Hierarchy *)
  method parent = Gtk.Widget.get_parent obj
  method root = Gtk.Widget.get_root obj

  (* Drawing *)
  method queue_draw = Gtk.Widget.queue_draw obj
  method queue_resize = Gtk.Widget.queue_resize obj

  (* Event controllers - NEW in GTK4 *)
  method add_controller ctrl = Gtk.Widget.add_controller obj ctrl
  method remove_controller ctrl = Gtk.Widget.remove_controller obj ctrl

  (* Packing properties - NEW in GTK4 *)
  method hexpand = Gtk.Widget.get_hexpand obj
  method set_hexpand h = Gtk.Widget.set_hexpand obj h
  method vexpand = Gtk.Widget.get_vexpand obj
  method set_vexpand v = Gtk.Widget.set_vexpand obj v
  method halign = Gtk.Widget.get_halign obj
  method set_halign a = Gtk.Widget.set_halign obj a
  method valign = Gtk.Widget.get_valign obj
  method set_valign a = Gtk.Widget.set_valign obj a
  method margin_start = Gtk.Widget.get_margin_start obj
  method set_margin_start m = Gtk.Widget.set_margin_start obj m
  method margin_end = Gtk.Widget.get_margin_end obj
  method set_margin_end m = Gtk.Widget.set_margin_end obj m
  method margin_top = Gtk.Widget.get_margin_top obj
  method set_margin_top m = Gtk.Widget.set_margin_top obj m
  method margin_bottom = Gtk.Widget.get_margin_bottom obj
  method set_margin_bottom m = Gtk.Widget.set_margin_bottom obj m

  (* Conversion *)
  method as_widget = obj
end

(** Concrete widget class that can be instantiated *)
and widget (obj : [`widget] Gobject.obj) = object (self)
  inherit widget_impl obj
end

(** {2 Widget with Controller Operations} *)

class virtual widget_full (obj : [`widget] Gobject.obj) = object (self)
  inherit widget_impl obj

  val controllers_helper = new controller_ops obj

  method controllers = controllers_helper

  method connect signal ~callback =
    Gobject.Signal.connect_simple (obj :> _ Gobject.obj) ~name:signal ~callback ~after:false
end

(** {2 Conversion Functions} *)

(** Convert a raw widget object to a widget class instance *)
let widget_of_obj (obj : [`widget] Gobject.obj) = new widget obj

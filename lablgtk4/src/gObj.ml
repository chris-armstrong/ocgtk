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

(* Shorthand for the Widget module in the cyclic dependency group *)
module Widget = Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget

(** {2 Controller Operations Helper} *)

(* COMMENTED OUT - Needs to be rewritten to use new generated API
(** Convenient event controller management - GTK4's new event system *)
class controller_ops (widget : [`widget] Gobject.obj) = object (self)
  val mutable controllers : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t list = []
  ...
end
*)

(** {2 Base Widget Implementation} *)

class virtual widget_impl (obj : [`widget] Gobject.obj) = object (self)
  method private obj = obj

  (* Visibility *)
  method show = Widget.show obj
  method hide = Widget.hide obj
  method visible = Widget.get_visible obj
  method set_visible v = Widget.set_visible obj v

  (* Size *)
  method width = Widget.get_width obj
  method height = Widget.get_height obj
  method allocated_width = Widget.get_allocated_width obj
  method allocated_height = Widget.get_allocated_height obj
  method set_size_request width height =
    Widget.set_size_request obj width height
  method size_request = (Widget.get_width obj, Widget.get_height obj)

  (* Focus - NOTE: focusable not can_focus in GTK4! *)
  method focusable = Widget.get_focusable obj
  method set_focusable f = Widget.set_focusable obj f
  method has_focus = Widget.has_focus obj
  method grab_focus = ignore (Widget.grab_focus obj)

  (* CSS classes - NEW in GTK4 *)
  method add_css_class cls = Widget.add_css_class obj cls
  method remove_css_class cls = Widget.remove_css_class obj cls
  method has_css_class cls = Widget.has_css_class obj cls
  method css_classes = Widget.get_css_classes obj

  (* State *)
  method sensitive = Widget.get_sensitive obj
  method set_sensitive s = Widget.set_sensitive obj s
  method name = Widget.get_name obj
  method set_name n = Widget.set_name obj n

  (* Hierarchy *)
  method parent = Widget.get_parent obj
  method root = Widget.get_root obj

  (* Drawing *)
  method queue_draw = Widget.queue_draw obj
  method queue_resize = Widget.queue_resize obj

  (* Event controllers - NEW in GTK4 *)
  method add_controller ctrl = Widget.add_controller obj ctrl
  method remove_controller ctrl = Widget.remove_controller obj ctrl

  (* Packing properties - NEW in GTK4 *)
  method hexpand = Widget.get_hexpand obj
  method set_hexpand h = Widget.set_hexpand obj h
  method vexpand = Widget.get_vexpand obj
  method set_vexpand v = Widget.set_vexpand obj v
  method halign = Widget.get_halign obj
  method set_halign a = Widget.set_halign obj a
  method valign = Widget.get_valign obj
  method set_valign a = Widget.set_valign obj a
  method margin_start = Widget.get_margin_start obj
  method set_margin_start m = Widget.set_margin_start obj m
  method margin_end = Widget.get_margin_end obj
  method set_margin_end m = Widget.set_margin_end obj m
  method margin_top = Widget.get_margin_top obj
  method set_margin_top m = Widget.set_margin_top obj m
  method margin_bottom = Widget.get_margin_bottom obj
  method set_margin_bottom m = Widget.set_margin_bottom obj m

  (* Conversion *)
  method as_widget = obj

  method widget = (self :> widget_impl)
end 

(** Concrete widget class that can be instantiated *)
and widget (obj : [`widget] Gobject.obj) = object (self)
  inherit widget_impl obj
end

(** {2 Widget with Controller Operations} *)

(* COMMENTED OUT - depends on controller_ops which needs to be rewritten
class virtual widget_full (obj : [`widget] Gobject.obj) = object (self)
  inherit widget_impl obj
  val controllers_helper = new controller_ops obj
  method controllers = controllers_helper
  method connect signal ~callback =
    Gobject.Signal.connect_simple (obj :> _ Gobject.obj) ~name:signal ~callback ~after:false
end
*)

(** {2 Conversion Functions} *)

(** Convert a raw widget object to a widget class instance *)
let widget_of_obj (obj : [> `widget] Gobject.obj) = new widget (Obj.magic obj)

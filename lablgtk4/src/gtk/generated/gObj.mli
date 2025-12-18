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

(** {2 Base Classes} *)

(* COMMENTED OUT - controller_ops needs to be rewritten to use new generated API
(** Controller operations helper - GTK4's event handling system *)
class controller_ops : [`widget] Gobject.obj ->
  object
    ...
  end
*)

(** Base widget implementation *)
class virtual widget_impl : [`widget] Gobject.obj ->
  object
    method private obj : Widget.t

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
    method set_size_request : int -> int -> unit
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
    method css_classes : unit  (** TODO: Should return string list but generated API returns unit *)

    (** {3 State} *)

    method sensitive : bool
    method set_sensitive : bool -> unit
    method name : string
    method set_name : string -> unit

    (** {3 Hierarchy} *)

    method parent : Widget.t option
    method root : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Root.t option

    (** {3 Drawing} *)

    method queue_draw : unit
    method queue_resize : unit

    (** {3 Event Controllers (NEW in GTK4)} *)

    method add_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t -> unit
    method remove_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t -> unit

    (** {3 Packing Properties (NEW in GTK4)} *)

    method hexpand : bool
    method set_hexpand : bool -> unit
    method vexpand : bool
    method set_vexpand : bool -> unit
    method halign : Gtk_enums.align
    method set_halign : Gtk_enums.align -> unit
    method valign : Gtk_enums.align
    method set_valign : Gtk_enums.align -> unit
    method margin_start : int
    method set_margin_start : int -> unit
    method margin_end : int
    method set_margin_end : int -> unit
    method margin_top : int
    method set_margin_top : int -> unit
    method margin_bottom : int
    method set_margin_bottom : int -> unit

    (** {3 Conversion} *)

    method as_widget : Widget.t

    method widget : widget_impl
  end

(** Concrete widget class that can be instantiated *)
class widget : [`widget] Gobject.obj ->
  object
    inherit widget_impl
  end


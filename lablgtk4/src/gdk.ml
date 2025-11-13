(**************************************************************************)
(*                Lablgtk                                                 *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(*    This program is distributed in the hope that it will be useful,     *)
(*    but WITHOUT ANY WARRANTY; without even the implied warranty of      *)
(*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       *)
(*    GNU Library General Public License for more details.                *)
(*                                                                        *)
(*    You should have received a copy of the GNU Library General          *)
(*    Public License along with this program; if not, write to the        *)
(*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,         *)
(*    Boston, MA 02111-1307  USA                                          *)
(*                                                                        *)
(**************************************************************************)

(** GDK4 - GTK Drawing Kit *)

open Gobject

(** {2 Core Types} *)

type color
type rgba
type surface = [`gdksurface] obj
type display
type device
type seat
type cairo = Cairo.context
type +'a event
type cursor

type rectangle = { x : int; y : int; width : int; height : int }

exception Error of string

(** {2 Tag Types} *)

module Tags = struct
  type gravity =
    [ `NORTH_WEST | `NORTH | `NORTH_EAST
    | `WEST | `CENTER | `EAST
    | `SOUTH_WEST | `SOUTH | `SOUTH_EAST
    | `STATIC ]

  type modifier_type =
    [ `SHIFT_MASK
    | `LOCK_MASK
    | `CONTROL_MASK
    | `ALT_MASK
    | `SUPER_MASK
    | `HYPER_MASK
    | `META_MASK
    | `BUTTON1_MASK
    | `BUTTON2_MASK
    | `BUTTON3_MASK
    | `BUTTON4_MASK
    | `BUTTON5_MASK ]

  type surface_edge =
    [ `NORTH_WEST | `NORTH | `NORTH_EAST
    | `WEST | `EAST
    | `SOUTH_WEST | `SOUTH | `SOUTH_EAST ]

  type scroll_direction =
    [ `UP | `DOWN | `LEFT | `RIGHT | `SMOOTH ]

  type crossing_mode =
    [ `NORMAL | `GRAB | `UNGRAB | `GTK_GRAB | `GTK_UNGRAB
    | `STATE_CHANGED | `TOUCH_BEGIN | `TOUCH_END | `DEVICE_SWITCH ]

  type notify_type =
    [ `ANCESTOR | `VIRTUAL | `INFERIOR | `NONLINEAR | `NONLINEAR_VIRTUAL
    | `UNKNOWN ]

  type touchpad_gesture_phase =
    [ `BEGIN | `UPDATE | `END | `CANCEL ]

  type input_source =
    [ `MOUSE | `PEN | `KEYBOARD | `TOUCHSCREEN | `TOUCHPAD
    | `TRACKPOINT | `TABLET_PAD ]

  type drag_action =
    [ `COPY | `MOVE | `LINK | `ASK ]
end

(** {2 Display Management} *)

module Display = struct
  type t = display

  external get_default : unit -> t option = "ml_gdk_display_get_default"
  external get_name : t -> string = "ml_gdk_display_get_name"
  external get_default_seat : t -> seat option = "ml_gdk_display_get_default_seat"
  external beep : t -> unit = "ml_gdk_display_beep"
  external flush : t -> unit = "ml_gdk_display_flush"
end

(** {2 Seat Management} *)

module Seat = struct
  type t = seat

  external get_pointer : t -> device option = "ml_gdk_seat_get_pointer"
  external get_keyboard : t -> device option = "ml_gdk_seat_get_keyboard"
  external get_display : t -> display = "ml_gdk_seat_get_display"
end

(** {2 Device Management} *)

module Device = struct
  type t = device

  external get_name : t -> string = "ml_gdk_device_get_name"
  external get_source : t -> Tags.input_source = "ml_gdk_device_get_source"
  external get_seat : t -> seat = "ml_gdk_device_get_seat"
  external get_display : t -> display = "ml_gdk_device_get_display"
end

(** {2 Surface Management} *)

module Surface = struct
  type t = surface

  external get_display : t -> display = "ml_gdk_surface_get_display"
  external get_width : t -> int = "ml_gdk_surface_get_width"
  external get_height : t -> int = "ml_gdk_surface_get_height"
  external hide : t -> unit = "ml_gdk_surface_hide"
  external show : t -> unit = "ml_gdk_surface_show"
  external is_destroyed : t -> bool = "ml_gdk_surface_is_destroyed"
end

(** {2 Rectangle Utilities} *)

module Rectangle = struct
  type t = rectangle = { x : int; y : int; width : int; height : int }

  let create ~x ~y ~width ~height = { x; y; width; height }

  external intersect : t -> t -> t option = "ml_gdk_rectangle_intersect"
  external union : t -> t -> t = "ml_gdk_rectangle_union"
end

(** {2 Color Management} *)

module Color = struct
  type t = color

  external create : red:int -> green:int -> blue:int -> t = "ml_gdk_color_create"
  external get_red : t -> int = "ml_gdk_color_get_red"
  external get_green : t -> int = "ml_gdk_color_get_green"
  external get_blue : t -> int = "ml_gdk_color_get_blue"
end

module RGBA = struct
  type t = rgba

  external create : red:float -> green:float -> blue:float -> alpha:float -> t
    = "ml_gdk_rgba_create"
  external get_red : t -> float = "ml_gdk_rgba_get_red"
  external get_green : t -> float = "ml_gdk_rgba_get_green"
  external get_blue : t -> float = "ml_gdk_rgba_get_blue"
  external get_alpha : t -> float = "ml_gdk_rgba_get_alpha"
  external to_string : t -> string = "ml_gdk_rgba_to_string"
  external parse : string -> t option = "ml_gdk_rgba_parse"
end

(** {2 Cursor Management} *)

module Cursor = struct
  type t = cursor

  external create_from_name : string -> display -> t option
    = "ml_gdk_cursor_new_from_name"
end

(** {2 Cairo Integration} *)

module Cairo = struct
  external create : surface -> cairo = "ml_gdk_cairo_create"
  external set_source_rgba : cairo -> rgba -> unit = "ml_gdk_cairo_set_source_rgba"
end

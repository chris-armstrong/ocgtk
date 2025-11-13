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

(** GDK4 - GTK Drawing Kit

    GDK4 is the low-level drawing and windowing API for GTK4.

    MAJOR CHANGES FROM GDK3:
    - GdkWindow → GdkSurface (renamed)
    - GdkScreen removed (merged into GdkDisplay)
    - GdkDeviceManager removed (use GdkSeat)
    - Root window concept removed
    - Event system simplified *)

open Gobject

(** {2 Core Types} *)

type color
(** RGBA color *)

type rgba
(** RGBA color with alpha channel *)

type surface = [`gdksurface] obj
(** Surface (was Window in GDK3) - represents a drawable area *)

type display
(** Display connection *)

type device
(** Input device (mouse, keyboard, tablet, etc.) *)

type seat
(** Device seat - groups related devices (new in GDK4) *)

type cairo = Cairo.context
(** Cairo drawing context *)

type +'a event
(** Event (opaque in GDK4 - use accessor functions) *)

type cursor
(** Mouse cursor *)

type rectangle = { x : int; y : int; width : int; height : int }
(** Rectangle for geometry *)

exception Error of string

(** {2 Tag Types - Enumerations} *)

module Tags : sig
  (** GDK4 enumeration types *)

  type gravity =
    [ `NORTH_WEST | `NORTH | `NORTH_EAST
    | `WEST | `CENTER | `EAST
    | `SOUTH_WEST | `SOUTH | `SOUTH_EAST
    | `STATIC ]
  (** Window positioning gravity *)

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
  (** Keyboard modifiers *)

  type surface_edge =
    [ `NORTH_WEST | `NORTH | `NORTH_EAST
    | `WEST | `EAST
    | `SOUTH_WEST | `SOUTH | `SOUTH_EAST ]
  (** Surface resize edges *)

  type scroll_direction =
    [ `UP | `DOWN | `LEFT | `RIGHT | `SMOOTH ]
  (** Scroll event direction *)

  type crossing_mode =
    [ `NORMAL | `GRAB | `UNGRAB | `GTK_GRAB | `GTK_UNGRAB
    | `STATE_CHANGED | `TOUCH_BEGIN | `TOUCH_END | `DEVICE_SWITCH ]
  (** How pointer entered/left *)

  type notify_type =
    [ `ANCESTOR | `VIRTUAL | `INFERIOR | `NONLINEAR | `NONLINEAR_VIRTUAL
    | `UNKNOWN ]
  (** Detail of crossing event *)

  type touchpad_gesture_phase =
    [ `BEGIN | `UPDATE | `END | `CANCEL ]
  (** Touchpad gesture phase *)

  type input_source =
    [ `MOUSE | `PEN | `KEYBOARD | `TOUCHSCREEN | `TOUCHPAD
    | `TRACKPOINT | `TABLET_PAD ]
  (** Input device source type *)

  type drag_action =
    [ `COPY | `MOVE | `LINK | `ASK ]
  (** Drag and drop actions *)

end

(** {2 Display Management} *)

module Display : sig
  type t = display
  (** Display connection *)

  val get_default : unit -> t option
  (** Get the default display *)

  val get_name : t -> string
  (** Get display name *)

  val get_default_seat : t -> seat option
  (** Get the default seat for this display (new in GDK4) *)

  val beep : t -> unit
  (** Beep on the display *)

  val flush : t -> unit
  (** Flush pending operations *)
end

(** {2 Seat Management (new in GDK4)} *)

module Seat : sig
  type t = seat
  (** Device seat - groups related input devices *)

  val get_pointer : t -> device option
  (** Get the pointer device for this seat *)

  val get_keyboard : t -> device option
  (** Get the keyboard device for this seat *)

  val get_display : t -> display
  (** Get the display this seat belongs to *)
end

(** {2 Device Management} *)

module Device : sig
  type t = device
  (** Input device *)

  val get_name : t -> string
  (** Get device name *)

  val get_source : t -> Tags.input_source
  (** Get device source type *)

  val get_seat : t -> seat
  (** Get the seat this device belongs to *)

  val get_display : t -> display
  (** Get the display this device belongs to *)
end

(** {2 Surface Management (was Window in GDK3)} *)

module Surface : sig
  type t = surface
  (** Surface - drawable area (was GdkWindow in GDK3) *)

  val get_display : t -> display
  (** Get the display this surface belongs to *)

  val get_width : t -> int
  (** Get surface width *)

  val get_height : t -> int
  (** Get surface height *)

  val hide : t -> unit
  (** Hide the surface *)

  val show : t -> unit
  (** Show the surface *)

  val is_destroyed : t -> bool
  (** Check if surface is destroyed *)
end

(** {2 Rectangle Utilities} *)

module Rectangle : sig
  type t = rectangle = { x : int; y : int; width : int; height : int }
  (** Rectangle *)

  val create : x:int -> y:int -> width:int -> height:int -> t
  (** Create a rectangle *)

  val intersect : t -> t -> t option
  (** Compute intersection of two rectangles *)

  val union : t -> t -> t
  (** Compute union of two rectangles *)
end

(** {2 Color Management} *)

module Color : sig
  type t = color
  (** RGB color *)

  val create : red:int -> green:int -> blue:int -> t
  (** Create RGB color (0-65535 range) *)

  val get_red : t -> int
  val get_green : t -> int
  val get_blue : t -> int
end

module RGBA : sig
  type t = rgba
  (** RGBA color with alpha *)

  val create : red:float -> green:float -> blue:float -> alpha:float -> t
  (** Create RGBA color (0.0-1.0 range) *)

  val get_red : t -> float
  val get_green : t -> float
  val get_blue : t -> float
  val get_alpha : t -> float

  val to_string : t -> string
  (** Convert to CSS-style string *)

  val parse : string -> t option
  (** Parse from CSS-style string *)
end

(** {2 Cursor Management} *)

module Cursor : sig
  type t = cursor
  (** Mouse cursor *)

  val create_from_name : string -> display -> t option
  (** Create cursor from name (e.g., "pointer", "hand", "wait") *)
end

(** {2 Cairo Integration} *)

module Cairo : sig
  val create : surface -> cairo
  (** Create Cairo context for drawing on surface *)

  val set_source_rgba : cairo -> rgba -> unit
  (** Set source color from RGBA *)
end

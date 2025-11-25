(* High-level OCaml wrappers for GTK4 Range widgets *)
(* Based on lablgtk3 gRange.mli, adapted for GTK4 *)

open Gtk
open GObj

(** Range widgets: Scrollbars, scales, progress bars, etc. *)

(** {3 GtkProgressBar} *)

(** A widget which indicates progress visually
   @gtkdoc gtk GtkProgressBar *)
class progress_bar : Progress_bar.t ->
  object
    inherit GObj.widget_impl

    method set_fraction : float -> unit
    method fraction : float

    method set_pulse_step : float -> unit
    method pulse_step : float

    method set_text : string option -> unit
    method text : string option

    method set_show_text : bool -> unit
    method show_text : bool

    method set_inverted : bool -> unit
    method inverted : bool

    method pulse : unit -> unit

    method set_ellipsize : [`NONE | `START | `MIDDLE | `END] -> unit
    method ellipsize : [`NONE | `START | `MIDDLE | `END]
  end

(** Create a new progress bar
    @param pulse_step default value is [0.1]
    @param packing optional packing function
    @param show whether to show the widget immediately *)
val progress_bar :
  ?pulse_step:float ->
  ?fraction:float ->
  ?show_text:bool ->
  ?inverted:bool ->
  ?packing:(widget -> unit) ->
  ?show:bool ->
  unit -> progress_bar

(** {3 GtkRange} *)

(** Base class for widgets which visualize an adjustment
   @gtkdoc gtk GtkRange *)
class range : Range.t ->
  object
    inherit GObj.widget_impl

    method as_range : Range.t

    method set_fill_level : float -> unit
    method fill_level : float

    method set_inverted : bool -> unit
    method inverted : bool

    method set_restrict_to_fill_level : bool -> unit
    method restrict_to_fill_level : bool

    method set_round_digits : int -> unit
    method round_digits : int

    method set_show_fill_level : bool -> unit
    method show_fill_level : bool

    method set_slider_size_fixed : bool -> unit
    method slider_size_fixed : bool

    method set_flippable : bool -> unit
    method flippable : bool
  end

(** {3 GtkScale} *)

(** A slider widget for selecting a value from a range
   @gtkdoc gtk GtkScale *)
class scale : Scale.t ->
  object
    inherit range

    method set_digits : int -> unit
    method digits : int

    method set_draw_value : bool -> unit
    method draw_value : bool

    method set_has_origin : bool -> unit
    method has_origin : bool

    method set_value_pos : Gtk_enums.positiontype -> unit
    method value_pos : Gtk_enums.positiontype

    method clear_marks : unit -> unit
    method add_mark : float -> Gtk_enums.positiontype -> string option -> unit
  end

(** Create a new scale widget
    @param orientation horizontal or vertical orientation
    @param digits number of decimal places to display, default is [1]
    @param draw_value whether to display the current value, default is [false]
    @param has_origin whether to draw a fill level indicator, default is [false]
    @param value_pos position of the value display, default is [`TOP]
    @param fill_level fill level value
    @param inverted whether to invert the direction
    @param restrict_to_fill_level whether to restrict to fill level
    @param round_digits number of digits to round to
    @param show_fill_level whether to show fill level
    @param packing optional packing function
    @param show whether to show the widget immediately *)
val scale :
  Gtk.orientation ->
  ?digits:int ->
  ?draw_value:bool ->
  ?has_origin:bool ->
  ?value_pos:Gtk.position_type ->
  ?fill_level:float ->
  ?inverted:bool ->
  ?restrict_to_fill_level:bool ->
  ?round_digits:int ->
  ?show_fill_level:bool ->
  ?packing:(widget -> unit) ->
  ?show:bool ->
  unit -> scale

(** {3 GtkLevelBar} *)

(** A bar that can be used as a level indicator
   @gtkdoc gtk GtkLevelBar *)
class level_bar : Level_bar.t ->
  object
    inherit GObj.widget_impl

    method set_value : float -> unit
    method value : float

    method set_min_value : float -> unit
    method min_value : float

    method set_max_value : float -> unit
    method max_value : float

    method set_inverted : bool -> unit
    method inverted : bool

    method add_offset_value : string -> float -> unit
    method remove_offset_value : string option -> unit
  end

(** Create a new level bar widget
    @param min_value minimum value
    @param max_value maximum value
    @param value current value
    @param inverted whether to invert the direction
    @param packing optional packing function
    @param show whether to show the widget immediately *)
val level_bar :
  ?min_value:float ->
  ?max_value:float ->
  ?value:float ->
  ?inverted:bool ->
  ?packing:(widget -> unit) ->
  ?show:bool ->
  unit -> level_bar

(** Create a level bar for an interval
    @param min_value minimum value of the interval
    @param max_value maximum value of the interval *)
val level_bar_for_interval :
  min_value:float ->
  max_value:float ->
  ?value:float ->
  ?inverted:bool ->
  ?packing:(widget -> unit) ->
  ?show:bool ->
  unit -> level_bar

(* High-level OCaml wrappers for GTK4 Range widgets *)
(* Based on lablgtk3 gRange.ml, adapted for GTK4 *)

open Gtk
open GObj

(** {3 GtkProgressBar} *)

class progress_bar (obj : Progress_bar.t) = object (self)
  inherit GObj.widget_impl (Progress_bar.as_widget obj)

  method set_fraction f = Progress_bar.set_fraction obj f
  method fraction = Progress_bar.get_fraction obj

  method set_pulse_step step = Progress_bar.set_pulse_step obj step
  method pulse_step = Progress_bar.get_pulse_step obj

  method set_text text_opt = Progress_bar.set_text obj text_opt
  method text = Progress_bar.get_text obj

  method set_show_text show = Progress_bar.set_show_text obj show
  method show_text = Progress_bar.get_show_text obj

  method set_inverted inv = Progress_bar.set_inverted obj inv
  method inverted = Progress_bar.get_inverted obj

  method pulse () = Progress_bar.pulse obj

  method set_ellipsize (mode : [`NONE | `START | `MIDDLE | `END]) =
    let pango_mode : Pango_enums.ellipsizemode = match mode with
      | `NONE -> `NONE
      | `START -> `START
      | `MIDDLE -> `MIDDLE
      | `END -> `END
    in
    Progress_bar.set_ellipsize obj pango_mode
  method ellipsize : [`NONE | `START | `MIDDLE | `END] =
    match Progress_bar.get_ellipsize obj with
    | `NONE -> `NONE
    | `START -> `START
    | `MIDDLE -> `MIDDLE
    | `END -> `END
end

let progress_bar ?pulse_step ?fraction ?show_text ?inverted ?packing ?show () =
  let pb = Progress_bar.new_ () in
  let widget = new progress_bar pb in
  (match pulse_step with Some s -> widget#set_pulse_step s | None -> ());
  (match fraction with Some f -> widget#set_fraction f | None -> ());
  (match show_text with Some s -> widget#set_show_text s | None -> ());
  (match inverted with Some i -> widget#set_inverted i | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** {3 GtkRange} *)

class range (obj : Range.t) = object (self)
  inherit GObj.widget_impl (Range.as_widget obj)

  method as_range = obj

  method set_fill_level level = Range.set_fill_level obj level
  method fill_level = Range.get_fill_level obj

  method set_inverted inv = Range.set_inverted obj inv
  method inverted = Range.get_inverted obj

  method set_restrict_to_fill_level restrict =
    Range.set_restrict_to_fill_level obj restrict
  method restrict_to_fill_level = Range.get_restrict_to_fill_level obj

  method set_round_digits digits = Range.set_round_digits obj digits
  method round_digits = Range.get_round_digits obj

  method set_show_fill_level show = Range.set_show_fill_level obj show
  method show_fill_level = Range.get_show_fill_level obj

  method set_slider_size_fixed fixed = Range.set_slider_size_fixed obj fixed
  method slider_size_fixed = Range.get_slider_size_fixed obj

  method set_flippable flip = Range.set_flippable obj flip
  method flippable = Range.get_flippable obj
end

(** {3 GtkScale} *)

class scale (obj : Scale.t) = object (self)
  inherit range (Obj.magic obj : Range.t)

  method set_digits d = Scale.set_digits obj d
  method digits = Scale.get_digits obj

  method set_draw_value draw = Scale.set_draw_value obj draw
  method draw_value = Scale.get_draw_value obj

  method set_has_origin has = Scale.set_has_origin obj has
  method has_origin = Scale.get_has_origin obj

  method set_value_pos pos = Scale.set_value_pos obj pos
  method value_pos = Scale.get_value_pos obj

  method clear_marks () = Scale.clear_marks obj
  method add_mark value pos markup = Scale.add_mark obj value pos markup
end

let scale orientation ?digits ?draw_value ?has_origin ?value_pos
    ?fill_level ?inverted ?restrict_to_fill_level ?round_digits
    ?show_fill_level ?packing ?show () =
  let s = Scale.new_ orientation None in
  let widget = new scale s in
  (match digits with Some d -> widget#set_digits d | None -> ());
  (match draw_value with Some dv -> widget#set_draw_value dv | None -> ());
  (match has_origin with Some ho -> widget#set_has_origin ho | None -> ());
  (match value_pos with Some vp -> widget#set_value_pos vp | None -> ());
  (match fill_level with Some fl -> widget#set_fill_level fl | None -> ());
  (match inverted with Some i -> widget#set_inverted i | None -> ());
  (match restrict_to_fill_level with Some r -> widget#set_restrict_to_fill_level r | None -> ());
  (match round_digits with Some rd -> widget#set_round_digits rd | None -> ());
  (match show_fill_level with Some sfl -> widget#set_show_fill_level sfl | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

(** {3 GtkLevelBar} *)

class level_bar (obj : Level_bar.t) = object (self)
  inherit GObj.widget_impl (Level_bar.as_widget obj)

  method set_value v = Level_bar.set_value obj v
  method value = Level_bar.get_value obj

  method set_min_value min = Level_bar.set_min_value obj min
  method min_value = Level_bar.get_min_value obj

  method set_max_value max = Level_bar.set_max_value obj max
  method max_value = Level_bar.get_max_value obj

  method set_inverted inv = Level_bar.set_inverted obj inv
  method inverted = Level_bar.get_inverted obj

  method add_offset_value name value =
    Level_bar.add_offset_value obj name value
  method remove_offset_value name = Level_bar.remove_offset_value obj name
end

let level_bar ?min_value ?max_value ?value ?inverted ?packing ?show () =
  let lb = Level_bar.new_ () in
  let widget = new level_bar lb in
  (match min_value with Some min -> widget#set_min_value min | None -> ());
  (match max_value with Some max -> widget#set_max_value max | None -> ());
  (match value with Some v -> widget#set_value v | None -> ());
  (match inverted with Some i -> widget#set_inverted i | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

let level_bar_for_interval ~min_value ~max_value ?value ?inverted ?packing ?show () =
  let lb = Level_bar.new_for_interval min_value max_value in
  let widget = new level_bar lb in
  widget#set_min_value min_value;
  widget#set_max_value max_value;
  (match value with Some v -> widget#set_value v | None -> ());
  (match inverted with Some i -> widget#set_inverted i | None -> ());
  (match packing with Some f -> f (widget :> GObj.widget) | None -> ());
  if show = Some true then widget#show;
  widget

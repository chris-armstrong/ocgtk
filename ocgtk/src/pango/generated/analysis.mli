(* GENERATED CODE - DO NOT EDIT *)
(* Analysis: Analysis *)

type t = [ `analysis ] Gobject.obj
(** The `PangoAnalysis` structure stores information about the properties of a
    segment of text. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_font : t -> Context_and__font_and__font_map_and__fontset.Font.t
  = "ml_pango_analysis_get_font"

external get_level : t -> unit = "ml_pango_analysis_get_level"
external get_gravity : t -> unit = "ml_pango_analysis_get_gravity"
external get_flags : t -> unit = "ml_pango_analysis_get_flags"
external get_script : t -> unit = "ml_pango_analysis_get_script"
external get_language : t -> Language.t = "ml_pango_analysis_get_language"
external get_extra_attrs : t -> unit = "ml_pango_analysis_get_extra_attrs"

(* Setters *)
external set_font :
  t -> Context_and__font_and__font_map_and__fontset.Font.t -> unit
  = "ml_pango_analysis_set_font"

external set_level : t -> unit -> unit = "ml_pango_analysis_set_level"
external set_gravity : t -> unit -> unit = "ml_pango_analysis_set_gravity"
external set_flags : t -> unit -> unit = "ml_pango_analysis_set_flags"
external set_script : t -> unit -> unit = "ml_pango_analysis_set_script"

external set_language : t -> Language.t -> unit
  = "ml_pango_analysis_set_language"

external set_extra_attrs : t -> unit -> unit
  = "ml_pango_analysis_set_extra_attrs"

external make :
  Context_and__font_and__font_map_and__fontset.Font.t ->
  unit ->
  unit ->
  unit ->
  unit ->
  Language.t ->
  unit ->
  t = "ml_pango_analysis_make_bytecode" "ml_pango_analysis_make_native"

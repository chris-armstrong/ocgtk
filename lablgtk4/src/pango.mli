(* Pango module interface *)

type context = [`pangocontext] Gobject.obj
type font = [`pangofont] Gobject.obj
type font_map = [`pangofontmap] Gobject.obj
type layout = [`pangolayout] Gobject.obj
type units = int
type rectangle = {x:int; y:int; width:int; height:int}
type font_description
type font_metrics
type language

module Tags : sig
  type style = [ `NORMAL | `OBLIQUE | `ITALIC ]
  type weight_internal = [ `ULTRALIGHT | `LIGHT | `NORMAL | `BOLD | `ULTRABOLD | `HEAVY ]
  type weight = [ weight_internal | `CUSTOM of int ]
  val weight_to_int : weight -> int
  type variant = [ `NORMAL | `SMALL_CAPS ]
  type stretch = [
    | `ULTRA_CONDENSED | `EXTRA_CONDENSED | `CONDENSED | `SEMI_CONDENSED
    | `NORMAL | `SEMI_EXPANDED | `EXPANDED | `EXTRA_EXPANDED | `ULTRA_EXPANDED
  ]
  type scale = [
    | `XX_SMALL | `X_SMALL | `SMALL | `MEDIUM
    | `LARGE | `X_LARGE | `XX_LARGE | `CUSTOM of float
  ]
  val scale_to_float : scale -> float
  type underline = [ `NONE | `SINGLE | `DOUBLE | `LOW ]
  type wrap_mode = [ `WORD | `CHAR | `WORD_CHAR ]
  type ellipsize_mode = [ `NONE | `START | `MIDDLE | `END ]
end

module Font : sig
  val from_string : string -> font_description
  val to_string : font_description -> string
  val copy : font_description -> font_description
  val set_family : font_description -> string -> unit
  val get_family : font_description -> string
  val set_style : font_description -> Tags.style -> unit
  val get_style : font_description -> Tags.style
  val set_variant : font_description -> Tags.variant -> unit
  val get_variant : font_description -> Tags.variant
  val set_weight : font_description -> Tags.weight -> unit
  val get_weight : font_description -> int
  val set_stretch : font_description -> Tags.stretch -> unit
  val get_stretch : font_description -> Tags.stretch
  val set_size : font_description -> int -> unit
  val get_size : font_description -> int
  val set_absolute_size : font_description -> float -> unit
  val get_size_is_absolute : font_description -> bool
  val modify : font_description ->
    ?family:string ->
    ?style:Tags.style ->
    ?variant:Tags.variant ->
    ?weight:Tags.weight ->
    ?stretch:Tags.stretch ->
    ?size:int ->
    ?absolute_size:float ->
    unit -> unit
  val get_metrics : font -> language -> font_metrics
  val get_ascent : font_metrics -> units
  val get_descent : font_metrics -> units
  val get_approximate_char_width : font_metrics -> units
  val get_approximate_digit_width : font_metrics -> units
end

module FontMap : sig
  val load_font : font_map -> context -> font_description -> font
end

module Language : sig
  val from_string : string -> language
  val to_string : language -> string
  val matches : language -> string -> bool
  val none : language
end

module Context : sig
  val cast : Gtk.Widget.t -> context
  val get_font_description : context -> font_description
  val set_font_description : context -> font_description -> unit
  val get_language : context -> language
  val set_language : context -> language -> unit
  val load_font : context -> font_description -> font
  val load_fontset : context -> font_description -> language -> font
  val get_metrics : context -> font_description -> language option -> font_metrics
end

val scale : int

module Layout : sig
  val cast : Gtk.Widget.t -> layout
  val create : context -> layout
  val copy : layout -> layout
  val get_context : layout -> context
  val get_text : layout -> string
  val set_text : layout -> string -> unit
  val set_markup : layout -> string -> unit
  val set_markup_with_accel : layout -> string -> Glib.unichar -> unit
  val get_font_description : layout -> font_description
  val set_font_description : layout -> font_description -> unit
  val get_width : layout -> int
  val set_width : layout -> int -> unit
  val get_indent : layout -> int
  val set_indent : layout -> int -> unit
  val get_spacing : layout -> int
  val set_spacing : layout -> int -> unit
  val get_wrap : layout -> Tags.wrap_mode
  val set_wrap : layout -> Tags.wrap_mode -> unit
  val get_justify : layout -> bool
  val set_justify : layout -> bool -> unit
  val get_single_paragraph_mode : layout -> bool
  val set_single_paragraph_mode : layout -> bool -> unit
  val context_changed : layout -> unit
  val get_size : layout -> units * units
  val get_pixel_size : layout -> int * int
  val get_extent : layout -> rectangle
  val get_pixel_extent : layout -> rectangle
  val index_to_pos : layout -> int -> rectangle
  val xy_to_index : layout -> x:int -> y:int -> int * int * bool
  val set_ellipsize : layout -> Tags.ellipsize_mode -> unit
  val get_ellipsize : layout -> Tags.ellipsize_mode
end

include module type of Pango_enums

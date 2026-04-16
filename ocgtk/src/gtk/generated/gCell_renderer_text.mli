class type cell_renderer_text_t = object
  inherit GCell_renderer.cell_renderer_t
  inherit Gcell_renderer_text_signals.cell_renderer_text_signals
  method set_fixed_height_from_font : int -> unit
  method align_set : bool
  method set_align_set : bool -> unit
  method alignment : Ocgtk_pango.Pango.alignment
  method attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t
  method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t -> unit
  method set_background : string -> unit
  method background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_background_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method background_set : bool
  method set_background_set : bool -> unit
  method editable : bool
  method set_editable : bool -> unit
  method editable_set : bool
  method set_editable_set : bool -> unit
  method ellipsize : Ocgtk_pango.Pango.ellipsizemode
  method set_ellipsize : Ocgtk_pango.Pango.ellipsizemode -> unit
  method ellipsize_set : bool
  method set_ellipsize_set : bool -> unit
  method family : string
  method set_family : string -> unit
  method family_set : bool
  method set_family_set : bool -> unit
  method font : string
  method set_font : string -> unit
  method font_desc : Ocgtk_pango.Pango.Font_description.font_description_t

  method set_font_desc :
    Ocgtk_pango.Pango.Font_description.font_description_t -> unit

  method set_foreground : string -> unit
  method foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method set_foreground_rgba : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
  method foreground_set : bool
  method set_foreground_set : bool -> unit
  method language : string
  method set_language : string -> unit
  method language_set : bool
  method set_language_set : bool -> unit
  method set_markup : string -> unit
  method max_width_chars : int
  method set_max_width_chars : int -> unit
  method placeholder_text : string
  method set_placeholder_text : string -> unit
  method rise : int
  method set_rise : int -> unit
  method rise_set : bool
  method set_rise_set : bool -> unit
  method scale : float
  method set_scale : float -> unit
  method scale_set : bool
  method set_scale_set : bool -> unit
  method single_paragraph_mode : bool
  method set_single_paragraph_mode : bool -> unit
  method size : int
  method set_size : int -> unit
  method size_points : float
  method set_size_points : float -> unit
  method size_set : bool
  method set_size_set : bool -> unit
  method stretch : Ocgtk_pango.Pango.stretch
  method set_stretch : Ocgtk_pango.Pango.stretch -> unit
  method stretch_set : bool
  method set_stretch_set : bool -> unit
  method strikethrough : bool
  method set_strikethrough : bool -> unit
  method strikethrough_set : bool
  method set_strikethrough_set : bool -> unit
  method style : Ocgtk_pango.Pango.style
  method set_style : Ocgtk_pango.Pango.style -> unit
  method style_set : bool
  method set_style_set : bool -> unit
  method text : string
  method set_text : string -> unit
  method underline : Ocgtk_pango.Pango.underline
  method set_underline : Ocgtk_pango.Pango.underline -> unit
  method underline_set : bool
  method set_underline_set : bool -> unit
  method variant : Ocgtk_pango.Pango.variant
  method set_variant : Ocgtk_pango.Pango.variant -> unit
  method variant_set : bool
  method set_variant_set : bool -> unit
  method weight : int
  method set_weight : int -> unit
  method weight_set : bool
  method set_weight_set : bool -> unit
  method width_chars : int
  method set_width_chars : int -> unit
  method wrap_mode : Ocgtk_pango.Pango.wrapmode
  method set_wrap_mode : Ocgtk_pango.Pango.wrapmode -> unit
  method wrap_width : int
  method set_wrap_width : int -> unit
  method as_cell_renderer_text : Cell_renderer_text.t
end

class cell_renderer_text : Cell_renderer_text.t -> cell_renderer_text_t

val new_ : unit -> cell_renderer_text_t

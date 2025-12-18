class cell_renderer_text : Cell_renderer_text.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_text_signals.cell_renderer_text_signals
    method align_set : bool
    method set_align_set : bool -> unit
    method background : string
    method set_background : string -> unit
    method background_set : bool
    method set_background_set : bool -> unit
    method editable : bool
    method set_editable : bool -> unit
    method editable_set : bool
    method set_editable_set : bool -> unit
    method ellipsize_set : bool
    method set_ellipsize_set : bool -> unit
    method family : string
    method set_family : string -> unit
    method family_set : bool
    method set_family_set : bool -> unit
    method font : string
    method set_font : string -> unit
    method foreground : string
    method set_foreground : string -> unit
    method foreground_set : bool
    method set_foreground_set : bool -> unit
    method language : string
    method set_language : string -> unit
    method language_set : bool
    method set_language_set : bool -> unit
    method markup : string
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
    method stretch_set : bool
    method set_stretch_set : bool -> unit
    method strikethrough : bool
    method set_strikethrough : bool -> unit
    method strikethrough_set : bool
    method set_strikethrough_set : bool -> unit
    method style_set : bool
    method set_style_set : bool -> unit
    method text : string
    method set_text : string -> unit
    method underline_set : bool
    method set_underline_set : bool -> unit
    method variant_set : bool
    method set_variant_set : bool -> unit
    method weight : int
    method set_weight : int -> unit
    method weight_set : bool
    method set_weight_set : bool -> unit
    method width_chars : int
    method set_width_chars : int -> unit
    method wrap_width : int
    method set_wrap_width : int -> unit
    method set_fixed_height_from_font : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_text : Cell_renderer_text.t
  end


class type cell_renderer_text_t = object
  inherit Cell_renderer.cell_renderer_t

  (** {2:signals Signals} *)

  method on_edited :
    ?after:bool ->
    callback:(path:string -> new_text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** This signal is emitted after [renderer] has been edited.

      It is the responsibility of the application to update the model and store
      [new_text] at the position indicated by [path]. *)

  (** {2:methods Methods} *)

  method set_fixed_height_from_font : int -> unit
  (** Sets the height of a renderer to explicitly be determined by the “font”
      and “y_pad” property set on it. Further changes in these properties do not
      affect the height, so they must be accompanied by a subsequent call to
      this function. Using this function is inflexible, and should really only
      be used if calculating the size of a cell is too slow (ie, a massive
      number of cells displayed). If [number_of_rows] is -1, then the fixed
      height is unset, and the height is determined by the properties again. *)

  (** {2:properties Properties} *)

  method align_set : bool
  (** Get property: align-set *)

  method set_align_set : bool -> unit
  (** Set property: align-set *)

  method alignment : Ocpango.Enums.alignment
  [@@ocaml.doc
    "Specifies how to align the lines of text with respect to each other.\n\n\
     Note that this property describes how to align the lines of text in\n\
     case there are several of them. The \"xalign\" property of \
     [GtkCellRenderer],\n\
     on the other hand, sets the horizontal alignment of the whole text."]

  method attributes : Ocpango.Attr_list.attr_list_t
  (** Get property: attributes *)

  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  (** Set property: attributes *)

  method set_background : string -> unit
  (** Set property: background *)

  method background_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Background color as a [GdkRGBA] *)

  method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Background color as a [GdkRGBA] *)

  method background_set : bool
  (** Get property: background-set *)

  method set_background_set : bool -> unit
  (** Set property: background-set *)

  method editable : bool
  (** Get property: editable *)

  method set_editable : bool -> unit
  (** Set property: editable *)

  method editable_set : bool
  (** Get property: editable-set *)

  method set_editable_set : bool -> unit
  (** Set property: editable-set *)

  method ellipsize : Ocpango.Enums.ellipsizemode
  (** Specifies the preferred place to ellipsize the string, if the cell
      renderer does not have enough room to display the entire string. Setting
      it to [PANGO_ELLIPSIZE_NONE] turns off ellipsizing. See the wrap-width
      property for another way of making the text fit into a given width. *)

  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  (** Specifies the preferred place to ellipsize the string, if the cell
      renderer does not have enough room to display the entire string. Setting
      it to [PANGO_ELLIPSIZE_NONE] turns off ellipsizing. See the wrap-width
      property for another way of making the text fit into a given width. *)

  method ellipsize_set : bool
  (** Get property: ellipsize-set *)

  method set_ellipsize_set : bool -> unit
  (** Set property: ellipsize-set *)

  method family : string
  (** Get property: family *)

  method set_family : string -> unit
  (** Set property: family *)

  method family_set : bool
  (** Get property: family-set *)

  method set_family_set : bool -> unit
  (** Set property: family-set *)

  method font : string
  (** Get property: font *)

  method set_font : string -> unit
  (** Set property: font *)

  method font_desc : Ocpango.Font_description.font_description_t
  (** Get property: font-desc *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Set property: font-desc *)

  method set_foreground : string -> unit
  (** Set property: foreground *)

  method foreground_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Foreground color as a [GdkRGBA] *)

  method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Foreground color as a [GdkRGBA] *)

  method foreground_set : bool
  (** Get property: foreground-set *)

  method set_foreground_set : bool -> unit
  (** Set property: foreground-set *)

  method language : string
  (** Get property: language *)

  method set_language : string -> unit
  (** Set property: language *)

  method language_set : bool
  (** Get property: language-set *)

  method set_language_set : bool -> unit
  (** Set property: language-set *)

  method set_markup : string -> unit
  (** Set property: markup *)

  method max_width_chars : int
  (** The desired maximum width of the cell, in characters. If this property is
      set to -1, the width will be calculated automatically.

      For cell renderers that ellipsize or wrap text; this property controls the
      maximum reported width of the cell. The cell should not receive any
      greater allocation unless it is set to expand in its [GtkCellLayout] and
      all of the cell's siblings have received their natural width. *)

  method set_max_width_chars : int -> unit
  (** The desired maximum width of the cell, in characters. If this property is
      set to -1, the width will be calculated automatically.

      For cell renderers that ellipsize or wrap text; this property controls the
      maximum reported width of the cell. The cell should not receive any
      greater allocation unless it is set to expand in its [GtkCellLayout] and
      all of the cell's siblings have received their natural width. *)

  method placeholder_text : string
  (** The text that will be displayed in the [GtkCellRenderer] if
      [GtkCellRendererText:editable] is [true] and the cell is empty. *)

  method set_placeholder_text : string -> unit
  (** The text that will be displayed in the [GtkCellRenderer] if
      [GtkCellRendererText:editable] is [true] and the cell is empty. *)

  method rise : int
  (** Get property: rise *)

  method set_rise : int -> unit
  (** Set property: rise *)

  method rise_set : bool
  (** Get property: rise-set *)

  method set_rise_set : bool -> unit
  (** Set property: rise-set *)

  method scale : float
  (** Get property: scale *)

  method set_scale : float -> unit
  (** Set property: scale *)

  method scale_set : bool
  (** Get property: scale-set *)

  method set_scale_set : bool -> unit
  (** Set property: scale-set *)

  method single_paragraph_mode : bool
  (** Get property: single-paragraph-mode *)

  method set_single_paragraph_mode : bool -> unit
  (** Set property: single-paragraph-mode *)

  method size : int
  (** Get property: size *)

  method set_size : int -> unit
  (** Set property: size *)

  method size_points : float
  (** Get property: size-points *)

  method set_size_points : float -> unit
  (** Set property: size-points *)

  method size_set : bool
  (** Get property: size-set *)

  method set_size_set : bool -> unit
  (** Set property: size-set *)

  method stretch : Ocpango.Enums.stretch
  (** Get property: stretch *)

  method set_stretch : Ocpango.Enums.stretch -> unit
  (** Set property: stretch *)

  method stretch_set : bool
  (** Get property: stretch-set *)

  method set_stretch_set : bool -> unit
  (** Set property: stretch-set *)

  method strikethrough : bool
  (** Get property: strikethrough *)

  method set_strikethrough : bool -> unit
  (** Set property: strikethrough *)

  method strikethrough_set : bool
  (** Get property: strikethrough-set *)

  method set_strikethrough_set : bool -> unit
  (** Set property: strikethrough-set *)

  method style : Ocpango.Enums.style
  (** Get property: style *)

  method set_style : Ocpango.Enums.style -> unit
  (** Set property: style *)

  method style_set : bool
  (** Get property: style-set *)

  method set_style_set : bool -> unit
  (** Set property: style-set *)

  method text : string
  (** Get property: text *)

  method set_text : string -> unit
  (** Set property: text *)

  method underline : Ocpango.Enums.underline
  (** Get property: underline *)

  method set_underline : Ocpango.Enums.underline -> unit
  (** Set property: underline *)

  method underline_set : bool
  (** Get property: underline-set *)

  method set_underline_set : bool -> unit
  (** Set property: underline-set *)

  method variant : Ocpango.Enums.variant
  (** Get property: variant *)

  method set_variant : Ocpango.Enums.variant -> unit
  (** Set property: variant *)

  method variant_set : bool
  (** Get property: variant-set *)

  method set_variant_set : bool -> unit
  (** Set property: variant-set *)

  method weight : int
  (** Get property: weight *)

  method set_weight : int -> unit
  (** Set property: weight *)

  method weight_set : bool
  (** Get property: weight-set *)

  method set_weight_set : bool -> unit
  (** Set property: weight-set *)

  method width_chars : int
  (** The desired width of the cell, in characters. If this property is set to
      -1, the width will be calculated automatically, otherwise the cell will
      request either 3 characters or the property value, whichever is greater.
  *)

  method set_width_chars : int -> unit
  (** The desired width of the cell, in characters. If this property is set to
      -1, the width will be calculated automatically, otherwise the cell will
      request either 3 characters or the property value, whichever is greater.
  *)

  method wrap_mode : Ocpango.Enums.wrapmode
  (** Specifies how to break the string into multiple lines, if the cell
      renderer does not have enough room to display the entire string. This
      property has no effect unless the wrap-width property is set. *)

  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  (** Specifies how to break the string into multiple lines, if the cell
      renderer does not have enough room to display the entire string. This
      property has no effect unless the wrap-width property is set. *)

  method wrap_width : int
  (** Specifies the minimum width at which the text is wrapped. The wrap-mode
      property can be used to influence at what character positions the line
      breaks can be placed. Setting wrap-width to -1 turns wrapping off. *)

  method set_wrap_width : int -> unit
  (** Specifies the minimum width at which the text is wrapped. The wrap-mode
      property can be used to influence at what character positions the line
      breaks can be placed. Setting wrap-width to -1 turns wrapping off. *)

  (** {2:conversions Conversions} *)

  method as_cell_renderer_text : Raw.Cell_renderer_text.t
end

(* High-level class for CellRendererText *)
class cell_renderer_text (obj : Raw.Cell_renderer_text.t) : cell_renderer_text_t
  =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)

    method on_edited ?(after = false) ~callback () =
      Raw.Cell_renderer_text.on_edited ~after self#as_cell_renderer_text
        ~callback

    method set_fixed_height_from_font : int -> unit =
      fun number_of_rows ->
        Raw.Cell_renderer_text.set_fixed_height_from_font obj number_of_rows

    method align_set = Raw.Cell_renderer_text.get_align_set obj
    method set_align_set v = Raw.Cell_renderer_text.set_align_set obj v
    method alignment = Raw.Cell_renderer_text.get_alignment obj

    method attributes =
      new Ocpango.Attr_list.attr_list
        (Raw.Cell_renderer_text.get_attributes obj)

    method set_attributes : Ocpango.Attr_list.attr_list_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_attributes obj v#as_attr_list

    method set_background v = Raw.Cell_renderer_text.set_background obj v

    method background_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Cell_renderer_text.get_background_rgba obj)

    method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_background_rgba obj v#as_rgb_a

    method background_set = Raw.Cell_renderer_text.get_background_set obj

    method set_background_set v =
      Raw.Cell_renderer_text.set_background_set obj v

    method editable = Raw.Cell_renderer_text.get_editable obj
    method set_editable v = Raw.Cell_renderer_text.set_editable obj v
    method editable_set = Raw.Cell_renderer_text.get_editable_set obj
    method set_editable_set v = Raw.Cell_renderer_text.set_editable_set obj v
    method ellipsize = Raw.Cell_renderer_text.get_ellipsize obj
    method set_ellipsize v = Raw.Cell_renderer_text.set_ellipsize obj v
    method ellipsize_set = Raw.Cell_renderer_text.get_ellipsize_set obj
    method set_ellipsize_set v = Raw.Cell_renderer_text.set_ellipsize_set obj v
    method family = Raw.Cell_renderer_text.get_family obj
    method set_family v = Raw.Cell_renderer_text.set_family obj v
    method family_set = Raw.Cell_renderer_text.get_family_set obj
    method set_family_set v = Raw.Cell_renderer_text.set_family_set obj v
    method font = Raw.Cell_renderer_text.get_font obj
    method set_font v = Raw.Cell_renderer_text.set_font obj v

    method font_desc =
      new Ocpango.Font_description.font_description
        (Raw.Cell_renderer_text.get_font_desc obj)

    method set_font_desc : Ocpango.Font_description.font_description_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_font_desc obj v#as_font_description

    method set_foreground v = Raw.Cell_renderer_text.set_foreground obj v

    method foreground_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Cell_renderer_text.get_foreground_rgba obj)

    method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Cell_renderer_text.set_foreground_rgba obj v#as_rgb_a

    method foreground_set = Raw.Cell_renderer_text.get_foreground_set obj

    method set_foreground_set v =
      Raw.Cell_renderer_text.set_foreground_set obj v

    method language = Raw.Cell_renderer_text.get_language obj
    method set_language v = Raw.Cell_renderer_text.set_language obj v
    method language_set = Raw.Cell_renderer_text.get_language_set obj
    method set_language_set v = Raw.Cell_renderer_text.set_language_set obj v
    method set_markup v = Raw.Cell_renderer_text.set_markup obj v
    method max_width_chars = Raw.Cell_renderer_text.get_max_width_chars obj

    method set_max_width_chars v =
      Raw.Cell_renderer_text.set_max_width_chars obj v

    method placeholder_text = Raw.Cell_renderer_text.get_placeholder_text obj

    method set_placeholder_text v =
      Raw.Cell_renderer_text.set_placeholder_text obj v

    method rise = Raw.Cell_renderer_text.get_rise obj
    method set_rise v = Raw.Cell_renderer_text.set_rise obj v
    method rise_set = Raw.Cell_renderer_text.get_rise_set obj
    method set_rise_set v = Raw.Cell_renderer_text.set_rise_set obj v
    method scale = Raw.Cell_renderer_text.get_scale obj
    method set_scale v = Raw.Cell_renderer_text.set_scale obj v
    method scale_set = Raw.Cell_renderer_text.get_scale_set obj
    method set_scale_set v = Raw.Cell_renderer_text.set_scale_set obj v

    method single_paragraph_mode =
      Raw.Cell_renderer_text.get_single_paragraph_mode obj

    method set_single_paragraph_mode v =
      Raw.Cell_renderer_text.set_single_paragraph_mode obj v

    method size = Raw.Cell_renderer_text.get_size obj
    method set_size v = Raw.Cell_renderer_text.set_size obj v
    method size_points = Raw.Cell_renderer_text.get_size_points obj
    method set_size_points v = Raw.Cell_renderer_text.set_size_points obj v
    method size_set = Raw.Cell_renderer_text.get_size_set obj
    method set_size_set v = Raw.Cell_renderer_text.set_size_set obj v
    method stretch = Raw.Cell_renderer_text.get_stretch obj
    method set_stretch v = Raw.Cell_renderer_text.set_stretch obj v
    method stretch_set = Raw.Cell_renderer_text.get_stretch_set obj
    method set_stretch_set v = Raw.Cell_renderer_text.set_stretch_set obj v
    method strikethrough = Raw.Cell_renderer_text.get_strikethrough obj
    method set_strikethrough v = Raw.Cell_renderer_text.set_strikethrough obj v
    method strikethrough_set = Raw.Cell_renderer_text.get_strikethrough_set obj

    method set_strikethrough_set v =
      Raw.Cell_renderer_text.set_strikethrough_set obj v

    method style = Raw.Cell_renderer_text.get_style obj
    method set_style v = Raw.Cell_renderer_text.set_style obj v
    method style_set = Raw.Cell_renderer_text.get_style_set obj
    method set_style_set v = Raw.Cell_renderer_text.set_style_set obj v
    method text = Raw.Cell_renderer_text.get_text obj
    method set_text v = Raw.Cell_renderer_text.set_text obj v
    method underline = Raw.Cell_renderer_text.get_underline obj
    method set_underline v = Raw.Cell_renderer_text.set_underline obj v
    method underline_set = Raw.Cell_renderer_text.get_underline_set obj
    method set_underline_set v = Raw.Cell_renderer_text.set_underline_set obj v
    method variant = Raw.Cell_renderer_text.get_variant obj
    method set_variant v = Raw.Cell_renderer_text.set_variant obj v
    method variant_set = Raw.Cell_renderer_text.get_variant_set obj
    method set_variant_set v = Raw.Cell_renderer_text.set_variant_set obj v
    method weight = Raw.Cell_renderer_text.get_weight obj
    method set_weight v = Raw.Cell_renderer_text.set_weight obj v
    method weight_set = Raw.Cell_renderer_text.get_weight_set obj
    method set_weight_set v = Raw.Cell_renderer_text.set_weight_set obj v
    method width_chars = Raw.Cell_renderer_text.get_width_chars obj
    method set_width_chars v = Raw.Cell_renderer_text.set_width_chars obj v
    method wrap_mode = Raw.Cell_renderer_text.get_wrap_mode obj
    method set_wrap_mode v = Raw.Cell_renderer_text.set_wrap_mode obj v
    method wrap_width = Raw.Cell_renderer_text.get_wrap_width obj
    method set_wrap_width v = Raw.Cell_renderer_text.set_wrap_width obj v
    method as_cell_renderer_text = obj
  end

let new_ () : cell_renderer_text_t =
  new cell_renderer_text (Raw.Cell_renderer_text.new_ ())

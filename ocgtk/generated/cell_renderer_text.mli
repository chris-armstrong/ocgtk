(** Renders text in a cell

    A [GtkCellRendererText] renders a given text in its cell, using the font,
    color and style information provided by its properties. The text will be
    ellipsized if it is too long and the [GtkCellRendererText:ellipsize]
    property allows it.

    If the [GtkCellRenderer:mode] is [GTK_CELL_RENDERER_MODE_EDITABLE], the
    [GtkCellRendererText] allows to edit its text using an entry.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_text_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_text}. *)

(** {b The methods, signals and properties of a [CellRendererText].}

    Renders text in a cell

    A [GtkCellRendererText] renders a given text in its cell, using the font,
    color and style information provided by its properties. The text will be
    ellipsized if it is too long and the [GtkCellRendererText:ellipsize]
    property allows it.

    If the [GtkCellRenderer:mode] is [GTK_CELL_RENDERER_MODE_EDITABLE], the
    [GtkCellRendererText] allows to edit its text using an entry. *)
class type cell_renderer_text_t = object
  inherit Cell_renderer.cell_renderer_t

  method on_edited :
    ?after:bool ->
    callback:(path:string -> new_text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** This signal is emitted after [renderer] has been edited.

      It is the responsibility of the application to update the model and store
      [new_text] at the position indicated by [path]. *)

  method set_fixed_height_from_font : int -> unit
  (** Sets the height of a renderer to explicitly be determined by the “font”
      and “y_pad” property set on it. Further changes in these properties do not
      affect the height, so they must be accompanied by a subsequent call to
      this function. Using this function is inflexible, and should really only
      be used if calculating the size of a cell is too slow (ie, a massive
      number of cells displayed). If [number_of_rows] is -1, then the fixed
      height is unset, and the height is determined by the properties again. *)

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
      [GtkCellRendererText:editable] is [TRUE] and the cell is empty. *)

  method set_placeholder_text : string -> unit
  (** The text that will be displayed in the [GtkCellRenderer] if
      [GtkCellRendererText:editable] is [TRUE] and the cell is empty. *)

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

  method as_cell_renderer_text : Raw.Cell_renderer_text.t
end

class cell_renderer_text : Raw.Cell_renderer_text.t -> cell_renderer_text_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_text.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_text_t
(** Creates a new [GtkCellRendererText]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with g_object_set()).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

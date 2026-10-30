(** Renders text in a cell

    Its methods, signals and properties are on
    {!class-type-cell_renderer_text_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_text}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererText].}

    Inherits from:
    {{!Ocgtk.Cell_renderer.class-type-cell_renderer_t}Ocgtk.Cell_renderer}

    Renders text in a cell

    A [GtkCellRendererText] renders a given text in its cell, using the font,
    color and style information provided by its properties. The text will be
    ellipsized if it is too long and the [GtkCellRendererText:ellipsize]
    property allows it.

    If the [GtkCellRenderer:mode] is
    {{!Ocgtk.Enums.type-cellrenderermode.constructor-EDITABLE}[GTK_CELL_RENDERER_MODE_EDITABLE]},
    the [GtkCellRendererText] allows to edit its text using an entry. *)
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
  (** Get property: [align-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.align-set.html}upstream
       docs}. *)

  method set_align_set : bool -> unit
  (** Set property: [align-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.align-set.html}upstream
       docs}. *)

  method alignment : Ocpango.Enums.alignment
  [@@ocaml.doc
    "Specifies how to align the lines of text with respect to each other.\n\n\
     Note that this property describes how to align the lines of text in\n\
     case there are several of them. The \"xalign\" property of \
     [GtkCellRenderer],\n\
     on the other hand, sets the horizontal alignment of the whole text."]

  method attributes : Ocpango.Attr_list.attr_list_t
  (** Get property: [attributes] ([Pango.AttrList]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.attributes.html}upstream
       docs}. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  (** Set property: [attributes] ([Pango.AttrList]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.attributes.html}upstream
       docs}. *)

  method set_background : string -> unit
  (** Set property: [background] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.background.html}upstream
       docs}. *)

  method background_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Background color as a [GdkRGBA] *)

  method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Background color as a [GdkRGBA] *)

  method background_set : bool
  (** Get property: [background-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.background-set.html}upstream
       docs}. *)

  method set_background_set : bool -> unit
  (** Set property: [background-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.background-set.html}upstream
       docs}. *)

  method editable : bool
  (** Get property: [editable] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.editable.html}upstream
       docs}. *)

  method set_editable : bool -> unit
  (** Set property: [editable] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.editable.html}upstream
       docs}. *)

  method editable_set : bool
  (** Get property: [editable-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.editable-set.html}upstream
       docs}. *)

  method set_editable_set : bool -> unit
  (** Set property: [editable-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.editable-set.html}upstream
       docs}. *)

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
  (** Get property: [ellipsize-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.ellipsize-set.html}upstream
       docs}. *)

  method set_ellipsize_set : bool -> unit
  (** Set property: [ellipsize-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.ellipsize-set.html}upstream
       docs}. *)

  method family : string
  (** Get property: [family] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.family.html}upstream
       docs}. *)

  method set_family : string -> unit
  (** Set property: [family] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.family.html}upstream
       docs}. *)

  method family_set : bool
  (** Get property: [family-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.family-set.html}upstream
       docs}. *)

  method set_family_set : bool -> unit
  (** Set property: [family-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.family-set.html}upstream
       docs}. *)

  method font : string
  (** Get property: [font] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.font.html}upstream
       docs}. *)

  method set_font : string -> unit
  (** Set property: [font] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.font.html}upstream
       docs}. *)

  method font_desc : Ocpango.Font_description.font_description_t
  (** Get property: [font-desc] ([Pango.FontDescription]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.font-desc.html}upstream
       docs}. *)

  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  (** Set property: [font-desc] ([Pango.FontDescription]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.font-desc.html}upstream
       docs}. *)

  method set_foreground : string -> unit
  (** Set property: [foreground] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.foreground.html}upstream
       docs}. *)

  method foreground_rgba : Ocgdk.Rgb_a.rgb_a_t
  (** Foreground color as a [GdkRGBA] *)

  method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Foreground color as a [GdkRGBA] *)

  method foreground_set : bool
  (** Get property: [foreground-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.foreground-set.html}upstream
       docs}. *)

  method set_foreground_set : bool -> unit
  (** Set property: [foreground-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.foreground-set.html}upstream
       docs}. *)

  method language : string
  (** Get property: [language] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.language.html}upstream
       docs}. *)

  method set_language : string -> unit
  (** Set property: [language] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.language.html}upstream
       docs}. *)

  method language_set : bool
  (** Get property: [language-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.language-set.html}upstream
       docs}. *)

  method set_language_set : bool -> unit
  (** Set property: [language-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.language-set.html}upstream
       docs}. *)

  method set_markup : string -> unit
  (** Set property: [markup] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.markup.html}upstream
       docs}. *)

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
  (** Get property: [rise] ([gint], default [0]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.rise.html}upstream
       docs}. *)

  method set_rise : int -> unit
  (** Set property: [rise] ([gint], default [0]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.rise.html}upstream
       docs}. *)

  method rise_set : bool
  (** Get property: [rise-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.rise-set.html}upstream
       docs}. *)

  method set_rise_set : bool -> unit
  (** Set property: [rise-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.rise-set.html}upstream
       docs}. *)

  method scale : float
  (** Get property: [scale] ([gdouble], default [1.000000]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.scale.html}upstream
       docs}. *)

  method set_scale : float -> unit
  (** Set property: [scale] ([gdouble], default [1.000000]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.scale.html}upstream
       docs}. *)

  method scale_set : bool
  (** Get property: [scale-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.scale-set.html}upstream
       docs}. *)

  method set_scale_set : bool -> unit
  (** Set property: [scale-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.scale-set.html}upstream
       docs}. *)

  method single_paragraph_mode : bool
  (** Get property: [single-paragraph-mode] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.single-paragraph-mode.html}upstream
       docs}. *)

  method set_single_paragraph_mode : bool -> unit
  (** Set property: [single-paragraph-mode] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.single-paragraph-mode.html}upstream
       docs}. *)

  method size : int
  (** Get property: [size] ([gint], default [0]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size.html}upstream
       docs}. *)

  method set_size : int -> unit
  (** Set property: [size] ([gint], default [0]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size.html}upstream
       docs}. *)

  method size_points : float
  (** Get property: [size-points] ([gdouble], default [0.000000]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size-points.html}upstream
       docs}. *)

  method set_size_points : float -> unit
  (** Set property: [size-points] ([gdouble], default [0.000000]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size-points.html}upstream
       docs}. *)

  method size_set : bool
  (** Get property: [size-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size-set.html}upstream
       docs}. *)

  method set_size_set : bool -> unit
  (** Set property: [size-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.size-set.html}upstream
       docs}. *)

  method stretch : Ocpango.Enums.stretch
  (** Get property: [stretch] ([Pango.Stretch], default [PANGO_STRETCH_NORMAL]).
      See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.stretch.html}upstream
       docs}. *)

  method set_stretch : Ocpango.Enums.stretch -> unit
  (** Set property: [stretch] ([Pango.Stretch], default [PANGO_STRETCH_NORMAL]).
      See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.stretch.html}upstream
       docs}. *)

  method stretch_set : bool
  (** Get property: [stretch-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.stretch-set.html}upstream
       docs}. *)

  method set_stretch_set : bool -> unit
  (** Set property: [stretch-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.stretch-set.html}upstream
       docs}. *)

  method strikethrough : bool
  (** Get property: [strikethrough] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.strikethrough.html}upstream
       docs}. *)

  method set_strikethrough : bool -> unit
  (** Set property: [strikethrough] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.strikethrough.html}upstream
       docs}. *)

  method strikethrough_set : bool
  (** Get property: [strikethrough-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.strikethrough-set.html}upstream
       docs}. *)

  method set_strikethrough_set : bool -> unit
  (** Set property: [strikethrough-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.strikethrough-set.html}upstream
       docs}. *)

  method style : Ocpango.Enums.style
  (** Get property: [style] ([Pango.Style], default [PANGO_STYLE_NORMAL]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.style.html}upstream
       docs}. *)

  method set_style : Ocpango.Enums.style -> unit
  (** Set property: [style] ([Pango.Style], default [PANGO_STYLE_NORMAL]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.style.html}upstream
       docs}. *)

  method style_set : bool
  (** Get property: [style-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.style-set.html}upstream
       docs}. *)

  method set_style_set : bool -> unit
  (** Set property: [style-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.style-set.html}upstream
       docs}. *)

  method text : string
  (** Get property: [text] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.text.html}upstream
       docs}. *)

  method set_text : string -> unit
  (** Set property: [text] ([utf8], default [None]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.text.html}upstream
       docs}. *)

  method underline : Ocpango.Enums.underline
  (** Get property: [underline] ([Pango.Underline], default
      [PANGO_UNDERLINE_NONE]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.underline.html}upstream
       docs}. *)

  method set_underline : Ocpango.Enums.underline -> unit
  (** Set property: [underline] ([Pango.Underline], default
      [PANGO_UNDERLINE_NONE]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.underline.html}upstream
       docs}. *)

  method underline_set : bool
  (** Get property: [underline-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.underline-set.html}upstream
       docs}. *)

  method set_underline_set : bool -> unit
  (** Set property: [underline-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.underline-set.html}upstream
       docs}. *)

  method variant : Ocpango.Enums.variant
  (** Get property: [variant] ([Pango.Variant], default [PANGO_VARIANT_NORMAL]).
      See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.variant.html}upstream
       docs}. *)

  method set_variant : Ocpango.Enums.variant -> unit
  (** Set property: [variant] ([Pango.Variant], default [PANGO_VARIANT_NORMAL]).
      See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.variant.html}upstream
       docs}. *)

  method variant_set : bool
  (** Get property: [variant-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.variant-set.html}upstream
       docs}. *)

  method set_variant_set : bool -> unit
  (** Set property: [variant-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.variant-set.html}upstream
       docs}. *)

  method weight : int
  (** Get property: [weight] ([gint], default [400]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.weight.html}upstream
       docs}. *)

  method set_weight : int -> unit
  (** Set property: [weight] ([gint], default [400]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.weight.html}upstream
       docs}. *)

  method weight_set : bool
  (** Get property: [weight-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.weight-set.html}upstream
       docs}. *)

  method set_weight_set : bool -> unit
  (** Set property: [weight-set] ([gboolean], default [false]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererText.weight-set.html}upstream
       docs}. *)

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

class cell_renderer_text : Raw.Cell_renderer_text.t -> cell_renderer_text_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_text.t}. *)

(** {1:description Description}

    Renders text in a cell

    A [GtkCellRendererText] renders a given text in its cell, using the font,
    color and style information provided by its properties. The text will be
    ellipsized if it is too long and the [GtkCellRendererText:ellipsize]
    property allows it.

    If the [GtkCellRenderer:mode] is
    {{!Ocgtk.Enums.type-cellrenderermode.constructor-EDITABLE}[GTK_CELL_RENDERER_MODE_EDITABLE]},
    the [GtkCellRendererText] allows to edit its text using an entry. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_text_t
(** Creates a new [GtkCellRendererText]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with [g_object_set ()]).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

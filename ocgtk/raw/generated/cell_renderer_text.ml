(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererText: CellRendererText *)

(** Renders text in a cell

    A [GtkCellRendererText] renders a given text in its cell, using the font,
    color and style information provided by its properties. The text will be
    ellipsized if it is too long and the [GtkCellRendererText:ellipsize]
    property allows it.

    If the [GtkCellRenderer:mode] is
    {{!Ocgtk.Enums.type-cellrenderermode.constructor-EDITABLE}[GTK_CELL_RENDERER_MODE_EDITABLE]},
    the [GtkCellRendererText] allows to edit its text using an entry.

    The class built on this module is in {!Ocgtk.Cell_renderer_text}. *)

type t =
  [ `cell_renderer_text | `cell_renderer | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_text_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_text_new"
(** Creates a new [GtkCellRendererText]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with [g_object_set ()]).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

(* Methods *)

external set_fixed_height_from_font : t -> int -> unit
  = "ml_gtk_cell_renderer_text_set_fixed_height_from_font"
(** Sets the height of a renderer to explicitly be determined by the “font” and
    “y_pad” property set on it. Further changes in these properties do not
    affect the height, so they must be accompanied by a subsequent call to this
    function. Using this function is inflexible, and should really only be used
    if calculating the size of a cell is too slow (ie, a massive number of cells
    displayed). If [number_of_rows] is -1, then the fixed height is unset, and
    the height is determined by the properties again. *)

(* Properties *)

external get_align_set : t -> bool = "ml_gtk_cell_renderer_text_get_align_set"
(** Get property: align-set *)

external set_align_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_align_set"
(** Set property: align-set *)

external get_alignment : t -> Ocpango_enums.alignment
  = "ml_gtk_cell_renderer_text_get_alignment"
[@@ocaml.doc
  "Specifies how to align the lines of text with respect to each other.\n\n\
   Note that this property describes how to align the lines of text in\n\
   case there are several of them. The \"xalign\" property of [GtkCellRenderer],\n\
   on the other hand, sets the horizontal alignment of the whole text."]

external set_alignment : t -> Ocpango_enums.alignment -> unit
  = "ml_gtk_cell_renderer_text_set_alignment"
[@@ocaml.doc
  "Specifies how to align the lines of text with respect to each other.\n\n\
   Note that this property describes how to align the lines of text in\n\
   case there are several of them. The \"xalign\" property of [GtkCellRenderer],\n\
   on the other hand, sets the horizontal alignment of the whole text."]

external get_attributes : t -> Ocpango_raw.Attr_list.t
  = "ml_gtk_cell_renderer_text_get_attributes"
(** Get property: attributes *)

external set_attributes : t -> Ocpango_raw.Attr_list.t -> unit
  = "ml_gtk_cell_renderer_text_set_attributes"
(** Set property: attributes *)

external set_background : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_background"
(** Set property: background *)

external get_background_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_cell_renderer_text_get_background_rgba"
(** Background color as a [GdkRGBA] *)

external set_background_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_cell_renderer_text_set_background_rgba"
(** Background color as a [GdkRGBA] *)

external get_background_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_background_set"
(** Get property: background-set *)

external set_background_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_background_set"
(** Set property: background-set *)

external get_editable : t -> bool = "ml_gtk_cell_renderer_text_get_editable"
(** Get property: editable *)

external set_editable : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_editable"
(** Set property: editable *)

external get_editable_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_editable_set"
(** Get property: editable-set *)

external set_editable_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_editable_set"
(** Set property: editable-set *)

external get_ellipsize : t -> Ocpango_enums.ellipsizemode
  = "ml_gtk_cell_renderer_text_get_ellipsize"
(** Specifies the preferred place to ellipsize the string, if the cell renderer
    does not have enough room to display the entire string. Setting it to
    [PANGO_ELLIPSIZE_NONE] turns off ellipsizing. See the wrap-width property
    for another way of making the text fit into a given width. *)

external set_ellipsize : t -> Ocpango_enums.ellipsizemode -> unit
  = "ml_gtk_cell_renderer_text_set_ellipsize"
(** Specifies the preferred place to ellipsize the string, if the cell renderer
    does not have enough room to display the entire string. Setting it to
    [PANGO_ELLIPSIZE_NONE] turns off ellipsizing. See the wrap-width property
    for another way of making the text fit into a given width. *)

external get_ellipsize_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_ellipsize_set"
(** Get property: ellipsize-set *)

external set_ellipsize_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_ellipsize_set"
(** Set property: ellipsize-set *)

external get_family : t -> string = "ml_gtk_cell_renderer_text_get_family"
(** Get property: family *)

external set_family : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_family"
(** Set property: family *)

external get_family_set : t -> bool = "ml_gtk_cell_renderer_text_get_family_set"
(** Get property: family-set *)

external set_family_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_family_set"
(** Set property: family-set *)

external get_font : t -> string = "ml_gtk_cell_renderer_text_get_font"
(** Get property: font *)

external set_font : t -> string -> unit = "ml_gtk_cell_renderer_text_set_font"
(** Set property: font *)

external get_font_desc : t -> Ocpango_raw.Font_description.t
  = "ml_gtk_cell_renderer_text_get_font_desc"
(** Get property: font-desc *)

external set_font_desc : t -> Ocpango_raw.Font_description.t -> unit
  = "ml_gtk_cell_renderer_text_set_font_desc"
(** Set property: font-desc *)

external set_foreground : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_foreground"
(** Set property: foreground *)

external get_foreground_rgba : t -> Ocgdk_raw.Rgb_a.t
  = "ml_gtk_cell_renderer_text_get_foreground_rgba"
(** Foreground color as a [GdkRGBA] *)

external set_foreground_rgba : t -> Ocgdk_raw.Rgb_a.t -> unit
  = "ml_gtk_cell_renderer_text_set_foreground_rgba"
(** Foreground color as a [GdkRGBA] *)

external get_foreground_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_foreground_set"
(** Get property: foreground-set *)

external set_foreground_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_foreground_set"
(** Set property: foreground-set *)

external get_language : t -> string = "ml_gtk_cell_renderer_text_get_language"
(** Get property: language *)

external set_language : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_language"
(** Set property: language *)

external get_language_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_language_set"
(** Get property: language-set *)

external set_language_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_language_set"
(** Set property: language-set *)

external set_markup : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_markup"
(** Set property: markup *)

external get_max_width_chars : t -> int
  = "ml_gtk_cell_renderer_text_get_max_width_chars"
(** The desired maximum width of the cell, in characters. If this property is
    set to -1, the width will be calculated automatically.

    For cell renderers that ellipsize or wrap text; this property controls the
    maximum reported width of the cell. The cell should not receive any greater
    allocation unless it is set to expand in its [GtkCellLayout] and all of the
    cell's siblings have received their natural width. *)

external set_max_width_chars : t -> int -> unit
  = "ml_gtk_cell_renderer_text_set_max_width_chars"
(** The desired maximum width of the cell, in characters. If this property is
    set to -1, the width will be calculated automatically.

    For cell renderers that ellipsize or wrap text; this property controls the
    maximum reported width of the cell. The cell should not receive any greater
    allocation unless it is set to expand in its [GtkCellLayout] and all of the
    cell's siblings have received their natural width. *)

external get_placeholder_text : t -> string
  = "ml_gtk_cell_renderer_text_get_placeholder_text"
(** The text that will be displayed in the [GtkCellRenderer] if
    [GtkCellRendererText:editable] is [true] and the cell is empty. *)

external set_placeholder_text : t -> string -> unit
  = "ml_gtk_cell_renderer_text_set_placeholder_text"
(** The text that will be displayed in the [GtkCellRenderer] if
    [GtkCellRendererText:editable] is [true] and the cell is empty. *)

external get_rise : t -> int = "ml_gtk_cell_renderer_text_get_rise"
(** Get property: rise *)

external set_rise : t -> int -> unit = "ml_gtk_cell_renderer_text_set_rise"
(** Set property: rise *)

external get_rise_set : t -> bool = "ml_gtk_cell_renderer_text_get_rise_set"
(** Get property: rise-set *)

external set_rise_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_rise_set"
(** Set property: rise-set *)

external get_scale : t -> float = "ml_gtk_cell_renderer_text_get_scale"
(** Get property: scale *)

external set_scale : t -> float -> unit = "ml_gtk_cell_renderer_text_set_scale"
(** Set property: scale *)

external get_scale_set : t -> bool = "ml_gtk_cell_renderer_text_get_scale_set"
(** Get property: scale-set *)

external set_scale_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_scale_set"
(** Set property: scale-set *)

external get_single_paragraph_mode : t -> bool
  = "ml_gtk_cell_renderer_text_get_single_paragraph_mode"
(** Get property: single-paragraph-mode *)

external set_single_paragraph_mode : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_single_paragraph_mode"
(** Set property: single-paragraph-mode *)

external get_size : t -> int = "ml_gtk_cell_renderer_text_get_size"
(** Get property: size *)

external set_size : t -> int -> unit = "ml_gtk_cell_renderer_text_set_size"
(** Set property: size *)

external get_size_points : t -> float
  = "ml_gtk_cell_renderer_text_get_size_points"
(** Get property: size-points *)

external set_size_points : t -> float -> unit
  = "ml_gtk_cell_renderer_text_set_size_points"
(** Set property: size-points *)

external get_size_set : t -> bool = "ml_gtk_cell_renderer_text_get_size_set"
(** Get property: size-set *)

external set_size_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_size_set"
(** Set property: size-set *)

external get_stretch : t -> Ocpango_enums.stretch
  = "ml_gtk_cell_renderer_text_get_stretch"
(** Get property: stretch *)

external set_stretch : t -> Ocpango_enums.stretch -> unit
  = "ml_gtk_cell_renderer_text_set_stretch"
(** Set property: stretch *)

external get_stretch_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_stretch_set"
(** Get property: stretch-set *)

external set_stretch_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_stretch_set"
(** Set property: stretch-set *)

external get_strikethrough : t -> bool
  = "ml_gtk_cell_renderer_text_get_strikethrough"
(** Get property: strikethrough *)

external set_strikethrough : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_strikethrough"
(** Set property: strikethrough *)

external get_strikethrough_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_strikethrough_set"
(** Get property: strikethrough-set *)

external set_strikethrough_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_strikethrough_set"
(** Set property: strikethrough-set *)

external get_style : t -> Ocpango_enums.style
  = "ml_gtk_cell_renderer_text_get_style"
(** Get property: style *)

external set_style : t -> Ocpango_enums.style -> unit
  = "ml_gtk_cell_renderer_text_set_style"
(** Set property: style *)

external get_style_set : t -> bool = "ml_gtk_cell_renderer_text_get_style_set"
(** Get property: style-set *)

external set_style_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_style_set"
(** Set property: style-set *)

external get_text : t -> string = "ml_gtk_cell_renderer_text_get_text"
(** Get property: text *)

external set_text : t -> string -> unit = "ml_gtk_cell_renderer_text_set_text"
(** Set property: text *)

external get_underline : t -> Ocpango_enums.underline
  = "ml_gtk_cell_renderer_text_get_underline"
(** Get property: underline *)

external set_underline : t -> Ocpango_enums.underline -> unit
  = "ml_gtk_cell_renderer_text_set_underline"
(** Set property: underline *)

external get_underline_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_underline_set"
(** Get property: underline-set *)

external set_underline_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_underline_set"
(** Set property: underline-set *)

external get_variant : t -> Ocpango_enums.variant
  = "ml_gtk_cell_renderer_text_get_variant"
(** Get property: variant *)

external set_variant : t -> Ocpango_enums.variant -> unit
  = "ml_gtk_cell_renderer_text_set_variant"
(** Set property: variant *)

external get_variant_set : t -> bool
  = "ml_gtk_cell_renderer_text_get_variant_set"
(** Get property: variant-set *)

external set_variant_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_variant_set"
(** Set property: variant-set *)

external get_weight : t -> int = "ml_gtk_cell_renderer_text_get_weight"
(** Get property: weight *)

external set_weight : t -> int -> unit = "ml_gtk_cell_renderer_text_set_weight"
(** Set property: weight *)

external get_weight_set : t -> bool = "ml_gtk_cell_renderer_text_get_weight_set"
(** Get property: weight-set *)

external set_weight_set : t -> bool -> unit
  = "ml_gtk_cell_renderer_text_set_weight_set"
(** Set property: weight-set *)

external get_width_chars : t -> int
  = "ml_gtk_cell_renderer_text_get_width_chars"
(** The desired width of the cell, in characters. If this property is set to -1,
    the width will be calculated automatically, otherwise the cell will request
    either 3 characters or the property value, whichever is greater. *)

external set_width_chars : t -> int -> unit
  = "ml_gtk_cell_renderer_text_set_width_chars"
(** The desired width of the cell, in characters. If this property is set to -1,
    the width will be calculated automatically, otherwise the cell will request
    either 3 characters or the property value, whichever is greater. *)

external get_wrap_mode : t -> Ocpango_enums.wrapmode
  = "ml_gtk_cell_renderer_text_get_wrap_mode"
(** Specifies how to break the string into multiple lines, if the cell renderer
    does not have enough room to display the entire string. This property has no
    effect unless the wrap-width property is set. *)

external set_wrap_mode : t -> Ocpango_enums.wrapmode -> unit
  = "ml_gtk_cell_renderer_text_set_wrap_mode"
(** Specifies how to break the string into multiple lines, if the cell renderer
    does not have enough room to display the entire string. This property has no
    effect unless the wrap-width property is set. *)

external get_wrap_width : t -> int = "ml_gtk_cell_renderer_text_get_wrap_width"
(** Specifies the minimum width at which the text is wrapped. The wrap-mode
    property can be used to influence at what character positions the line
    breaks can be placed. Setting wrap-width to -1 turns wrapping off. *)

external set_wrap_width : t -> int -> unit
  = "ml_gtk_cell_renderer_text_set_wrap_width"
(** Specifies the minimum width at which the text is wrapped. The wrap-mode
    property can be used to influence at what character positions the line
    breaks can be placed. Setting wrap-width to -1 turns wrapping off. *)

let on_edited ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let path =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        let new_text =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_string v
        in
        callback ~path ~new_text)
  in
  Gobject.Signal.connect obj ~name:"edited" ~callback:closure
    ~after:(Option.value after ~default:false)

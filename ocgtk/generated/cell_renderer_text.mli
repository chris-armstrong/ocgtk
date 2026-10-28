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

(** The methods, signals and properties of a [CellRendererText]. *)
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
  method set_align_set : bool -> unit
  method alignment : Ocpango.Enums.alignment
  method attributes : Ocpango.Attr_list.attr_list_t
  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  method set_background : string -> unit
  method background_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method background_set : bool
  method set_background_set : bool -> unit
  method editable : bool
  method set_editable : bool -> unit
  method editable_set : bool
  method set_editable_set : bool -> unit
  method ellipsize : Ocpango.Enums.ellipsizemode
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method ellipsize_set : bool
  method set_ellipsize_set : bool -> unit
  method family : string
  method set_family : string -> unit
  method family_set : bool
  method set_family_set : bool -> unit
  method font : string
  method set_font : string -> unit
  method font_desc : Ocpango.Font_description.font_description_t
  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  method set_foreground : string -> unit
  method foreground_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_foreground_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
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
  method stretch : Ocpango.Enums.stretch
  method set_stretch : Ocpango.Enums.stretch -> unit
  method stretch_set : bool
  method set_stretch_set : bool -> unit
  method strikethrough : bool
  method set_strikethrough : bool -> unit
  method strikethrough_set : bool
  method set_strikethrough_set : bool -> unit
  method style : Ocpango.Enums.style
  method set_style : Ocpango.Enums.style -> unit
  method style_set : bool
  method set_style_set : bool -> unit
  method text : string
  method set_text : string -> unit
  method underline : Ocpango.Enums.underline
  method set_underline : Ocpango.Enums.underline -> unit
  method underline_set : bool
  method set_underline_set : bool -> unit
  method variant : Ocpango.Enums.variant
  method set_variant : Ocpango.Enums.variant -> unit
  method variant_set : bool
  method set_variant_set : bool -> unit
  method weight : int
  method set_weight : int -> unit
  method weight_set : bool
  method set_weight_set : bool -> unit
  method width_chars : int
  method set_width_chars : int -> unit
  method wrap_mode : Ocpango.Enums.wrapmode
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method wrap_width : int
  method set_wrap_width : int -> unit
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

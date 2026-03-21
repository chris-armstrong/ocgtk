(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type analysis_t = GAnalysis.analysis_t
class type attr_class_t = GAttr_class.attr_class_t
class type attr_color_t = GAttr_color.attr_color_t
class type attr_float_t = GAttr_float.attr_float_t
class type attr_font_desc_t = GAttr_font_desc.attr_font_desc_t
class type attr_font_features_t = GAttr_font_features.attr_font_features_t
class type attr_int_t = GAttr_int.attr_int_t
class type attr_iterator_t = GAttr_iterator.attr_iterator_t
class type attr_language_t = GAttr_language.attr_language_t
class type attr_list_t = GAttr_list.attr_list_t
class type attr_shape_t = GAttr_shape.attr_shape_t
class type attr_size_t = GAttr_size.attr_size_t
class type attr_string_t = GAttr_string.attr_string_t
class type attribute_t = GAttribute.attribute_t
class type color_t = GColor.color_t
class type context_t = GContext_and__font_and__font_map_and__fontset.context_t
class type coverage_t = GCoverage.coverage_t
class type font_t = GContext_and__font_and__font_map_and__fontset.font_t
class type font_description_t = GFont_description.font_description_t
class type font_face_t = GFont_face_and__font_family.font_face_t
class type font_family_t = GFont_face_and__font_family.font_family_t
class type font_map_t = GContext_and__font_and__font_map_and__fontset.font_map_t
class type font_metrics_t = GFont_metrics.font_metrics_t
class type fontset_t = GContext_and__font_and__font_map_and__fontset.fontset_t
class type fontset_simple_t = GFontset_simple.fontset_simple_t
class type glyph_geometry_t = GGlyph_geometry.glyph_geometry_t
class type glyph_info_t = GGlyph_info.glyph_info_t
class type glyph_item_t = GGlyph_item.glyph_item_t
class type glyph_item_iter_t = GGlyph_item_iter.glyph_item_iter_t
class type glyph_string_t = GGlyph_string.glyph_string_t
class type glyph_vis_attr_t = GGlyph_vis_attr.glyph_vis_attr_t
class type item_t = GItem.item_t
class type language_t = GLanguage.language_t
class type layout_t = GLayout_and__layout_iter.layout_t
class type layout_iter_t = GLayout_and__layout_iter.layout_iter_t
class type layout_line_t = GLayout_line.layout_line_t
class type log_attr_t = GLog_attr.log_attr_t
class type matrix_t = GMatrix.matrix_t
class type rectangle_t = GRectangle.rectangle_t
class type renderer_t = GRenderer.renderer_t
class type script_iter_t = GScript_iter.script_iter_t
class type tab_array_t = GTab_array.tab_array_t

class analysis : Analysis.t -> analysis_t
class attr_class : Attr_class.t -> attr_class_t
class attr_color : Attr_color.t -> attr_color_t
class attr_float : Attr_float.t -> attr_float_t
class attr_font_desc : Attr_font_desc.t -> attr_font_desc_t
class attr_font_features : Attr_font_features.t -> attr_font_features_t
class attr_int : Attr_int.t -> attr_int_t
class attr_iterator : Attr_iterator.t -> attr_iterator_t
class attr_language : Attr_language.t -> attr_language_t
class attr_list : Attr_list.t -> attr_list_t
class attr_shape : Attr_shape.t -> attr_shape_t
class attr_size : Attr_size.t -> attr_size_t
class attr_string : Attr_string.t -> attr_string_t
class attribute : Attribute.t -> attribute_t
class color : Color.t -> color_t
class context : Context_and__font_and__font_map_and__fontset.Context.t -> context_t
class coverage : Coverage.t -> coverage_t
class font : Context_and__font_and__font_map_and__fontset.Font.t -> font_t
class font_description : Font_description.t -> font_description_t
class font_face : Font_face_and__font_family.Font_face.t -> font_face_t
class font_family : Font_face_and__font_family.Font_family.t -> font_family_t
class font_map : Context_and__font_and__font_map_and__fontset.Font_map.t -> font_map_t
class font_metrics : Font_metrics.t -> font_metrics_t
class fontset : Context_and__font_and__font_map_and__fontset.Fontset.t -> fontset_t
class fontset_simple : Fontset_simple.t -> fontset_simple_t
class glyph_geometry : Glyph_geometry.t -> glyph_geometry_t
class glyph_info : Glyph_info.t -> glyph_info_t
class glyph_item : Glyph_item.t -> glyph_item_t
class glyph_item_iter : Glyph_item_iter.t -> glyph_item_iter_t
class glyph_string : Glyph_string.t -> glyph_string_t
class glyph_vis_attr : Glyph_vis_attr.t -> glyph_vis_attr_t
class item : Item.t -> item_t
class language : Language.t -> language_t
class layout : Layout_and__layout_iter.Layout.t -> layout_t
class layout_iter : Layout_and__layout_iter.Layout_iter.t -> layout_iter_t
class layout_line : Layout_line.t -> layout_line_t
class log_attr : Log_attr.t -> log_attr_t
class matrix : Matrix.t -> matrix_t
class rectangle : Rectangle.t -> rectangle_t
class renderer : Renderer.t -> renderer_t
class script_iter : Script_iter.t -> script_iter_t
class tab_array : Tab_array.t -> tab_array_t

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Analysis = Analysis
  module Attr_class = Attr_class
  module Attr_color = Attr_color
  module Attr_float = Attr_float
  module Attr_font_desc = Attr_font_desc
  module Attr_font_features = Attr_font_features
  module Attr_int = Attr_int
  module Attr_iterator = Attr_iterator
  module Attr_language = Attr_language
  module Attr_list = Attr_list
  module Attr_shape = Attr_shape
  module Attr_size = Attr_size
  module Attr_string = Attr_string
  module Attribute = Attribute
  module Color = Color
  module Context = Context_and__font_and__font_map_and__fontset.Context
  module Coverage = Coverage
  module Font = Context_and__font_and__font_map_and__fontset.Font
  module Font_description = Font_description
  module Font_face = Font_face_and__font_family.Font_face
  module Font_family = Font_face_and__font_family.Font_family
  module Font_map = Context_and__font_and__font_map_and__fontset.Font_map
  module Font_metrics = Font_metrics
  module Fontset = Context_and__font_and__font_map_and__fontset.Fontset
  module Fontset_simple = Fontset_simple
  module Glyph_geometry = Glyph_geometry
  module Glyph_info = Glyph_info
  module Glyph_item = Glyph_item
  module Glyph_item_iter = Glyph_item_iter
  module Glyph_string = Glyph_string
  module Glyph_vis_attr = Glyph_vis_attr
  module Item = Item
  module Language = Language
  module Layout = Layout_and__layout_iter.Layout
  module Layout_iter = Layout_and__layout_iter.Layout_iter
  module Layout_line = Layout_line
  module Log_attr = Log_attr
  module Matrix = Matrix
  module Rectangle = Rectangle
  module Renderer = Renderer
  module Script_iter = Script_iter
  module Tab_array = Tab_array
end

(** {1 Enumerations and Bitfields} *)

type alignment = Pango_enums.alignment
type attrtype = Pango_enums.attrtype
type baselineshift = Pango_enums.baselineshift
type biditype = Pango_enums.biditype
type coveragelevel = Pango_enums.coveragelevel
type direction = Pango_enums.direction
type ellipsizemode = Pango_enums.ellipsizemode
type fontscale = Pango_enums.fontscale
type gravity = Pango_enums.gravity
type gravityhint = Pango_enums.gravityhint
type layoutdeserializeerror = Pango_enums.layoutdeserializeerror
type overline = Pango_enums.overline
type renderpart = Pango_enums.renderpart
type script = Pango_enums.script
type stretch = Pango_enums.stretch
type style = Pango_enums.style
type tabalign = Pango_enums.tabalign
type texttransform = Pango_enums.texttransform
type underline = Pango_enums.underline
type variant = Pango_enums.variant
type weight = Pango_enums.weight
type wrapmode = Pango_enums.wrapmode
type fontmask = Pango_enums.fontmask
type layoutdeserializeflags = Pango_enums.layoutdeserializeflags
type layoutserializeflags = Pango_enums.layoutserializeflags
type shapeflags = Pango_enums.shapeflags
type showflags = Pango_enums.showflags

(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class analysis : Analysis.t -> GAnalysis.analysis
class attr_class : Attr_class.t -> GAttr_class.attr_class
class attr_color : Attr_color.t -> GAttr_color.attr_color
class attr_float : Attr_float.t -> GAttr_float.attr_float
class attr_font_desc : Attr_font_desc.t -> GAttr_font_desc.attr_font_desc
class attr_font_features : Attr_font_features.t -> GAttr_font_features.attr_font_features
class attr_int : Attr_int.t -> GAttr_int.attr_int
class attr_iterator : Attr_iterator.t -> GAttr_iterator.attr_iterator
class attr_language : Attr_language.t -> GAttr_language.attr_language
class attr_list : Attr_list.t -> GAttr_list.attr_list
class attr_shape : Attr_shape.t -> GAttr_shape.attr_shape
class attr_size : Attr_size.t -> GAttr_size.attr_size
class attr_string : Attr_string.t -> GAttr_string.attr_string
class attribute : Attribute.t -> GAttribute.attribute
class color : Color.t -> GColor.color
class context : Context_and__font_and__font_map_and__fontset.Context.t -> GContext_and__font_and__font_map_and__fontset.context
class coverage : Coverage.t -> GCoverage.coverage
class font : Context_and__font_and__font_map_and__fontset.Font.t -> GContext_and__font_and__font_map_and__fontset.font
class font_description : Font_description.t -> GFont_description.font_description
class font_face : Font_face_and__font_family.Font_face.t -> GFont_face_and__font_family.font_face
class font_family : Font_face_and__font_family.Font_family.t -> GFont_face_and__font_family.font_family
class font_map : Context_and__font_and__font_map_and__fontset.Font_map.t -> GContext_and__font_and__font_map_and__fontset.font_map
class font_metrics : Font_metrics.t -> GFont_metrics.font_metrics
class fontset : Context_and__font_and__font_map_and__fontset.Fontset.t -> GContext_and__font_and__font_map_and__fontset.fontset
class fontset_simple : Fontset_simple.t -> GFontset_simple.fontset_simple
class glyph_geometry : Glyph_geometry.t -> GGlyph_geometry.glyph_geometry
class glyph_info : Glyph_info.t -> GGlyph_info.glyph_info
class glyph_item : Glyph_item.t -> GGlyph_item.glyph_item
class glyph_item_iter : Glyph_item_iter.t -> GGlyph_item_iter.glyph_item_iter
class glyph_string : Glyph_string.t -> GGlyph_string.glyph_string
class glyph_vis_attr : Glyph_vis_attr.t -> GGlyph_vis_attr.glyph_vis_attr
class item : Item.t -> GItem.item
class language : Language.t -> GLanguage.language
class layout : Layout_and__layout_iter.Layout.t -> GLayout_and__layout_iter.layout
class layout_iter : Layout_and__layout_iter.Layout_iter.t -> GLayout_and__layout_iter.layout_iter
class layout_line : Layout_line.t -> GLayout_line.layout_line
class log_attr : Log_attr.t -> GLog_attr.log_attr
class matrix : Matrix.t -> GMatrix.matrix
class rectangle : Rectangle.t -> GRectangle.rectangle
class renderer : Renderer.t -> GRenderer.renderer
class script_iter : Script_iter.t -> GScript_iter.script_iter
class tab_array : Tab_array.t -> GTab_array.tab_array

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

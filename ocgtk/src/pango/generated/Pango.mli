(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class context : Context_and__font_and__font_map_and__fontset.Context.t -> GContext_and__font_and__font_map_and__fontset.context
class coverage : Coverage.t -> GCoverage.coverage
class font : Context_and__font_and__font_map_and__fontset.Font.t -> GContext_and__font_and__font_map_and__fontset.font
class font_face : Font_face_and__font_family.Font_face.t -> GFont_face_and__font_family.font_face
class font_family : Font_face_and__font_family.Font_family.t -> GFont_face_and__font_family.font_family
class font_map : Context_and__font_and__font_map_and__fontset.Font_map.t -> GContext_and__font_and__font_map_and__fontset.font_map
class fontset : Context_and__font_and__font_map_and__fontset.Fontset.t -> GContext_and__font_and__font_map_and__fontset.fontset
class fontset_simple : Fontset_simple.t -> GFontset_simple.fontset_simple
class layout : Layout_and__layout_iter.Layout.t -> GLayout_and__layout_iter.layout
class renderer : Renderer.t -> GRenderer.renderer

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Context = Context_and__font_and__font_map_and__fontset.Context
  module Coverage = Coverage
  module Font = Context_and__font_and__font_map_and__fontset.Font
  module Font_face = Font_face_and__font_family.Font_face
  module Font_family = Font_face_and__font_family.Font_family
  module Font_map = Context_and__font_and__font_map_and__fontset.Font_map
  module Fontset = Context_and__font_and__font_map_and__fontset.Fontset
  module Fontset_simple = Fontset_simple
  module Layout = Layout_and__layout_iter.Layout
  module Renderer = Renderer
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

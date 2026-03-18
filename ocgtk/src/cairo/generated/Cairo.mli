(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class context : Context.t -> GContext.context
class device : Device.t -> GDevice.device
class font_face : Font_face.t -> GFont_face.font_face
class font_options : Font_options.t -> GFont_options.font_options
class matrix : Matrix.t -> GMatrix.matrix
class path : Path.t -> GPath.path
class pattern : Pattern.t -> GPattern.pattern
class rectangle : Rectangle.t -> GRectangle.rectangle
class rectangle_int : Rectangle_int.t -> GRectangle_int.rectangle_int
class region : Region.t -> GRegion.region
class scaled_font : Scaled_font.t -> GScaled_font.scaled_font
class surface : Surface.t -> GSurface.surface

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module Context = Context
  module Device = Device
  module Font_face = Font_face
  module Font_options = Font_options
  module Matrix = Matrix
  module Path = Path
  module Pattern = Pattern
  module Rectangle = Rectangle
  module Rectangle_int = Rectangle_int
  module Region = Region
  module Scaled_font = Scaled_font
  module Surface = Surface
end

(** {1 Enumerations and Bitfields} *)

type antialias = Cairo_enums.antialias
type content = Cairo_enums.content
type devicetype = Cairo_enums.devicetype
type extend = Cairo_enums.extend
type fillrule = Cairo_enums.fillrule
type filter = Cairo_enums.filter
type fontslant = Cairo_enums.fontslant
type fonttype = Cairo_enums.fonttype
type fontweight = Cairo_enums.fontweight
type format = Cairo_enums.format
type hintmetrics = Cairo_enums.hintmetrics
type hintstyle = Cairo_enums.hintstyle
type linecap = Cairo_enums.linecap
type linejoin = Cairo_enums.linejoin
type operator = Cairo_enums.operator
type pathdatatype = Cairo_enums.pathdatatype
type patterntype = Cairo_enums.patterntype
type regionoverlap = Cairo_enums.regionoverlap
type status = Cairo_enums.status
type subpixelorder = Cairo_enums.subpixelorder
type surfacetype = Cairo_enums.surfacetype
type textclusterflags = Cairo_enums.textclusterflags

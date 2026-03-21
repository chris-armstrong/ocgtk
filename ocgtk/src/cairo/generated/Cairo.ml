(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** Classes and Interfaces *)

class type context_t = GContext.context_t
class type device_t = GDevice.device_t
class type font_face_t = GFont_face.font_face_t
class type font_options_t = GFont_options.font_options_t
class type matrix_t = GMatrix.matrix_t
class type path_t = GPath.path_t
class type pattern_t = GPattern.pattern_t
class type rectangle_t = GRectangle.rectangle_t
class type rectangle_int_t = GRectangle_int.rectangle_int_t
class type region_t = GRegion.region_t
class type scaled_font_t = GScaled_font.scaled_font_t
class type surface_t = GSurface.surface_t

class context = GContext.context
class device = GDevice.device
class font_face = GFont_face.font_face
class font_options = GFont_options.font_options
class matrix = GMatrix.matrix
class path = GPath.path
class pattern = GPattern.pattern
class rectangle = GRectangle.rectangle
class rectangle_int = GRectangle_int.rectangle_int
class region = GRegion.region
class scaled_font = GScaled_font.scaled_font
class surface = GSurface.surface

(** Layer 1 Module Wrappers *)
module Wrappers = struct
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

(** Enumerations and Bitfields *)

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

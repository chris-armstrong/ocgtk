(* GENERATED CODE - DO NOT EDIT *)
(* Gsk Enumeration and Bitfield Types *)

(* BlendMode - enumeration *)
type blendmode = [
  | `DEFAULT
  | `MULTIPLY
  | `SCREEN
  | `OVERLAY
  | `DARKEN
  | `LIGHTEN
  | `COLOR_DODGE
  | `COLOR_BURN
  | `HARD_LIGHT
  | `SOFT_LIGHT
  | `DIFFERENCE
  | `EXCLUSION
  | `COLOR
  | `HUE
  | `SATURATION
  | `LUMINOSITY
]

(* Corner - enumeration *)
type corner = [
  | `TOP_LEFT
  | `TOP_RIGHT
  | `BOTTOM_RIGHT
  | `BOTTOM_LEFT
]

(* FillRule - enumeration *)
type fillrule = [
  | `WINDING
  | `EVEN_ODD
]

(* GLUniformType - enumeration *)
type gluniformtype = [
  | `NONE
  | `FLOAT
  | `INT
  | `UINT
  | `BOOL
  | `VEC2
  | `VEC3
  | `VEC4
]

(* LineCap - enumeration *)
type linecap = [
  | `BUTT
  | `ROUND
  | `SQUARE
]

(* LineJoin - enumeration *)
type linejoin = [
  | `MITER
  | `ROUND
  | `BEVEL
]

(* MaskMode - enumeration *)
type maskmode = [
  | `ALPHA
  | `INVERTED_ALPHA
  | `LUMINANCE
  | `INVERTED_LUMINANCE
]

(* PathDirection - enumeration *)
type pathdirection = [
  | `FROM_START
  | `TO_START
  | `TO_END
  | `FROM_END
]

(* PathOperation - enumeration *)
type pathoperation = [
  | `MOVE
  | `CLOSE
  | `LINE
  | `QUAD
  | `CUBIC
  | `CONIC
]

(* RenderNodeType - enumeration *)
type rendernodetype = [
  | `NOT_A_RENDER_NODE
  | `CONTAINER_NODE
  | `CAIRO_NODE
  | `COLOR_NODE
  | `LINEAR_GRADIENT_NODE
  | `REPEATING_LINEAR_GRADIENT_NODE
  | `RADIAL_GRADIENT_NODE
  | `REPEATING_RADIAL_GRADIENT_NODE
  | `CONIC_GRADIENT_NODE
  | `BORDER_NODE
  | `TEXTURE_NODE
  | `INSET_SHADOW_NODE
  | `OUTSET_SHADOW_NODE
  | `TRANSFORM_NODE
  | `OPACITY_NODE
  | `COLOR_MATRIX_NODE
  | `REPEAT_NODE
  | `CLIP_NODE
  | `ROUNDED_CLIP_NODE
  | `SHADOW_NODE
  | `BLEND_NODE
  | `CROSS_FADE_NODE
  | `TEXT_NODE
  | `BLUR_NODE
  | `DEBUG_NODE
  | `GL_SHADER_NODE
  | `TEXTURE_SCALE_NODE
  | `MASK_NODE
  | `FILL_NODE
  | `STROKE_NODE
  | `SUBSURFACE_NODE
]

(* ScalingFilter - enumeration *)
type scalingfilter = [
  | `LINEAR
  | `NEAREST
  | `TRILINEAR
]

(* SerializationError - enumeration *)
type serializationerror = [
  | `UNSUPPORTED_FORMAT
  | `UNSUPPORTED_VERSION
  | `INVALID_DATA
]

(* TransformCategory - enumeration *)
type transformcategory = [
  | `UNKNOWN
  | `ANY
  | `V3D
  | `V2D
  | `V2D_AFFINE
  | `V2D_TRANSLATE
  | `IDENTITY
]

(* PathForeachFlags - bitfield/flags *)
type pathforeachflags_flag = [
  | `ONLY_LINES
  | `QUAD
  | `CUBIC
  | `CONIC
]

type pathforeachflags = pathforeachflags_flag list


(* GENERATED CODE - DO NOT EDIT *)
(* Gsk Enumeration and Bitfield Types *)

(* BlendMode - enumeration *)
type blendmode = [
  (** The default blend mode, which specifies no blending *)
  | `DEFAULT
  (** The source color is multiplied by the destination
  and replaces the destination *)
  | `MULTIPLY
  (** Multiplies the complements of the destination and source
  color values, then complements the result. *)
  | `SCREEN
  (** Multiplies or screens the colors, depending on the
  destination color value. This is the inverse of hard-list *)
  | `OVERLAY
  (** Selects the darker of the destination and source colors *)
  | `DARKEN
  (** Selects the lighter of the destination and source colors *)
  | `LIGHTEN
  (** Brightens the destination color to reflect the source color *)
  | `COLOR_DODGE
  (** Darkens the destination color to reflect the source color *)
  | `COLOR_BURN
  (** Multiplies or screens the colors, depending on the source color value *)
  | `HARD_LIGHT
  (** Darkens or lightens the colors, depending on the source color value *)
  | `SOFT_LIGHT
  (** Subtracts the darker of the two constituent colors from the lighter color *)
  | `DIFFERENCE
  (** Produces an effect similar to that of the difference mode but lower in contrast *)
  | `EXCLUSION
  (** Creates a color with the hue and saturation of the source color and the luminosity of the destination color *)
  | `COLOR
  (** Creates a color with the hue of the source color and the saturation and luminosity of the destination color *)
  | `HUE
  (** Creates a color with the saturation of the source color and the hue and luminosity of the destination color *)
  | `SATURATION
  (** Creates a color with the luminosity of the source color and the hue and saturation of the destination color *)
  | `LUMINOSITY
]

(* Corner - enumeration *)
type corner = [
  (** The top left corner *)
  | `TOP_LEFT
  (** The top right corner *)
  | `TOP_RIGHT
  (** The bottom right corner *)
  | `BOTTOM_RIGHT
  (** The bottom left corner *)
  | `BOTTOM_LEFT
]

(* FillRule - enumeration *)
type fillrule = [
  (** If the path crosses the ray from
  left-to-right, counts +1. If the path crosses the ray
  from right to left, counts -1. (Left and right are determined
  from the perspective of looking along the ray from the starting
  point.) If the total count is non-zero, the point will be filled. *)
  | `WINDING
  (** Counts the total number of
  intersections, without regard to the orientation of the contour. If
  the total number of intersections is odd, the point will be
  filled. *)
  | `EVEN_ODD
]

(* GLUniformType - enumeration *)
type gluniformtype = [
  (** No type, used for uninitialized or unspecified values. *)
  | `NONE
  (** A float uniform *)
  | `FLOAT
  (** A GLSL int / gint32 uniform *)
  | `INT
  (** A GLSL uint / guint32 uniform *)
  | `UINT
  (** A GLSL bool / gboolean uniform *)
  | `BOOL
  (** A GLSL vec2 / graphene_vec2_t uniform *)
  | `VEC2
  (** A GLSL vec3 / graphene_vec3_t uniform *)
  | `VEC3
  (** A GLSL vec4 / graphene_vec4_t uniform *)
  | `VEC4
]

(* LineCap - enumeration *)
type linecap = [
  (** Start and stop the line exactly at the start
  and end point *)
  | `BUTT
  (** Use a round ending, the center of the circle
  is the start or end point *)
  | `ROUND
  (** use squared ending, the center of the square
  is the start or end point *)
  | `SQUARE
]

(* LineJoin - enumeration *)
type linejoin = [
  (** Use a sharp angled corner *)
  | `MITER
  (** Use a round join, the center of the circle is
  the join point *)
  | `ROUND
  (** use a cut-off join, the join is cut off at half
  the line width from the joint point *)
  | `BEVEL
]

(* MaskMode - enumeration *)
type maskmode = [
  (** Use the alpha channel of the mask *)
  | `ALPHA
  (** Use the inverted alpha channel of the mask *)
  | `INVERTED_ALPHA
  (** Use the luminance of the mask,
    multiplied by mask alpha *)
  | `LUMINANCE
  (** Use the inverted luminance of the mask,
    multiplied by mask alpha *)
  | `INVERTED_LUMINANCE
]

(* PathDirection - enumeration *)
type pathdirection = [
  (** The tangent in path direction of the incoming side
  of the path *)
  | `FROM_START
  (** The tangent against path direction of the incoming side
  of the path *)
  | `TO_START
  (** The tangent in path direction of the outgoing side
  of the path *)
  | `TO_END
  (** The tangent against path direction of the outgoing
  side of the path *)
  | `FROM_END
]

(* PathOperation - enumeration *)
type pathoperation = [
  (** A move-to operation, with 1 point describing the target point. *)
  | `MOVE
  (** A close operation ending the current contour with a line back
  to the starting point. Two points describe the start and end of the line. *)
  | `CLOSE
  (** A line-to operation, with 2 points describing the start and
  end point of a straight line. *)
  | `LINE
  (** A curve-to operation describing a quadratic Bézier curve
  with 3 points describing the start point, the control point and the end
  point of the curve. *)
  | `QUAD
  (** A curve-to operation describing a cubic Bézier curve with 4
  points describing the start point, the two control points and the end point
  of the curve. *)
  | `CUBIC
  (** A rational quadratic Bézier curve with 3 points describing
  the start point, control point and end point of the curve. A weight for the
  curve will be passed, too. *)
  | `CONIC
]

(* RenderNodeType - enumeration *)
type rendernodetype = [
  (** Error type. No node will ever have this type. *)
  | `NOT_A_RENDER_NODE
  (** A node containing a stack of children *)
  | `CONTAINER_NODE
  (** A node drawing a `cairo_surface_t` *)
  | `CAIRO_NODE
  (** A node drawing a single color rectangle *)
  | `COLOR_NODE
  (** A node drawing a linear gradient *)
  | `LINEAR_GRADIENT_NODE
  (** A node drawing a repeating linear gradient *)
  | `REPEATING_LINEAR_GRADIENT_NODE
  (** A node drawing a radial gradient *)
  | `RADIAL_GRADIENT_NODE
  (** A node drawing a repeating radial gradient *)
  | `REPEATING_RADIAL_GRADIENT_NODE
  (** A node drawing a conic gradient *)
  | `CONIC_GRADIENT_NODE
  (** A node stroking a border around an area *)
  | `BORDER_NODE
  (** A node drawing a `GdkTexture` *)
  | `TEXTURE_NODE
  (** A node drawing an inset shadow *)
  | `INSET_SHADOW_NODE
  (** A node drawing an outset shadow *)
  | `OUTSET_SHADOW_NODE
  (** A node that renders its child after applying a matrix transform *)
  | `TRANSFORM_NODE
  (** A node that changes the opacity of its child *)
  | `OPACITY_NODE
  (** A node that applies a color matrix to every pixel *)
  | `COLOR_MATRIX_NODE
  (** A node that repeats the child's contents *)
  | `REPEAT_NODE
  (** A node that clips its child to a rectangular area *)
  | `CLIP_NODE
  (** A node that clips its child to a rounded rectangle *)
  | `ROUNDED_CLIP_NODE
  (** A node that draws a shadow below its child *)
  | `SHADOW_NODE
  (** A node that blends two children together *)
  | `BLEND_NODE
  (** A node that cross-fades between two children *)
  | `CROSS_FADE_NODE
  (** A node containing a glyph string *)
  | `TEXT_NODE
  (** A node that applies a blur *)
  | `BLUR_NODE
  (** Debug information that does not affect the rendering *)
  | `DEBUG_NODE
  (** A node that uses OpenGL fragment shaders to render *)
  | `GL_SHADER_NODE
  (** A node drawing a `GdkTexture` scaled and filtered. *)
  | `TEXTURE_SCALE_NODE
  (** A node that masks one child with another. *)
  | `MASK_NODE
  (** A node that fills a path. *)
  | `FILL_NODE
  (** A node that strokes a path. *)
  | `STROKE_NODE
  (** A node that possibly redirects part of the scene graph to a subsurface. *)
  | `SUBSURFACE_NODE
]

(* ScalingFilter - enumeration *)
type scalingfilter = [
  (** linear interpolation filter *)
  | `LINEAR
  (** nearest neighbor interpolation filter *)
  | `NEAREST
  (** linear interpolation along each axis,
  plus mipmap generation, with linear interpolation along the mipmap
  levels *)
  | `TRILINEAR
]

(* SerializationError - enumeration *)
type serializationerror = [
  (** The format can not be identified *)
  | `UNSUPPORTED_FORMAT
  (** The version of the data is not
  understood *)
  | `UNSUPPORTED_VERSION
  (** The given data may not exist in
  a proper serialization *)
  | `INVALID_DATA
]

(* TransformCategory - enumeration *)
type transformcategory = [
  (** The category of the matrix has not been
  determined. *)
  | `UNKNOWN
  (** Analyzing the matrix concluded that it does
  not fit in any other category. *)
  | `ANY
  (** The matrix is a 3D matrix. This means that
  the w column (the last column) has the values (0, 0, 0, 1). *)
  | `V3D
  (** The matrix is a 2D matrix. This is equivalent
  to graphene_matrix_is_2d() returning %TRUE. In particular, this
  means that Cairo can deal with the matrix. *)
  | `V2D
  (** The matrix is a combination of 2D scale
  and 2D translation operations. In particular, this means that any
  rectangle can be transformed exactly using this matrix. *)
  | `V2D_AFFINE
  (** The matrix is a 2D translation. *)
  | `V2D_TRANSLATE
  (** The matrix is the identity matrix. *)
  | `IDENTITY
]

(* PathForeachFlags - bitfield/flags *)
type pathforeachflags_flag = [
  (** The default behavior, only allow lines. *)
  | `ONLY_LINES
  (** Allow emission of `GSK_PATH_QUAD` operations *)
  | `QUAD
  (** Allow emission of `GSK_PATH_CUBIC` operations. *)
  | `CUBIC
  (** Allow emission of `GSK_PATH_CONIC` operations. *)
  | `CONIC
]

type pathforeachflags = pathforeachflags_flag list


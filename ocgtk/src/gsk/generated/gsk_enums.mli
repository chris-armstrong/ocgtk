(* GENERATED CODE - DO NOT EDIT *)
(* Gsk Enumeration and Bitfield Types *)

(* BlendMode - enumeration *)
type blendmode = [
  | `DEFAULT (** The default blend mode, which specifies no blending *)
  | `MULTIPLY (** The source color is multiplied by the destination
and replaces the destination *)
  | `SCREEN (** Multiplies the complements of the destination and source
color values, then complements the result. *)
  | `OVERLAY (** Multiplies or screens the colors, depending on the
destination color value. This is the inverse of hard-list *)
  | `DARKEN (** Selects the darker of the destination and source colors *)
  | `LIGHTEN (** Selects the lighter of the destination and source colors *)
  | `COLOR_DODGE (** Brightens the destination color to reflect the source color *)
  | `COLOR_BURN (** Darkens the destination color to reflect the source color *)
  | `HARD_LIGHT (** Multiplies or screens the colors, depending on the source color value *)
  | `SOFT_LIGHT (** Darkens or lightens the colors, depending on the source color value *)
  | `DIFFERENCE (** Subtracts the darker of the two constituent colors from the lighter color *)
  | `EXCLUSION (** Produces an effect similar to that of the difference mode but lower in contrast *)
  | `COLOR (** Creates a color with the hue and saturation of the source color and the luminosity of the destination color *)
  | `HUE (** Creates a color with the hue of the source color and the saturation and luminosity of the destination color *)
  | `SATURATION (** Creates a color with the saturation of the source color and the hue and luminosity of the destination color *)
  | `LUMINOSITY (** Creates a color with the luminosity of the source color and the hue and saturation of the destination color *)
]

val blendmode_of_int : int -> blendmode
val blendmode_to_int : blendmode -> int

(* Corner - enumeration *)
type corner = [
  | `TOP_LEFT (** The top left corner *)
  | `TOP_RIGHT (** The top right corner *)
  | `BOTTOM_RIGHT (** The bottom right corner *)
  | `BOTTOM_LEFT (** The bottom left corner *)
]

val corner_of_int : int -> corner
val corner_to_int : corner -> int

(* FillRule - enumeration *)
type fillrule = [
  | `WINDING (** If the path crosses the ray from
left-to-right, counts +1. If the path crosses the ray
from right to left, counts -1. (Left and right are determined
from the perspective of looking along the ray from the starting
point.) If the total count is non-zero, the point will be filled. *)
  | `EVEN_ODD (** Counts the total number of
intersections, without regard to the orientation of the contour. If
the total number of intersections is odd, the point will be
filled. *)
]

val fillrule_of_int : int -> fillrule
val fillrule_to_int : fillrule -> int

(* GLUniformType - enumeration *)
type gluniformtype = [
  | `NONE (** No type, used for uninitialized or unspecified values. *)
  | `FLOAT (** A float uniform *)
  | `INT (** A GLSL int / gint32 uniform *)
  | `UINT (** A GLSL uint / guint32 uniform *)
  | `BOOL (** A GLSL bool / gboolean uniform *)
  | `VEC2 (** A GLSL vec2 / graphene_vec2_t uniform *)
  | `VEC3 (** A GLSL vec3 / graphene_vec3_t uniform *)
  | `VEC4 (** A GLSL vec4 / graphene_vec4_t uniform *)
]

val gluniformtype_of_int : int -> gluniformtype
val gluniformtype_to_int : gluniformtype -> int

(* LineCap - enumeration *)
type linecap = [
  | `BUTT (** Start and stop the line exactly at the start
and end point *)
  | `ROUND (** Use a round ending, the center of the circle
is the start or end point *)
  | `SQUARE (** use squared ending, the center of the square
is the start or end point *)
]

val linecap_of_int : int -> linecap
val linecap_to_int : linecap -> int

(* LineJoin - enumeration *)
type linejoin = [
  | `MITER (** Use a sharp angled corner *)
  | `ROUND (** Use a round join, the center of the circle is
the join point *)
  | `BEVEL (** use a cut-off join, the join is cut off at half
the line width from the joint point *)
]

val linejoin_of_int : int -> linejoin
val linejoin_to_int : linejoin -> int

(* MaskMode - enumeration *)
type maskmode = [
  | `ALPHA (** Use the alpha channel of the mask *)
  | `INVERTED_ALPHA (** Use the inverted alpha channel of the mask *)
  | `LUMINANCE (** Use the luminance of the mask,
multiplied by mask alpha *)
  | `INVERTED_LUMINANCE (** Use the inverted luminance of the mask,
multiplied by mask alpha *)
]

val maskmode_of_int : int -> maskmode
val maskmode_to_int : maskmode -> int

(* PathDirection - enumeration *)
type pathdirection = [
  | `FROM_START (** The tangent in path direction of the incoming side
of the path *)
  | `TO_START (** The tangent against path direction of the incoming side
of the path *)
  | `TO_END (** The tangent in path direction of the outgoing side
of the path *)
  | `FROM_END (** The tangent against path direction of the outgoing
side of the path *)
]

val pathdirection_of_int : int -> pathdirection
val pathdirection_to_int : pathdirection -> int

(* PathIntersection - enumeration *)
type pathintersection = [
  | `NONE (** No intersection *)
  | `NORMAL (** A normal intersection, where the two paths
cross each other *)
  | `START (** The start of a segment where the two paths coincide *)
  | `END (** The end of a segment where the two paths coincide *)
]

val pathintersection_of_int : int -> pathintersection
val pathintersection_to_int : pathintersection -> int

(* PathOperation - enumeration *)
type pathoperation = [
  | `MOVE (** A move-to operation, with 1 point describing the target point. *)
  | `CLOSE (** A close operation ending the current contour with a line back
to the starting point. Two points describe the start and end of the line. *)
  | `LINE (** A line-to operation, with 2 points describing the start and
end point of a straight line. *)
  | `QUAD (** A curve-to operation describing a quadratic Bézier curve
with 3 points describing the start point, the control point and the end
point of the curve. *)
  | `CUBIC (** A curve-to operation describing a cubic Bézier curve with 4
points describing the start point, the two control points and the end point
of the curve. *)
  | `CONIC (** A rational quadratic Bézier curve with 3 points describing
the start point, control point and end point of the curve. A weight for the
curve will be passed, too. *)
]

val pathoperation_of_int : int -> pathoperation
val pathoperation_to_int : pathoperation -> int

(* RenderNodeType - enumeration *)
type rendernodetype = [
  | `NOT_A_RENDER_NODE (** Error type. No node will ever have this type. *)
  | `CONTAINER_NODE (** A node containing a stack of children *)
  | `CAIRO_NODE (** A node drawing a [cairo_surface_t] *)
  | `COLOR_NODE (** A node drawing a single color rectangle *)
  | `LINEAR_GRADIENT_NODE (** A node drawing a linear gradient *)
  | `REPEATING_LINEAR_GRADIENT_NODE (** A node drawing a repeating linear gradient *)
  | `RADIAL_GRADIENT_NODE (** A node drawing a radial gradient *)
  | `REPEATING_RADIAL_GRADIENT_NODE (** A node drawing a repeating radial gradient *)
  | `CONIC_GRADIENT_NODE (** A node drawing a conic gradient *)
  | `BORDER_NODE (** A node stroking a border around an area *)
  | `TEXTURE_NODE (** A node drawing a [GdkTexture] *)
  | `INSET_SHADOW_NODE (** A node drawing an inset shadow *)
  | `OUTSET_SHADOW_NODE (** A node drawing an outset shadow *)
  | `TRANSFORM_NODE (** A node that renders its child after applying a matrix transform *)
  | `OPACITY_NODE (** A node that changes the opacity of its child *)
  | `COLOR_MATRIX_NODE (** A node that applies a color matrix to every pixel *)
  | `REPEAT_NODE (** A node that repeats the child's contents *)
  | `CLIP_NODE (** A node that clips its child to a rectangular area *)
  | `ROUNDED_CLIP_NODE (** A node that clips its child to a rounded rectangle *)
  | `SHADOW_NODE (** A node that draws a shadow below its child *)
  | `BLEND_NODE (** A node that blends two children together *)
  | `CROSS_FADE_NODE (** A node that cross-fades between two children *)
  | `TEXT_NODE (** A node containing a glyph string *)
  | `BLUR_NODE (** A node that applies a blur *)
  | `DEBUG_NODE (** Debug information that does not affect the rendering *)
  | `GL_SHADER_NODE (** A node that uses OpenGL fragment shaders to render *)
  | `TEXTURE_SCALE_NODE (** A node drawing a [GdkTexture] scaled and filtered. *)
  | `MASK_NODE (** A node that masks one child with another. *)
  | `FILL_NODE (** A node that fills a path. *)
  | `STROKE_NODE (** A node that strokes a path. *)
  | `SUBSURFACE_NODE (** A node that possibly redirects part of the scene graph to a subsurface. *)
  | `COMPONENT_TRANSFER_NODE (** A node that applies some function to each color component. *)
]

val rendernodetype_of_int : int -> rendernodetype
val rendernodetype_to_int : rendernodetype -> int

(* ScalingFilter - enumeration *)
type scalingfilter = [
  | `LINEAR (** linear interpolation filter *)
  | `NEAREST (** nearest neighbor interpolation filter *)
  | `TRILINEAR (** linear interpolation along each axis,
plus mipmap generation, with linear interpolation along the mipmap
levels *)
]

val scalingfilter_of_int : int -> scalingfilter
val scalingfilter_to_int : scalingfilter -> int

(* SerializationError - enumeration *)
type serializationerror = [
  | `UNSUPPORTED_FORMAT (** The format can not be identified *)
  | `UNSUPPORTED_VERSION (** The version of the data is not
understood *)
  | `INVALID_DATA (** The given data may not exist in
a proper serialization *)
]

val serializationerror_of_int : int -> serializationerror
val serializationerror_to_int : serializationerror -> int

(* TransformCategory - enumeration *)
type transformcategory = [
  | `UNKNOWN (** The category of the matrix has not been
determined. *)
  | `ANY (** Analyzing the matrix concluded that it does
not fit in any other category. *)
  | `V3D (** The matrix is a 3D matrix. This means that
the w column (the last column) has the values (0, 0, 0, 1). *)
  | `V2D (** The matrix is a 2D matrix. This is equivalent
to graphene_matrix_is_2d() returning [TRUE]. In particular, this
means that Cairo can deal with the matrix. *)
  | `V2D_AFFINE (** The matrix is a combination of 2D scale
and 2D translation operations. In particular, this means that any
rectangle can be transformed exactly using this matrix. *)
  | `V2D_TRANSLATE (** The matrix is a 2D translation. *)
  | `IDENTITY (** The matrix is the identity matrix. *)
]

val transformcategory_of_int : int -> transformcategory
val transformcategory_to_int : transformcategory -> int

(* PathForeachFlags - bitfield/flags *)
type pathforeachflags_flag = [
  | `ONLY_LINES (** The default behavior, only allow lines. *)
  | `QUAD (** Allow emission of [GSK_PATH_QUAD] operations *)
  | `CUBIC (** Allow emission of [GSK_PATH_CUBIC] operations. *)
  | `CONIC (** Allow emission of [GSK_PATH_CONIC] operations. *)
]

type pathforeachflags = pathforeachflags_flag list

val pathforeachflags_of_int : int -> pathforeachflags
val pathforeachflags_to_int : pathforeachflags -> int


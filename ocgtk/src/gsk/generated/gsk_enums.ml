(* GENERATED CODE - DO NOT EDIT *)
(* Gsk Enumeration and Bitfield Converters *)

type blendmode =
  [ `DEFAULT
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
  | `LUMINOSITY ]

let blendmode_of_int n =
  match n with
  | 0 -> `DEFAULT
  | 1 -> `MULTIPLY
  | 2 -> `SCREEN
  | 3 -> `OVERLAY
  | 4 -> `DARKEN
  | 5 -> `LIGHTEN
  | 6 -> `COLOR_DODGE
  | 7 -> `COLOR_BURN
  | 8 -> `HARD_LIGHT
  | 9 -> `SOFT_LIGHT
  | 10 -> `DIFFERENCE
  | 11 -> `EXCLUSION
  | 12 -> `COLOR
  | 13 -> `HUE
  | 14 -> `SATURATION
  | 15 -> `LUMINOSITY
  | n -> failwith (Printf.sprintf "BlendMode: unknown int %d" n)

let blendmode_to_int v =
  match v with
  | `DEFAULT -> 0
  | `MULTIPLY -> 1
  | `SCREEN -> 2
  | `OVERLAY -> 3
  | `DARKEN -> 4
  | `LIGHTEN -> 5
  | `COLOR_DODGE -> 6
  | `COLOR_BURN -> 7
  | `HARD_LIGHT -> 8
  | `SOFT_LIGHT -> 9
  | `DIFFERENCE -> 10
  | `EXCLUSION -> 11
  | `COLOR -> 12
  | `HUE -> 13
  | `SATURATION -> 14
  | `LUMINOSITY -> 15

type corner = [ `TOP_LEFT | `TOP_RIGHT | `BOTTOM_RIGHT | `BOTTOM_LEFT ]

let corner_of_int n =
  match n with
  | 0 -> `TOP_LEFT
  | 1 -> `TOP_RIGHT
  | 2 -> `BOTTOM_RIGHT
  | 3 -> `BOTTOM_LEFT
  | n -> failwith (Printf.sprintf "Corner: unknown int %d" n)

let corner_to_int v =
  match v with
  | `TOP_LEFT -> 0
  | `TOP_RIGHT -> 1
  | `BOTTOM_RIGHT -> 2
  | `BOTTOM_LEFT -> 3

type fillrule = [ `WINDING | `EVEN_ODD ]

let fillrule_of_int n =
  match n with
  | 0 -> `WINDING
  | 1 -> `EVEN_ODD
  | n -> failwith (Printf.sprintf "FillRule: unknown int %d" n)

let fillrule_to_int v = match v with `WINDING -> 0 | `EVEN_ODD -> 1

type gluniformtype =
  [ `NONE | `FLOAT | `INT | `UINT | `BOOL | `VEC2 | `VEC3 | `VEC4 ]

let gluniformtype_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `FLOAT
  | 2 -> `INT
  | 3 -> `UINT
  | 4 -> `BOOL
  | 5 -> `VEC2
  | 6 -> `VEC3
  | 7 -> `VEC4
  | n -> failwith (Printf.sprintf "GLUniformType: unknown int %d" n)

let gluniformtype_to_int v =
  match v with
  | `NONE -> 0
  | `FLOAT -> 1
  | `INT -> 2
  | `UINT -> 3
  | `BOOL -> 4
  | `VEC2 -> 5
  | `VEC3 -> 6
  | `VEC4 -> 7

type linecap = [ `BUTT | `ROUND | `SQUARE ]

let linecap_of_int n =
  match n with
  | 0 -> `BUTT
  | 1 -> `ROUND
  | 2 -> `SQUARE
  | n -> failwith (Printf.sprintf "LineCap: unknown int %d" n)

let linecap_to_int v = match v with `BUTT -> 0 | `ROUND -> 1 | `SQUARE -> 2

type linejoin = [ `MITER | `ROUND | `BEVEL ]

let linejoin_of_int n =
  match n with
  | 0 -> `MITER
  | 1 -> `ROUND
  | 2 -> `BEVEL
  | n -> failwith (Printf.sprintf "LineJoin: unknown int %d" n)

let linejoin_to_int v = match v with `MITER -> 0 | `ROUND -> 1 | `BEVEL -> 2

type maskmode = [ `ALPHA | `INVERTED_ALPHA | `LUMINANCE | `INVERTED_LUMINANCE ]

let maskmode_of_int n =
  match n with
  | 0 -> `ALPHA
  | 1 -> `INVERTED_ALPHA
  | 2 -> `LUMINANCE
  | 3 -> `INVERTED_LUMINANCE
  | n -> failwith (Printf.sprintf "MaskMode: unknown int %d" n)

let maskmode_to_int v =
  match v with
  | `ALPHA -> 0
  | `INVERTED_ALPHA -> 1
  | `LUMINANCE -> 2
  | `INVERTED_LUMINANCE -> 3

type pathdirection = [ `FROM_START | `TO_START | `TO_END | `FROM_END ]

let pathdirection_of_int n =
  match n with
  | 0 -> `FROM_START
  | 1 -> `TO_START
  | 2 -> `TO_END
  | 3 -> `FROM_END
  | n -> failwith (Printf.sprintf "PathDirection: unknown int %d" n)

let pathdirection_to_int v =
  match v with
  | `FROM_START -> 0
  | `TO_START -> 1
  | `TO_END -> 2
  | `FROM_END -> 3

type pathoperation = [ `MOVE | `CLOSE | `LINE | `QUAD | `CUBIC | `CONIC ]

let pathoperation_of_int n =
  match n with
  | 0 -> `MOVE
  | 1 -> `CLOSE
  | 2 -> `LINE
  | 3 -> `QUAD
  | 4 -> `CUBIC
  | 5 -> `CONIC
  | n -> failwith (Printf.sprintf "PathOperation: unknown int %d" n)

let pathoperation_to_int v =
  match v with
  | `MOVE -> 0
  | `CLOSE -> 1
  | `LINE -> 2
  | `QUAD -> 3
  | `CUBIC -> 4
  | `CONIC -> 5

type rendernodetype =
  [ `NOT_A_RENDER_NODE
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
  | `SUBSURFACE_NODE ]

let rendernodetype_of_int n =
  match n with
  | 0 -> `NOT_A_RENDER_NODE
  | 1 -> `CONTAINER_NODE
  | 2 -> `CAIRO_NODE
  | 3 -> `COLOR_NODE
  | 4 -> `LINEAR_GRADIENT_NODE
  | 5 -> `REPEATING_LINEAR_GRADIENT_NODE
  | 6 -> `RADIAL_GRADIENT_NODE
  | 7 -> `REPEATING_RADIAL_GRADIENT_NODE
  | 8 -> `CONIC_GRADIENT_NODE
  | 9 -> `BORDER_NODE
  | 10 -> `TEXTURE_NODE
  | 11 -> `INSET_SHADOW_NODE
  | 12 -> `OUTSET_SHADOW_NODE
  | 13 -> `TRANSFORM_NODE
  | 14 -> `OPACITY_NODE
  | 15 -> `COLOR_MATRIX_NODE
  | 16 -> `REPEAT_NODE
  | 17 -> `CLIP_NODE
  | 18 -> `ROUNDED_CLIP_NODE
  | 19 -> `SHADOW_NODE
  | 20 -> `BLEND_NODE
  | 21 -> `CROSS_FADE_NODE
  | 22 -> `TEXT_NODE
  | 23 -> `BLUR_NODE
  | 24 -> `DEBUG_NODE
  | 25 -> `GL_SHADER_NODE
  | 26 -> `TEXTURE_SCALE_NODE
  | 27 -> `MASK_NODE
  | 28 -> `FILL_NODE
  | 29 -> `STROKE_NODE
  | 30 -> `SUBSURFACE_NODE
  | n -> failwith (Printf.sprintf "RenderNodeType: unknown int %d" n)

let rendernodetype_to_int v =
  match v with
  | `NOT_A_RENDER_NODE -> 0
  | `CONTAINER_NODE -> 1
  | `CAIRO_NODE -> 2
  | `COLOR_NODE -> 3
  | `LINEAR_GRADIENT_NODE -> 4
  | `REPEATING_LINEAR_GRADIENT_NODE -> 5
  | `RADIAL_GRADIENT_NODE -> 6
  | `REPEATING_RADIAL_GRADIENT_NODE -> 7
  | `CONIC_GRADIENT_NODE -> 8
  | `BORDER_NODE -> 9
  | `TEXTURE_NODE -> 10
  | `INSET_SHADOW_NODE -> 11
  | `OUTSET_SHADOW_NODE -> 12
  | `TRANSFORM_NODE -> 13
  | `OPACITY_NODE -> 14
  | `COLOR_MATRIX_NODE -> 15
  | `REPEAT_NODE -> 16
  | `CLIP_NODE -> 17
  | `ROUNDED_CLIP_NODE -> 18
  | `SHADOW_NODE -> 19
  | `BLEND_NODE -> 20
  | `CROSS_FADE_NODE -> 21
  | `TEXT_NODE -> 22
  | `BLUR_NODE -> 23
  | `DEBUG_NODE -> 24
  | `GL_SHADER_NODE -> 25
  | `TEXTURE_SCALE_NODE -> 26
  | `MASK_NODE -> 27
  | `FILL_NODE -> 28
  | `STROKE_NODE -> 29
  | `SUBSURFACE_NODE -> 30

type scalingfilter = [ `LINEAR | `NEAREST | `TRILINEAR ]

let scalingfilter_of_int n =
  match n with
  | 0 -> `LINEAR
  | 1 -> `NEAREST
  | 2 -> `TRILINEAR
  | n -> failwith (Printf.sprintf "ScalingFilter: unknown int %d" n)

let scalingfilter_to_int v =
  match v with `LINEAR -> 0 | `NEAREST -> 1 | `TRILINEAR -> 2

type serializationerror =
  [ `UNSUPPORTED_FORMAT | `UNSUPPORTED_VERSION | `INVALID_DATA ]

let serializationerror_of_int n =
  match n with
  | 0 -> `UNSUPPORTED_FORMAT
  | 1 -> `UNSUPPORTED_VERSION
  | 2 -> `INVALID_DATA
  | n -> failwith (Printf.sprintf "SerializationError: unknown int %d" n)

let serializationerror_to_int v =
  match v with
  | `UNSUPPORTED_FORMAT -> 0
  | `UNSUPPORTED_VERSION -> 1
  | `INVALID_DATA -> 2

type transformcategory =
  [ `UNKNOWN | `ANY | `V3D | `V2D | `V2D_AFFINE | `V2D_TRANSLATE | `IDENTITY ]

let transformcategory_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `ANY
  | 2 -> `V3D
  | 3 -> `V2D
  | 4 -> `V2D_AFFINE
  | 5 -> `V2D_TRANSLATE
  | 6 -> `IDENTITY
  | n -> failwith (Printf.sprintf "TransformCategory: unknown int %d" n)

let transformcategory_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `ANY -> 1
  | `V3D -> 2
  | `V2D -> 3
  | `V2D_AFFINE -> 4
  | `V2D_TRANSLATE -> 5
  | `IDENTITY -> 6

type pathforeachflags_flag = [ `ONLY_LINES | `QUAD | `CUBIC | `CONIC ]
type pathforeachflags = pathforeachflags_flag list

let pathforeachflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `ONLY_LINES :: acc else acc in
  let acc = if flags land 1 <> 0 then `QUAD :: acc else acc in
  let acc = if flags land 2 <> 0 then `CUBIC :: acc else acc in
  let acc = if flags land 4 <> 0 then `CONIC :: acc else acc in
  acc

let pathforeachflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `ONLY_LINES -> acc lor 0
      | `QUAD -> acc lor 1
      | `CUBIC -> acc lor 2
      | `CONIC -> acc lor 4)
    0 flags

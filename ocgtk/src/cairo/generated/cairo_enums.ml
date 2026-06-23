(* GENERATED CODE - DO NOT EDIT *)
(* cairo Enumeration and Bitfield Converters *)

type status =
  [ `SUCCESS
  | `NO_MEMORY
  | `INVALID_RESTORE
  | `INVALID_POP_GROUP
  | `NO_CURRENT_POINT
  | `INVALID_MATRIX
  | `INVALID_STATUS
  | `NULL_POINTER
  | `INVALID_STRING
  | `INVALID_PATH_DATA
  | `READ_ERROR
  | `WRITE_ERROR
  | `SURFACE_FINISHED
  | `SURFACE_TYPE_MISMATCH
  | `PATTERN_TYPE_MISMATCH
  | `INVALID_CONTENT
  | `INVALID_FORMAT
  | `INVALID_VISUAL
  | `FILE_NOT_FOUND
  | `INVALID_DASH
  | `INVALID_DSC_COMMENT
  | `INVALID_INDEX
  | `CLIP_NOT_REPRESENTABLE
  | `TEMP_FILE_ERROR
  | `INVALID_STRIDE
  | `FONT_TYPE_MISMATCH
  | `USER_FONT_IMMUTABLE
  | `USER_FONT_ERROR
  | `NEGATIVE_COUNT
  | `INVALID_CLUSTERS
  | `INVALID_SLANT
  | `INVALID_WEIGHT
  | `INVALID_SIZE
  | `USER_FONT_NOT_IMPLEMENTED
  | `DEVICE_TYPE_MISMATCH
  | `DEVICE_ERROR
  | `INVALID_MESH_CONSTRUCTION
  | `DEVICE_FINISHED
  | `JBIG2_GLOBAL_MISSING ]

let status_of_int n =
  match n with
  | 0 -> `SUCCESS
  | 1 -> `NO_MEMORY
  | 2 -> `INVALID_RESTORE
  | 3 -> `INVALID_POP_GROUP
  | 4 -> `NO_CURRENT_POINT
  | 5 -> `INVALID_MATRIX
  | 6 -> `INVALID_STATUS
  | 7 -> `NULL_POINTER
  | 8 -> `INVALID_STRING
  | 9 -> `INVALID_PATH_DATA
  | 10 -> `READ_ERROR
  | 11 -> `WRITE_ERROR
  | 12 -> `SURFACE_FINISHED
  | 13 -> `SURFACE_TYPE_MISMATCH
  | 14 -> `PATTERN_TYPE_MISMATCH
  | 15 -> `INVALID_CONTENT
  | 16 -> `INVALID_FORMAT
  | 17 -> `INVALID_VISUAL
  | 18 -> `FILE_NOT_FOUND
  | 19 -> `INVALID_DASH
  | 20 -> `INVALID_DSC_COMMENT
  | 21 -> `INVALID_INDEX
  | 22 -> `CLIP_NOT_REPRESENTABLE
  | 23 -> `TEMP_FILE_ERROR
  | 24 -> `INVALID_STRIDE
  | 25 -> `FONT_TYPE_MISMATCH
  | 26 -> `USER_FONT_IMMUTABLE
  | 27 -> `USER_FONT_ERROR
  | 28 -> `NEGATIVE_COUNT
  | 29 -> `INVALID_CLUSTERS
  | 30 -> `INVALID_SLANT
  | 31 -> `INVALID_WEIGHT
  | 32 -> `INVALID_SIZE
  | 33 -> `USER_FONT_NOT_IMPLEMENTED
  | 34 -> `DEVICE_TYPE_MISMATCH
  | 35 -> `DEVICE_ERROR
  | 36 -> `INVALID_MESH_CONSTRUCTION
  | 37 -> `DEVICE_FINISHED
  | 38 -> `JBIG2_GLOBAL_MISSING
  | n -> failwith (Printf.sprintf "Status: unknown int %d" n)

let status_to_int v =
  match v with
  | `SUCCESS -> 0
  | `NO_MEMORY -> 1
  | `INVALID_RESTORE -> 2
  | `INVALID_POP_GROUP -> 3
  | `NO_CURRENT_POINT -> 4
  | `INVALID_MATRIX -> 5
  | `INVALID_STATUS -> 6
  | `NULL_POINTER -> 7
  | `INVALID_STRING -> 8
  | `INVALID_PATH_DATA -> 9
  | `READ_ERROR -> 10
  | `WRITE_ERROR -> 11
  | `SURFACE_FINISHED -> 12
  | `SURFACE_TYPE_MISMATCH -> 13
  | `PATTERN_TYPE_MISMATCH -> 14
  | `INVALID_CONTENT -> 15
  | `INVALID_FORMAT -> 16
  | `INVALID_VISUAL -> 17
  | `FILE_NOT_FOUND -> 18
  | `INVALID_DASH -> 19
  | `INVALID_DSC_COMMENT -> 20
  | `INVALID_INDEX -> 21
  | `CLIP_NOT_REPRESENTABLE -> 22
  | `TEMP_FILE_ERROR -> 23
  | `INVALID_STRIDE -> 24
  | `FONT_TYPE_MISMATCH -> 25
  | `USER_FONT_IMMUTABLE -> 26
  | `USER_FONT_ERROR -> 27
  | `NEGATIVE_COUNT -> 28
  | `INVALID_CLUSTERS -> 29
  | `INVALID_SLANT -> 30
  | `INVALID_WEIGHT -> 31
  | `INVALID_SIZE -> 32
  | `USER_FONT_NOT_IMPLEMENTED -> 33
  | `DEVICE_TYPE_MISMATCH -> 34
  | `DEVICE_ERROR -> 35
  | `INVALID_MESH_CONSTRUCTION -> 36
  | `DEVICE_FINISHED -> 37
  | `JBIG2_GLOBAL_MISSING -> 38

type content = [ `COLOR | `ALPHA | `COLOR_ALPHA ]

let content_of_int n =
  match n with
  | 4096 -> `COLOR
  | 8192 -> `ALPHA
  | 12288 -> `COLOR_ALPHA
  | n -> failwith (Printf.sprintf "Content: unknown int %d" n)

let content_to_int v =
  match v with `COLOR -> 4096 | `ALPHA -> 8192 | `COLOR_ALPHA -> 12288

type operator =
  [ `CLEAR
  | `SOURCE
  | `OVER
  | `IN
  | `OUT
  | `ATOP
  | `DEST
  | `DEST_OVER
  | `DEST_IN
  | `DEST_OUT
  | `DEST_ATOP
  | `XOR
  | `ADD
  | `SATURATE
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
  | `HSL_HUE
  | `HSL_SATURATION
  | `HSL_COLOR
  | `HSL_LUMINOSITY ]

let operator_of_int n =
  match n with
  | 0 -> `CLEAR
  | 1 -> `SOURCE
  | 2 -> `OVER
  | 3 -> `IN
  | 4 -> `OUT
  | 5 -> `ATOP
  | 6 -> `DEST
  | 7 -> `DEST_OVER
  | 8 -> `DEST_IN
  | 9 -> `DEST_OUT
  | 10 -> `DEST_ATOP
  | 11 -> `XOR
  | 12 -> `ADD
  | 13 -> `SATURATE
  | 14 -> `MULTIPLY
  | 15 -> `SCREEN
  | 16 -> `OVERLAY
  | 17 -> `DARKEN
  | 18 -> `LIGHTEN
  | 19 -> `COLOR_DODGE
  | 20 -> `COLOR_BURN
  | 21 -> `HARD_LIGHT
  | 22 -> `SOFT_LIGHT
  | 23 -> `DIFFERENCE
  | 24 -> `EXCLUSION
  | 25 -> `HSL_HUE
  | 26 -> `HSL_SATURATION
  | 27 -> `HSL_COLOR
  | 28 -> `HSL_LUMINOSITY
  | n -> failwith (Printf.sprintf "Operator: unknown int %d" n)

let operator_to_int v =
  match v with
  | `CLEAR -> 0
  | `SOURCE -> 1
  | `OVER -> 2
  | `IN -> 3
  | `OUT -> 4
  | `ATOP -> 5
  | `DEST -> 6
  | `DEST_OVER -> 7
  | `DEST_IN -> 8
  | `DEST_OUT -> 9
  | `DEST_ATOP -> 10
  | `XOR -> 11
  | `ADD -> 12
  | `SATURATE -> 13
  | `MULTIPLY -> 14
  | `SCREEN -> 15
  | `OVERLAY -> 16
  | `DARKEN -> 17
  | `LIGHTEN -> 18
  | `COLOR_DODGE -> 19
  | `COLOR_BURN -> 20
  | `HARD_LIGHT -> 21
  | `SOFT_LIGHT -> 22
  | `DIFFERENCE -> 23
  | `EXCLUSION -> 24
  | `HSL_HUE -> 25
  | `HSL_SATURATION -> 26
  | `HSL_COLOR -> 27
  | `HSL_LUMINOSITY -> 28

type antialias = [ `DEFAULT | `NONE | `GRAY | `SUBPIXEL | `FAST | `GOOD | `BEST ]

let antialias_of_int n =
  match n with
  | 0 -> `DEFAULT
  | 1 -> `NONE
  | 2 -> `GRAY
  | 3 -> `SUBPIXEL
  | 4 -> `FAST
  | 5 -> `GOOD
  | 6 -> `BEST
  | n -> failwith (Printf.sprintf "Antialias: unknown int %d" n)

let antialias_to_int v =
  match v with
  | `DEFAULT -> 0
  | `NONE -> 1
  | `GRAY -> 2
  | `SUBPIXEL -> 3
  | `FAST -> 4
  | `GOOD -> 5
  | `BEST -> 6

type fillrule = [ `WINDING | `EVEN_ODD ]

let fillrule_of_int n =
  match n with
  | 0 -> `WINDING
  | 1 -> `EVEN_ODD
  | n -> failwith (Printf.sprintf "FillRule: unknown int %d" n)

let fillrule_to_int v = match v with `WINDING -> 0 | `EVEN_ODD -> 1

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

type textclusterflags = [ `BACKWARD ]

let textclusterflags_of_int n =
  match n with
  | 1 -> `BACKWARD
  | n -> failwith (Printf.sprintf "TextClusterFlags: unknown int %d" n)

let textclusterflags_to_int v = match v with `BACKWARD -> 1

type fontslant = [ `NORMAL | `ITALIC | `OBLIQUE ]

let fontslant_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `ITALIC
  | 2 -> `OBLIQUE
  | n -> failwith (Printf.sprintf "FontSlant: unknown int %d" n)

let fontslant_to_int v =
  match v with `NORMAL -> 0 | `ITALIC -> 1 | `OBLIQUE -> 2

type fontweight = [ `NORMAL | `BOLD ]

let fontweight_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `BOLD
  | n -> failwith (Printf.sprintf "FontWeight: unknown int %d" n)

let fontweight_to_int v = match v with `NORMAL -> 0 | `BOLD -> 1

type subpixelorder = [ `DEFAULT | `RGB | `BGR | `VRGB | `VBGR ]

let subpixelorder_of_int n =
  match n with
  | 0 -> `DEFAULT
  | 1 -> `RGB
  | 2 -> `BGR
  | 3 -> `VRGB
  | 4 -> `VBGR
  | n -> failwith (Printf.sprintf "SubpixelOrder: unknown int %d" n)

let subpixelorder_to_int v =
  match v with `DEFAULT -> 0 | `RGB -> 1 | `BGR -> 2 | `VRGB -> 3 | `VBGR -> 4

type hintstyle = [ `DEFAULT | `NONE | `SLIGHT | `MEDIUM | `FULL ]

let hintstyle_of_int n =
  match n with
  | 0 -> `DEFAULT
  | 1 -> `NONE
  | 2 -> `SLIGHT
  | 3 -> `MEDIUM
  | 4 -> `FULL
  | n -> failwith (Printf.sprintf "HintStyle: unknown int %d" n)

let hintstyle_to_int v =
  match v with
  | `DEFAULT -> 0
  | `NONE -> 1
  | `SLIGHT -> 2
  | `MEDIUM -> 3
  | `FULL -> 4

type hintmetrics = [ `DEFAULT | `OFF | `ON ]

let hintmetrics_of_int n =
  match n with
  | 0 -> `DEFAULT
  | 1 -> `OFF
  | 2 -> `ON
  | n -> failwith (Printf.sprintf "HintMetrics: unknown int %d" n)

let hintmetrics_to_int v = match v with `DEFAULT -> 0 | `OFF -> 1 | `ON -> 2

type fonttype = [ `TOY | `FT | `WIN32 | `QUARTZ | `USER ]

let fonttype_of_int n =
  match n with
  | 0 -> `TOY
  | 1 -> `FT
  | 2 -> `WIN32
  | 3 -> `QUARTZ
  | 4 -> `USER
  | n -> failwith (Printf.sprintf "FontType: unknown int %d" n)

let fonttype_to_int v =
  match v with `TOY -> 0 | `FT -> 1 | `WIN32 -> 2 | `QUARTZ -> 3 | `USER -> 4

type pathdatatype = [ `MOVE_TO | `LINE_TO | `CURVE_TO | `CLOSE_PATH ]

let pathdatatype_of_int n =
  match n with
  | 0 -> `MOVE_TO
  | 1 -> `LINE_TO
  | 2 -> `CURVE_TO
  | 3 -> `CLOSE_PATH
  | n -> failwith (Printf.sprintf "PathDataType: unknown int %d" n)

let pathdatatype_to_int v =
  match v with
  | `MOVE_TO -> 0
  | `LINE_TO -> 1
  | `CURVE_TO -> 2
  | `CLOSE_PATH -> 3

type devicetype =
  [ `DRM | `GL | `SCRIPT | `XCB | `XLIB | `XML | `COGL | `WIN32 | `INVALID ]

let devicetype_of_int n =
  match n with
  | 0 -> `DRM
  | 1 -> `GL
  | 2 -> `SCRIPT
  | 3 -> `XCB
  | 4 -> `XLIB
  | 5 -> `XML
  | 6 -> `COGL
  | 7 -> `WIN32
  | -1 -> `INVALID
  | n -> failwith (Printf.sprintf "DeviceType: unknown int %d" n)

let devicetype_to_int v =
  match v with
  | `DRM -> 0
  | `GL -> 1
  | `SCRIPT -> 2
  | `XCB -> 3
  | `XLIB -> 4
  | `XML -> 5
  | `COGL -> 6
  | `WIN32 -> 7
  | `INVALID -> -1

type surfacetype =
  [ `IMAGE
  | `PDF
  | `PS
  | `XLIB
  | `XCB
  | `GLITZ
  | `QUARTZ
  | `WIN32
  | `BEOS
  | `DIRECTFB
  | `SVG
  | `OS2
  | `WIN32_PRINTING
  | `QUARTZ_IMAGE
  | `SCRIPT
  | `QT
  | `RECORDING
  | `VG
  | `GL
  | `DRM
  | `TEE
  | `XML
  | `SKIA
  | `SUBSURFACE
  | `COGL ]

let surfacetype_of_int n =
  match n with
  | 0 -> `IMAGE
  | 1 -> `PDF
  | 2 -> `PS
  | 3 -> `XLIB
  | 4 -> `XCB
  | 5 -> `GLITZ
  | 6 -> `QUARTZ
  | 7 -> `WIN32
  | 8 -> `BEOS
  | 9 -> `DIRECTFB
  | 10 -> `SVG
  | 11 -> `OS2
  | 12 -> `WIN32_PRINTING
  | 13 -> `QUARTZ_IMAGE
  | 14 -> `SCRIPT
  | 15 -> `QT
  | 16 -> `RECORDING
  | 17 -> `VG
  | 18 -> `GL
  | 19 -> `DRM
  | 20 -> `TEE
  | 21 -> `XML
  | 22 -> `SKIA
  | 23 -> `SUBSURFACE
  | 24 -> `COGL
  | n -> failwith (Printf.sprintf "SurfaceType: unknown int %d" n)

let surfacetype_to_int v =
  match v with
  | `IMAGE -> 0
  | `PDF -> 1
  | `PS -> 2
  | `XLIB -> 3
  | `XCB -> 4
  | `GLITZ -> 5
  | `QUARTZ -> 6
  | `WIN32 -> 7
  | `BEOS -> 8
  | `DIRECTFB -> 9
  | `SVG -> 10
  | `OS2 -> 11
  | `WIN32_PRINTING -> 12
  | `QUARTZ_IMAGE -> 13
  | `SCRIPT -> 14
  | `QT -> 15
  | `RECORDING -> 16
  | `VG -> 17
  | `GL -> 18
  | `DRM -> 19
  | `TEE -> 20
  | `XML -> 21
  | `SKIA -> 22
  | `SUBSURFACE -> 23
  | `COGL -> 24

type format = [ `INVALID | `ARGB32 | `RGB24 | `A8 | `A1 | `RGB16_565 | `RGB30 ]

let format_of_int n =
  match n with
  | -1 -> `INVALID
  | 0 -> `ARGB32
  | 1 -> `RGB24
  | 2 -> `A8
  | 3 -> `A1
  | 4 -> `RGB16_565
  | 5 -> `RGB30
  | n -> failwith (Printf.sprintf "Format: unknown int %d" n)

let format_to_int v =
  match v with
  | `INVALID -> -1
  | `ARGB32 -> 0
  | `RGB24 -> 1
  | `A8 -> 2
  | `A1 -> 3
  | `RGB16_565 -> 4
  | `RGB30 -> 5

type patterntype =
  [ `SOLID | `SURFACE | `LINEAR | `RADIAL | `MESH | `RASTER_SOURCE ]

let patterntype_of_int n =
  match n with
  | 0 -> `SOLID
  | 1 -> `SURFACE
  | 2 -> `LINEAR
  | 3 -> `RADIAL
  | 4 -> `MESH
  | 5 -> `RASTER_SOURCE
  | n -> failwith (Printf.sprintf "PatternType: unknown int %d" n)

let patterntype_to_int v =
  match v with
  | `SOLID -> 0
  | `SURFACE -> 1
  | `LINEAR -> 2
  | `RADIAL -> 3
  | `MESH -> 4
  | `RASTER_SOURCE -> 5

type extend = [ `NONE | `REPEAT | `REFLECT | `PAD ]

let extend_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `REPEAT
  | 2 -> `REFLECT
  | 3 -> `PAD
  | n -> failwith (Printf.sprintf "Extend: unknown int %d" n)

let extend_to_int v =
  match v with `NONE -> 0 | `REPEAT -> 1 | `REFLECT -> 2 | `PAD -> 3

type filter = [ `FAST | `GOOD | `BEST | `NEAREST | `BILINEAR | `GAUSSIAN ]

let filter_of_int n =
  match n with
  | 0 -> `FAST
  | 1 -> `GOOD
  | 2 -> `BEST
  | 3 -> `NEAREST
  | 4 -> `BILINEAR
  | 5 -> `GAUSSIAN
  | n -> failwith (Printf.sprintf "Filter: unknown int %d" n)

let filter_to_int v =
  match v with
  | `FAST -> 0
  | `GOOD -> 1
  | `BEST -> 2
  | `NEAREST -> 3
  | `BILINEAR -> 4
  | `GAUSSIAN -> 5

type regionoverlap = [ `IN | `OUT | `PART ]

let regionoverlap_of_int n =
  match n with
  | 0 -> `IN
  | 1 -> `OUT
  | 2 -> `PART
  | n -> failwith (Printf.sprintf "RegionOverlap: unknown int %d" n)

let regionoverlap_to_int v = match v with `IN -> 0 | `OUT -> 1 | `PART -> 2

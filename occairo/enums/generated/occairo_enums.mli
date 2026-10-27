(* GENERATED CODE - DO NOT EDIT *)
(* cairo Enumeration and Bitfield Types *)

(* Status - enumeration *)
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

val status_of_int : int -> status
val status_to_int : status -> int

(* Content - enumeration *)
type content = [ `COLOR | `ALPHA | `COLOR_ALPHA ]

val content_of_int : int -> content
val content_to_int : content -> int

(* Operator - enumeration *)
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

val operator_of_int : int -> operator
val operator_to_int : operator -> int

(* Antialias - enumeration *)
type antialias = [ `DEFAULT | `NONE | `GRAY | `SUBPIXEL | `FAST | `GOOD | `BEST ]

val antialias_of_int : int -> antialias
val antialias_to_int : antialias -> int

(* FillRule - enumeration *)
type fillrule = [ `WINDING | `EVEN_ODD ]

val fillrule_of_int : int -> fillrule
val fillrule_to_int : fillrule -> int

(* LineCap - enumeration *)
type linecap = [ `BUTT | `ROUND | `SQUARE ]

val linecap_of_int : int -> linecap
val linecap_to_int : linecap -> int

(* LineJoin - enumeration *)
type linejoin = [ `MITER | `ROUND | `BEVEL ]

val linejoin_of_int : int -> linejoin
val linejoin_to_int : linejoin -> int

(* TextClusterFlags - enumeration *)
type textclusterflags = [ `BACKWARD ]

val textclusterflags_of_int : int -> textclusterflags
val textclusterflags_to_int : textclusterflags -> int

(* FontSlant - enumeration *)
type fontslant = [ `NORMAL | `ITALIC | `OBLIQUE ]

val fontslant_of_int : int -> fontslant
val fontslant_to_int : fontslant -> int

(* FontWeight - enumeration *)
type fontweight = [ `NORMAL | `BOLD ]

val fontweight_of_int : int -> fontweight
val fontweight_to_int : fontweight -> int

(* SubpixelOrder - enumeration *)
type subpixelorder = [ `DEFAULT | `RGB | `BGR | `VRGB | `VBGR ]

val subpixelorder_of_int : int -> subpixelorder
val subpixelorder_to_int : subpixelorder -> int

(* HintStyle - enumeration *)
type hintstyle = [ `DEFAULT | `NONE | `SLIGHT | `MEDIUM | `FULL ]

val hintstyle_of_int : int -> hintstyle
val hintstyle_to_int : hintstyle -> int

(* HintMetrics - enumeration *)
type hintmetrics = [ `DEFAULT | `OFF | `ON ]

val hintmetrics_of_int : int -> hintmetrics
val hintmetrics_to_int : hintmetrics -> int

(* FontType - enumeration *)
type fonttype = [ `TOY | `FT | `WIN32 | `QUARTZ | `USER ]

val fonttype_of_int : int -> fonttype
val fonttype_to_int : fonttype -> int

(* PathDataType - enumeration *)
type pathdatatype = [ `MOVE_TO | `LINE_TO | `CURVE_TO | `CLOSE_PATH ]

val pathdatatype_of_int : int -> pathdatatype
val pathdatatype_to_int : pathdatatype -> int

(* DeviceType - enumeration *)
type devicetype =
  [ `DRM | `GL | `SCRIPT | `XCB | `XLIB | `XML | `COGL | `WIN32 | `INVALID ]

val devicetype_of_int : int -> devicetype
val devicetype_to_int : devicetype -> int

(* SurfaceType - enumeration *)
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

val surfacetype_of_int : int -> surfacetype
val surfacetype_to_int : surfacetype -> int

(* Format - enumeration *)
type format = [ `INVALID | `ARGB32 | `RGB24 | `A8 | `A1 | `RGB16_565 | `RGB30 ]

val format_of_int : int -> format
val format_to_int : format -> int

(* PatternType - enumeration *)
type patterntype =
  [ `SOLID | `SURFACE | `LINEAR | `RADIAL | `MESH | `RASTER_SOURCE ]

val patterntype_of_int : int -> patterntype
val patterntype_to_int : patterntype -> int

(* Extend - enumeration *)
type extend = [ `NONE | `REPEAT | `REFLECT | `PAD ]

val extend_of_int : int -> extend
val extend_to_int : extend -> int

(* Filter - enumeration *)
type filter = [ `FAST | `GOOD | `BEST | `NEAREST | `BILINEAR | `GAUSSIAN ]

val filter_of_int : int -> filter
val filter_to_int : filter -> int

(* RegionOverlap - enumeration *)
type regionoverlap = [ `IN | `OUT | `PART ]

val regionoverlap_of_int : int -> regionoverlap
val regionoverlap_to_int : regionoverlap -> int

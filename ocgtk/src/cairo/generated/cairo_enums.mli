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

(* Content - enumeration *)
type content = [ `COLOR | `ALPHA | `COLOR_ALPHA ]

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

(* Antialias - enumeration *)
type antialias = [ `DEFAULT | `NONE | `GRAY | `SUBPIXEL | `FAST | `GOOD | `BEST ]

(* FillRule - enumeration *)
type fillrule = [ `WINDING | `EVEN_ODD ]

(* LineCap - enumeration *)
type linecap = [ `BUTT | `ROUND | `SQUARE ]

(* LineJoin - enumeration *)
type linejoin = [ `MITER | `ROUND | `BEVEL ]

(* TextClusterFlags - enumeration *)
type textclusterflags = [ `BACKWARD ]

(* FontSlant - enumeration *)
type fontslant = [ `NORMAL | `ITALIC | `OBLIQUE ]

(* FontWeight - enumeration *)
type fontweight = [ `NORMAL | `BOLD ]

(* SubpixelOrder - enumeration *)
type subpixelorder = [ `DEFAULT | `RGB | `BGR | `VRGB | `VBGR ]

(* HintStyle - enumeration *)
type hintstyle = [ `DEFAULT | `NONE | `SLIGHT | `MEDIUM | `FULL ]

(* HintMetrics - enumeration *)
type hintmetrics = [ `DEFAULT | `OFF | `ON ]

(* FontType - enumeration *)
type fonttype = [ `TOY | `FT | `WIN32 | `QUARTZ | `USER ]

(* PathDataType - enumeration *)
type pathdatatype = [ `MOVE_TO | `LINE_TO | `CURVE_TO | `CLOSE_PATH ]

(* DeviceType - enumeration *)
type devicetype =
  [ `DRM | `GL | `SCRIPT | `XCB | `XLIB | `XML | `COGL | `WIN32 | `INVALID ]

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

(* Format - enumeration *)
type format = [ `INVALID | `ARGB32 | `RGB24 | `A8 | `A1 | `RGB16_565 | `RGB30 ]

(* PatternType - enumeration *)
type patterntype =
  [ `SOLID | `SURFACE | `LINEAR | `RADIAL | `MESH | `RASTER_SOURCE ]

(* Extend - enumeration *)
type extend = [ `NONE | `REPEAT | `REFLECT | `PAD ]

(* Filter - enumeration *)
type filter = [ `FAST | `GOOD | `BEST | `NEAREST | `BILINEAR | `GAUSSIAN ]

(* RegionOverlap - enumeration *)
type regionoverlap = [ `IN | `OUT | `PART ]

(* GENERATED CODE - DO NOT EDIT *)
(* GdkPixbuf Enumeration and Bitfield Types *)

(* Colorspace - enumeration *)
type colorspace = [
  | `RGB
]

(* InterpType - enumeration *)
type interptype = [
  | `NEAREST
  | `TILES
  | `BILINEAR
  | `HYPER
]

(* PixbufAlphaMode - enumeration *)
type pixbufalphamode = [
  | `BILEVEL
  | `FULL
]

(* PixbufError - enumeration *)
type pixbuferror = [
  | `CORRUPT_IMAGE
  | `INSUFFICIENT_MEMORY
  | `BAD_OPTION
  | `UNKNOWN_TYPE
  | `UNSUPPORTED_OPERATION
  | `FAILED
  | `INCOMPLETE_ANIMATION
]

(* PixbufRotation - enumeration *)
type pixbufrotation = [
  | `NONE
  | `COUNTERCLOCKWISE
  | `UPSIDEDOWN
  | `CLOCKWISE
]

(* PixbufFormatFlags - bitfield/flags *)
type pixbufformatflags_flag = [
  | `WRITABLE
  | `SCALABLE
  | `THREADSAFE
]

type pixbufformatflags = pixbufformatflags_flag list


(* GENERATED CODE - DO NOT EDIT *)
(* GdkPixbuf Enumeration and Bitfield Types *)

(* Colorspace - enumeration *)
type colorspace = [
  (** Indicates a red/green/blue additive color space. *)
  | `RGB
]

val colorspace_of_int : int -> colorspace
val colorspace_to_int : colorspace -> int

(* InterpType - enumeration *)
type interptype = [
  (** Nearest neighbor sampling; this is the fastest
 and lowest quality mode. Quality is normally unacceptable when scaling
 down, but may be OK when scaling up. *)
  | `NEAREST
  (** This is an accurate simulation of the PostScript
 image operator without any interpolation enabled.  Each pixel is
 rendered as a tiny parallelogram of solid color, the edges of which
 are implemented with antialiasing.  It resembles nearest neighbor for
 enlargement, and bilinear for reduction. *)
  | `TILES
  (** Best quality/speed balance; use this mode by
 default. Bilinear interpolation.  For enlargement, it is
 equivalent to point-sampling the ideal bilinear-interpolated image.
 For reduction, it is equivalent to laying down small tiles and
 integrating over the coverage area. *)
  | `BILINEAR
  (** This is the slowest and highest quality
 reconstruction function. It is derived from the hyperbolic filters in
 Wolberg's "Digital Image Warping", and is formally defined as the
 hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
 image (the filter is designed to be idempotent for 1:1 pixel mapping).
 **Deprecated**: this interpolation filter is deprecated, as in reality
 it has a lower quality than the @GDK_INTERP_BILINEAR filter
 (Since: 2.38) *)
  | `HYPER
]

val interptype_of_int : int -> interptype
val interptype_to_int : interptype -> int

(* PixbufAlphaMode - enumeration *)
type pixbufalphamode = [
  (** A bilevel clipping mask (black and white)
 will be created and used to draw the image.  Pixels below 0.5 opacity
 will be considered fully transparent, and all others will be
 considered fully opaque. *)
  | `BILEVEL
  (** For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL.
 In the future it will do full alpha compositing. *)
  | `FULL
]

val pixbufalphamode_of_int : int -> pixbufalphamode
val pixbufalphamode_to_int : pixbufalphamode -> int

(* PixbufError - enumeration *)
type pixbuferror = [
  (** An image file was broken somehow. *)
  | `CORRUPT_IMAGE
  (** Not enough memory. *)
  | `INSUFFICIENT_MEMORY
  (** A bad option was passed to a pixbuf save module. *)
  | `BAD_OPTION
  (** Unknown image type. *)
  | `UNKNOWN_TYPE
  (** Don't know how to perform the
 given operation on the type of image at hand. *)
  | `UNSUPPORTED_OPERATION
  (** Generic failure code, something went wrong. *)
  | `FAILED
  (** Only part of the animation was loaded. *)
  | `INCOMPLETE_ANIMATION
]

val pixbuferror_of_int : int -> pixbuferror
val pixbuferror_to_int : pixbuferror -> int

(* PixbufRotation - enumeration *)
type pixbufrotation = [
  (** No rotation. *)
  | `NONE
  (** Rotate by 90 degrees. *)
  | `COUNTERCLOCKWISE
  (** Rotate by 180 degrees. *)
  | `UPSIDEDOWN
  (** Rotate by 270 degrees. *)
  | `CLOCKWISE
]

val pixbufrotation_of_int : int -> pixbufrotation
val pixbufrotation_to_int : pixbufrotation -> int

(* PixbufFormatFlags - bitfield/flags *)
type pixbufformatflags_flag = [
  (** the module can write out images in the format. *)
  | `WRITABLE
  (** the image format is scalable *)
  | `SCALABLE
  (** the module is threadsafe. gdk-pixbuf
    ignores modules that are not marked as threadsafe. (Since 2.28). *)
  | `THREADSAFE
]

type pixbufformatflags = pixbufformatflags_flag list

val pixbufformatflags_of_int : int -> pixbufformatflags
val pixbufformatflags_to_int : pixbufformatflags -> int


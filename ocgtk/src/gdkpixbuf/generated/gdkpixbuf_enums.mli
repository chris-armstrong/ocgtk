(* GENERATED CODE - DO NOT EDIT *)
(* GdkPixbuf Enumeration and Bitfield Types *)

(* Colorspace - enumeration *)
type colorspace = [
  | `RGB (** Indicates a red/green/blue additive color space. *)
]

val colorspace_of_int : int -> colorspace
val colorspace_to_int : colorspace -> int

(* InterpType - enumeration *)
type interptype = [
  | `NEAREST (** Nearest neighbor sampling; this is the fastest
and lowest quality mode. Quality is normally unacceptable when scaling
down, but may be OK when scaling up. *)
  | `TILES (** This is an accurate simulation of the PostScript
image operator without any interpolation enabled.  Each pixel is
rendered as a tiny parallelogram of solid color, the edges of which
are implemented with antialiasing.  It resembles nearest neighbor for
enlargement, and bilinear for reduction. *)
  | `BILINEAR (** Best quality/speed balance; use this mode by
default. Bilinear interpolation.  For enlargement, it is
equivalent to point-sampling the ideal bilinear-interpolated image.
For reduction, it is equivalent to laying down small tiles and
integrating over the coverage area. *)
  | `HYPER (** This is the slowest and highest quality
reconstruction function. It is derived from the hyperbolic filters in
Wolberg's “Digital Image Warping”, and is formally defined as the
hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
image (the filter is designed to be idempotent for 1:1 pixel mapping).
{b Deprecated}: this interpolation filter is deprecated, as in reality
it has a lower quality than the \@GDK_INTERP_BILINEAR filter
(Since: 2.38) *)
]

val interptype_of_int : int -> interptype
val interptype_to_int : interptype -> int

(* PixbufAlphaMode - enumeration *)
type pixbufalphamode = [
  | `BILEVEL (** A bilevel clipping mask (black and white)
will be created and used to draw the image.  Pixels below 0.5 opacity
will be considered fully transparent, and all others will be
considered fully opaque. *)
  | `FULL (** For now falls back to [GDK_PIXBUF_ALPHA_BILEVEL].
In the future it will do full alpha compositing. *)
]

val pixbufalphamode_of_int : int -> pixbufalphamode
val pixbufalphamode_to_int : pixbufalphamode -> int

(* PixbufError - enumeration *)
type pixbuferror = [
  | `CORRUPT_IMAGE (** An image file was broken somehow. *)
  | `INSUFFICIENT_MEMORY (** Not enough memory. *)
  | `BAD_OPTION (** A bad option was passed to a pixbuf save module. *)
  | `UNKNOWN_TYPE (** Unknown image type. *)
  | `UNSUPPORTED_OPERATION (** Don't know how to perform the
given operation on the type of image at hand. *)
  | `FAILED (** Generic failure code, something went wrong. *)
  | `INCOMPLETE_ANIMATION (** Only part of the animation was loaded. *)
]

val pixbuferror_of_int : int -> pixbuferror
val pixbuferror_to_int : pixbuferror -> int

(* PixbufRotation - enumeration *)
type pixbufrotation = [
  | `NONE (** No rotation. *)
  | `COUNTERCLOCKWISE (** Rotate by 90 degrees. *)
  | `UPSIDEDOWN (** Rotate by 180 degrees. *)
  | `CLOCKWISE (** Rotate by 270 degrees. *)
]

val pixbufrotation_of_int : int -> pixbufrotation
val pixbufrotation_to_int : pixbufrotation -> int

(* PixbufFormatFlags - bitfield/flags *)
type pixbufformatflags_flag = [
  | `WRITABLE (** the module can write out images in the format. *)
  | `SCALABLE (** the image format is scalable *)
  | `THREADSAFE (** the module is threadsafe. gdk-pixbuf
ignores modules that are not marked as threadsafe. (Since 2.28). *)
]

type pixbufformatflags = pixbufformatflags_flag list

val pixbufformatflags_of_int : int -> pixbufformatflags
val pixbufformatflags_to_int : pixbufformatflags -> int


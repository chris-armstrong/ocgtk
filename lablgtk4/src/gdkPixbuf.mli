(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(*    This program is distributed in the hope that it will be useful,     *)
(*    but WITHOUT ANY WARRANTY; without even the implied warranty of      *)
(*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       *)
(*    GNU Library General Public License for more details.                *)
(*                                                                        *)
(*    You should have received a copy of the GNU Library General          *)
(*    Public License along with this program; if not, write to the        *)
(*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,         *)
(*    Boston, MA 02111-1307  USA                                          *)
(*                                                                        *)
(**************************************************************************)

(** GdkPixbuf - Object for manipulating image data

    GdkPixbuf is a library for loading, manipulating, and saving image data.
    GTK4 continues to use GdkPixbuf with the same stable API.
    @gtkdoc gdk-pixbuf GdkPixbuf *)

(** {2 Types} *)

type pixbuf = [`pixbuf] Gobject.obj
(** The GdkPixbuf structure *)

type colorspace = [ `RGB ]
(** Colorspace for image data (currently only RGB is supported) *)

type alpha_mode = [ `BILEVEL | `FULL ]
(** Alpha channel rendering mode *)

type interpolation = [ `BILINEAR | `HYPER | `NEAREST | `TILES ]
(** Interpolation mode for scaling operations *)

(** {2 Errors} *)

type gdkpixbuferror =
  | ERROR_CORRUPT_IMAGE
  | ERROR_INSUFFICIENT_MEMORY
  | ERROR_BAD_OPTION
  | ERROR_UNKNOWN_TYPE
  | ERROR_UNSUPPORTED_OPERATION
  | ERROR_FAILED
(** GdkPixbuf error codes *)

exception GdkPixbufError of gdkpixbuferror * string
(** Exception raised on GdkPixbuf errors *)

(** {2 Creation} *)

val create :
  width:int -> height:int ->
  ?bits:int -> ?colorspace:colorspace -> ?has_alpha:bool -> unit -> pixbuf
(** [create ~width ~height ()] creates a new pixbuf with the specified dimensions.
    @param bits Bits per sample (default: 8)
    @param colorspace Colorspace (default: [`RGB])
    @param has_alpha Whether to include an alpha channel (default: [false])
    @gtkdoc gdk-pixbuf gdk_pixbuf_new *)

val cast : 'a Gobject.obj -> pixbuf
(** Cast a generic GObject to a pixbuf *)

external copy : pixbuf -> pixbuf = "ml_gdk_pixbuf_copy"
(** Create a copy of a pixbuf
    @gtkdoc gdk-pixbuf gdk_pixbuf_copy *)

external subpixbuf : pixbuf -> src_x:int -> src_y:int -> width:int -> height:int -> pixbuf
  = "ml_gdk_pixbuf_new_subpixbuf"
(** Create a new pixbuf which represents a sub-region of another pixbuf.
    The new pixbuf shares pixel data with the source, so changing one affects both.
    @gtkdoc gdk-pixbuf gdk_pixbuf_new_subpixbuf *)

(** {2 Loading} *)

external from_file : string -> pixbuf = "ml_gdk_pixbuf_new_from_file"
(** Load an image from a file.
    Supports PNG, JPEG, GIF, TIFF, BMP, and other formats.
    @raise GdkPixbufError if the file cannot be loaded
    @gtkdoc gdk-pixbuf gdk_pixbuf_new_from_file *)

external get_file_info : string -> string * int * int = "ml_gdk_pixbuf_get_file_info"
(** Get information about an image file without loading it.
    @return [(format_name, width, height)]
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_file_info *)

external from_file_at_size : string -> width:int -> height:int -> pixbuf
  = "ml_gdk_pixbuf_new_from_file_at_size"
(** Load an image from a file, scaling it to the specified dimensions.
    @gtkdoc gdk-pixbuf gdk_pixbuf_new_from_file_at_size *)

external from_xpm_data : string array -> pixbuf
  = "ml_gdk_pixbuf_new_from_xpm_data"
(** Create a pixbuf from XPM data.
    @gtkdoc gdk-pixbuf gdk_pixbuf_new_from_xpm_data *)

(** {2 Accessors} *)

external get_n_channels : pixbuf -> int = "ml_gdk_pixbuf_get_n_channels"
(** Get the number of channels (3 for RGB, 4 for RGBA)
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_n_channels *)

external get_has_alpha : pixbuf -> bool = "ml_gdk_pixbuf_get_has_alpha"
(** Check if the pixbuf has an alpha channel
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_has_alpha *)

external get_bits_per_sample : pixbuf -> int
  = "ml_gdk_pixbuf_get_bits_per_sample"
(** Get the number of bits per color sample
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_bits_per_sample *)

external get_width : pixbuf -> int = "ml_gdk_pixbuf_get_width"
(** Get the width of the pixbuf in pixels
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_width *)

external get_height : pixbuf -> int = "ml_gdk_pixbuf_get_height"
(** Get the height of the pixbuf in pixels
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_height *)

external get_rowstride : pixbuf -> int = "ml_gdk_pixbuf_get_rowstride"
(** Get the number of bytes between the start of one row and the next
    @gtkdoc gdk-pixbuf gdk_pixbuf_get_rowstride *)

(** {2 Transform} *)

val add_alpha : ?transparent:int * int * int -> pixbuf -> pixbuf
(** Add an alpha channel to a pixbuf.
    @param transparent Optional RGB color to be made fully transparent
    @gtkdoc gdk-pixbuf gdk_pixbuf_add_alpha *)

external fill : pixbuf -> int32 -> unit = "ml_gdk_pixbuf_fill"
(** Fill a pixbuf with a solid color.
    The color is specified as a 32-bit integer in RGBA format (0xRRGGBBAA).
    @gtkdoc gdk-pixbuf gdk_pixbuf_fill *)

val saturate_and_pixelate : dest:pixbuf -> saturation:float -> pixelate:bool -> pixbuf -> unit
(** Modify saturation and optionally pixelate a pixbuf.
    @param dest Destination pixbuf
    @param saturation Saturation level (0.0 = grayscale, 1.0 = no change)
    @param pixelate Whether to pixelate the image
    @gtkdoc gdk-pixbuf gdk_pixbuf_saturate_and_pixelate *)

val copy_area :
  dest:pixbuf ->
  ?dest_x:int ->
  ?dest_y:int ->
  ?width:int -> ?height:int -> ?src_x:int -> ?src_y:int -> pixbuf -> unit
(** Copy a rectangular area from a source pixbuf to a destination pixbuf.
    @gtkdoc gdk-pixbuf gdk_pixbuf_copy_area *)

(** {2 Scaling} *)

val scale :
  dest:pixbuf ->
  ?dest_x:int ->
  ?dest_y:int ->
  ?width:int ->
  ?height:int ->
  ?ofs_x:float ->
  ?ofs_y:float ->
  ?scale_x:float -> ?scale_y:float -> ?interp:interpolation -> pixbuf -> unit
(** Scale a source pixbuf and place the result in a destination pixbuf.
    @gtkdoc gdk-pixbuf gdk_pixbuf_scale *)

val composite :
  dest:pixbuf ->
  alpha:int ->
  ?dest_x:int ->
  ?dest_y:int ->
  ?width:int ->
  ?height:int ->
  ?ofs_x:float ->
  ?ofs_y:float ->
  ?scale_x:float -> ?scale_y:float -> ?interp:interpolation -> pixbuf -> unit
(** Composite a source pixbuf onto a destination pixbuf with alpha blending.
    @param alpha Overall alpha value (0-255)
    @gtkdoc gdk-pixbuf gdk_pixbuf_composite *)

(** {2 Saving} *)

external save : filename:string -> typ:string -> ?options:(string * string) list -> pixbuf -> unit
    = "ml_gdk_pixbuf_save"
(** Save a pixbuf to a file.
    @param filename Output file path
    @param typ Image format ("png", "jpeg", "tiff", etc.)
    @param options Format-specific options (e.g., [("quality", "95")] for JPEG)
    @raise GdkPixbufError if saving fails
    @gtkdoc gdk-pixbuf gdk_pixbuf_savev *)

external save_to_callback :
  pixbuf -> typ:string -> ?options:(string * string) list ->
  (string -> unit) -> unit = "ml_gdk_pixbuf_save_to_callback"
(** Save a pixbuf by calling a function with the image data.
    The callback is called multiple times with chunks of data.
    @gtkdoc gdk-pixbuf gdk_pixbuf_save_to_callback *)

val save_to_buffer :
  pixbuf -> typ:string -> ?options:(string * string) list ->
  Buffer.t -> unit
(** Save a pixbuf to a buffer.
    Convenience function that uses [save_to_callback]. *)

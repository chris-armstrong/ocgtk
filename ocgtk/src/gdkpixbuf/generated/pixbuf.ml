(* GENERATED CODE - DO NOT EDIT *)
(* Pixbuf: Pixbuf *)

type t = [`pixbuf | `object_] Gobject.obj

(** Create a new Pixbuf *)
external new_ : Gdkpixbuf_enums.colorspace -> bool -> int -> int -> int -> t = "ml_gdk_pixbuf_new"

(** Create a new Pixbuf *)
external new_from_bytes : unit -> Gdkpixbuf_enums.colorspace -> bool -> int -> int -> int -> int -> t = "ml_gdk_pixbuf_new_from_bytes_bytecode" "ml_gdk_pixbuf_new_from_bytes_native"

(** Create a new Pixbuf *)
external new_from_data : unit -> Gdkpixbuf_enums.colorspace -> bool -> int -> int -> int -> int -> unit -> unit -> t = "ml_gdk_pixbuf_new_from_data_bytecode" "ml_gdk_pixbuf_new_from_data_native"

(** Create a new Pixbuf *)
external new_from_xpm_data : string array -> t = "ml_gdk_pixbuf_new_from_xpm_data"

(* Methods *)
(** Removes a reference from a pixbuf. *)
external unref : t -> unit = "ml_gdk_pixbuf_unref"

(** Attaches a key/value pair as an option to a `GdkPixbuf`.

If `key` already exists in the list of options attached to the `pixbuf`,
the new value is ignored and `FALSE` is returned. *)
external set_option : t -> string -> string -> bool = "ml_gdk_pixbuf_set_option"

(** Create a new pixbuf containing a copy of `src` scaled to
`dest_width` x `dest_height`.

This function leaves `src` unaffected.

The `interp_type` should be `GDK_INTERP_NEAREST` if you want maximum
speed (but when scaling down `GDK_INTERP_NEAREST` is usually unusably
ugly). The default `interp_type` should be `GDK_INTERP_BILINEAR` which
offers reasonable quality and speed.

You can scale a sub-portion of `src` by creating a sub-pixbuf
pointing into `src`; see [method@GdkPixbuf.Pixbuf.new_subpixbuf].

If `dest_width` and `dest_height` are equal to the width and height of
`src`, this function will return an unscaled copy of `src`.

For more complicated scaling/alpha blending see [method@GdkPixbuf.Pixbuf.scale]
and [method@GdkPixbuf.Pixbuf.composite]. *)
external scale_simple : t -> int -> int -> Gdkpixbuf_enums.interptype -> t option = "ml_gdk_pixbuf_scale_simple"

(** Creates a transformation of the source image @src by scaling by
@scale_x and @scale_y then translating by @offset_x and @offset_y,
then renders the rectangle (@dest_x, @dest_y, @dest_width,
@dest_height) of the resulting image onto the destination image
replacing the previous contents.

Try to use gdk_pixbuf_scale_simple() first; this function is
the industrial-strength power tool you can fall back to, if
gdk_pixbuf_scale_simple() isn't powerful enough.

If the source rectangle overlaps the destination rectangle on the
same pixbuf, it will be overwritten during the scaling which
results in rendering artifacts. *)
external scale : t -> t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> unit = "ml_gdk_pixbuf_scale_bytecode" "ml_gdk_pixbuf_scale_native"

(** Vector version of `gdk_pixbuf_save()`.

Saves pixbuf to a file in `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp".

If @error is set, `FALSE` will be returned.

See [method@GdkPixbuf.Pixbuf.save] for more details. *)
external savev : t -> string -> string -> string array option -> string array option -> (bool, GError.t) result = "ml_gdk_pixbuf_savev"

(** Modifies saturation and optionally pixelates `src`, placing the result in
`dest`.

The `src` and `dest` pixbufs must have the same image format, size, and
rowstride.

The `src` and `dest` arguments may be the same pixbuf with no ill effects.

If `saturation` is 1.0 then saturation is not changed. If it's less than 1.0,
saturation is reduced (the image turns toward grayscale); if greater than
1.0, saturation is increased (the image gets more vivid colors).

If `pixelate` is `TRUE`, then pixels are faded in a checkerboard pattern to
create a pixelated image. *)
external saturate_and_pixelate : t -> t -> float -> bool -> unit = "ml_gdk_pixbuf_saturate_and_pixelate"

(** Rotates a pixbuf by a multiple of 90 degrees, and returns the
result in a new pixbuf.

If `angle` is 0, this function will return a copy of `src`. *)
external rotate_simple : t -> Gdkpixbuf_enums.pixbufrotation -> t option = "ml_gdk_pixbuf_rotate_simple"

(** Removes the key/value pair option attached to a `GdkPixbuf`. *)
external remove_option : t -> string -> bool = "ml_gdk_pixbuf_remove_option"

(** Adds a reference to a pixbuf. *)
external ref : t -> t = "ml_gdk_pixbuf_ref"

(** Creates a new pixbuf which represents a sub-region of `src_pixbuf`.

The new pixbuf shares its pixels with the original pixbuf, so
writing to one affects both.  The new pixbuf holds a reference to
`src_pixbuf`, so `src_pixbuf` will not be finalized until the new
pixbuf is finalized.

Note that if `src_pixbuf` is read-only, this function will force it
to be mutable. *)
external new_subpixbuf : t -> int -> int -> int -> int -> t = "ml_gdk_pixbuf_new_subpixbuf"

(** Queries the width of a pixbuf. *)
external get_width : t -> int = "ml_gdk_pixbuf_get_width"

(** Queries the rowstride of a pixbuf, which is the number of bytes between
the start of a row and the start of the next row. *)
external get_rowstride : t -> int = "ml_gdk_pixbuf_get_rowstride"

(** Looks up @key in the list of options that may have been attached to the
@pixbuf when it was loaded, or that may have been attached by another
function using gdk_pixbuf_set_option().

For instance, the ANI loader provides "Title" and "Artist" options.
The ICO, XBM, and XPM loaders provide "x_hot" and "y_hot" hot-spot
options for cursor definitions. The PNG loader provides the tEXt ancillary
chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders
return an "orientation" option string that corresponds to the embedded
TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets
the "multipage" option string to "yes" when a multi-page TIFF is loaded.
Since 2.32 the JPEG and PNG loaders set "x-dpi" and "y-dpi" if the file
contains image density information in dots per inch.
Since 2.36.6, the JPEG loader sets the "comment" option with the comment
EXIF tag. *)
external get_option : t -> string -> string option = "ml_gdk_pixbuf_get_option"

(** Queries the number of channels of a pixbuf. *)
external get_n_channels : t -> int = "ml_gdk_pixbuf_get_n_channels"

(** Queries the height of a pixbuf. *)
external get_height : t -> int = "ml_gdk_pixbuf_get_height"

(** Queries whether a pixbuf has an alpha channel (opacity information). *)
external get_has_alpha : t -> bool = "ml_gdk_pixbuf_get_has_alpha"

(** Queries the color space of a pixbuf. *)
external get_colorspace : t -> Gdkpixbuf_enums.colorspace = "ml_gdk_pixbuf_get_colorspace"

(** Queries the number of bits per color sample in a pixbuf. *)
external get_bits_per_sample : t -> int = "ml_gdk_pixbuf_get_bits_per_sample"

(** Flips a pixbuf horizontally or vertically and returns the
result in a new pixbuf. *)
external flip : t -> bool -> t option = "ml_gdk_pixbuf_flip"

(** Copies the key/value pair options attached to a `GdkPixbuf` to another
`GdkPixbuf`.

This is useful to keep original metadata after having manipulated
a file. However be careful to remove metadata which you've already
applied, such as the "orientation" option after rotating the image. *)
external copy_options : t -> t -> bool = "ml_gdk_pixbuf_copy_options"

(** Copies a rectangular area from `src_pixbuf` to `dest_pixbuf`.

Conversion of pixbuf formats is done automatically.

If the source rectangle overlaps the destination rectangle on the
same pixbuf, it will be overwritten during the copy operation.
Therefore, you can not use this function to scroll a pixbuf. *)
external copy_area : t -> int -> int -> int -> int -> t -> int -> int -> unit = "ml_gdk_pixbuf_copy_area_bytecode" "ml_gdk_pixbuf_copy_area_native"

(** Creates a new `GdkPixbuf` with a copy of the information in the specified
`pixbuf`.

Note that this does not copy the options set on the original `GdkPixbuf`,
use gdk_pixbuf_copy_options() for this. *)
external copy : t -> t option = "ml_gdk_pixbuf_copy"

(** Creates a transformation of the source image @src by scaling by
@scale_x and @scale_y then translating by @offset_x and @offset_y.

This gives an image in the coordinates of the destination pixbuf.
The rectangle (@dest_x, @dest_y, @dest_width, @dest_height)
is then alpha blended onto the corresponding rectangle of the
original destination image.

When the destination rectangle contains parts not in the source
image, the data at the edges of the source image is replicated
to infinity.

![](composite.png) *)
external composite : t -> t -> int -> int -> int -> int -> float -> float -> float -> float -> Gdkpixbuf_enums.interptype -> int -> unit = "ml_gdk_pixbuf_composite_bytecode" "ml_gdk_pixbuf_composite_native"

(** Takes an existing pixbuf and checks for the presence of an
associated "orientation" option.

The orientation option may be provided by the JPEG loader (which
reads the exif orientation tag) or the TIFF loader (which reads
the TIFF orientation tag, and compensates it for the partial
transforms performed by libtiff).

If an orientation option/tag is present, the appropriate transform
will be performed so that the pixbuf is oriented correctly. *)
external apply_embedded_orientation : t -> t option = "ml_gdk_pixbuf_apply_embedded_orientation"

(* Properties *)


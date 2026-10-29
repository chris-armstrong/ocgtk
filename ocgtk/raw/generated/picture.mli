(* GENERATED CODE - DO NOT EDIT *)
(* Picture: Picture *)

[@@@ocaml.text
"Displays a [GdkPaintable].\n\n\
 An example GtkPicture\n\n\
 Many convenience functions are provided to make pictures simple to use.\n\
 For example, if you want to load an image from a file, and then display\n\
 it, there’s a convenience function to do this:\n\n\
 {[\n\
 GtkWidget *widget = gtk_picture_new_for_filename (\"myfile.png\");\n\
 ]}\n\n\
 If the file isn’t loaded successfully, the picture will contain a\n\
 “broken image” icon similar to that used in many web browsers.\n\
 If you want to handle errors in loading the file yourself,\n\
 for example by displaying an error message, then load the image with\n\
 and image loading framework such as libglycin, then create the [GtkPicture]\n\
 with \
 {{!Ocgtk.Raw.Picture.val-new_for_paintable}[Gtk.Picture.new_for_paintable]}.\n\n\
 Sometimes an application will want to avoid depending on external data\n\
 files, such as image files. See the documentation of [GResource] for details.\n\
 In this case, \
 {{!Ocgtk.Raw.Picture.val-new_for_resource}[Gtk.Picture.new_for_resource]} and\n\
 {{!Ocgtk.Raw.Picture.val-set_resource}[Gtk.Picture.set_resource]} should be \
 used.\n\n\
 [GtkPicture] displays an image at its natural size. See \
 {{!Ocgtk.Raw.Image}[Gtk.Image]}\n\
 if you want to display a fixed-size image, such as an icon.\n\n\
 {b Sizing the paintable}\n\n\
 You can influence how the paintable is displayed inside the [GtkPicture]\n\
 by changing \
 {{!Ocgtk.Raw.Picture.val-get_content_fit}[Gtk.Picture:content-fit]}. See \
 {{!Ocgtk.Enums.type-contentfit}[Gtk.ContentFit]}\n\
 for details. \
 {{!Ocgtk.Raw.Picture.val-get_can_shrink}[Gtk.Picture:can-shrink]} can be \
 unset to make sure\n\
 that paintables are never made smaller than their ideal size - but\n\
 be careful if you do not know the size of the paintable in use (like\n\
 when displaying user-loaded images). This can easily cause the picture to\n\
 grow larger than the screen. And \
 {{!Ocgtk.Raw.Widget.val-get_halign}[Gtk.Widget:halign]} and\n\
 {{!Ocgtk.Raw.Widget.val-get_valign}[Gtk.Widget:valign]} can be used to make \
 sure the paintable doesn't\n\
 fill all available space but is instead displayed at its original size.\n\n\
 {b CSS nodes}\n\n\
 [GtkPicture] has a single CSS node with the name [picture].\n\n\
 {b Accessibility}\n\n\
 [GtkPicture] uses the \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-IMG}[Gtk.AccessibleRole.img]} \
 role.\n\n\
 The class built on this module is in {!Ocgtk.Picture}."]

type t = [ `picture | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_picture_get_type"

external new_ : unit -> t = "ml_gtk_picture_new"
(** Creates a new empty [GtkPicture] widget. *)

external new_for_file : Ocgio_raw.File.t option -> t
  = "ml_gtk_picture_new_for_file"
(** Creates a new [GtkPicture] displaying the given [file].

    If the file isn’t found or can’t be loaded, the resulting [GtkPicture] is
    empty.

    If you need to detect failures to load the file, use an image loading
    framework such as libglycin to load the file yourself, then create the
    [GtkPicture] from the texture. *)

external new_for_filename : string option -> t
  = "ml_gtk_picture_new_for_filename"
(** Creates a new [GtkPicture] displaying the file [filename].

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-new_for_file}[Gtk.Picture.new_for_file]}. See that
    function for details. *)

external new_for_paintable : Ocgdk_raw.Paintable.t option -> t
  = "ml_gtk_picture_new_for_paintable"
(** Creates a new [GtkPicture] displaying [paintable].

    The [GtkPicture] will track changes to the [paintable] and update its size
    and contents in response to it. *)

external new_for_pixbuf : Ocgdkpixbuf_raw.Pixbuf.t option -> t
  = "ml_gtk_picture_new_for_pixbuf"
(** Creates a new [GtkPicture] displaying [pixbuf].

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-new_for_paintable}[Gtk.Picture.new_for_paintable]},
    See that function for details.

    The pixbuf must not be modified after passing it to this function. *)

external new_for_resource : string option -> t
  = "ml_gtk_picture_new_for_resource"
(** Creates a new [GtkPicture] displaying the resource at [resource_path].

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-new_for_file}[Gtk.Picture.new_for_file]}. See that
    function for details. *)

(* Methods *)

external set_resource : t -> string option -> unit
  = "ml_gtk_picture_set_resource"
(** Makes [self] load and display the resource at the given [resource_path].

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-set_file}[Gtk.Picture.set_file]}. *)

external set_pixbuf : t -> Ocgdkpixbuf_raw.Pixbuf.t option -> unit
  = "ml_gtk_picture_set_pixbuf"
(** Sets a [GtkPicture] to show a [GdkPixbuf].

    See {{!Ocgtk.Raw.Picture.val-new_for_pixbuf}[Gtk.Picture.new_for_pixbuf]}
    for details.

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-set_paintable}[Gtk.Picture.set_paintable]}. *)

external set_paintable : t -> Ocgdk_raw.Paintable.t option -> unit
  = "ml_gtk_picture_set_paintable"
(** Makes [self] display the given [paintable].

    If [paintable] is [None], nothing will be displayed.

    See
    {{!Ocgtk.Raw.Picture.val-new_for_paintable}[Gtk.Picture.new_for_paintable]}
    for details. *)

external set_keep_aspect_ratio : t -> bool -> unit
  = "ml_gtk_picture_set_keep_aspect_ratio"
(** If set to [true], the [self] will render its contents according to their
    aspect ratio.

    That means that empty space may show up at the top/bottom or left/right of
    [self].

    If set to [false] or if the contents provide no aspect ratio, the contents
    will be stretched over the picture's whole area. *)

external set_filename : t -> string option -> unit
  = "ml_gtk_picture_set_filename"
(** Makes [self] load and display the given [filename].

    This is a utility function that calls
    {{!Ocgtk.Raw.Picture.val-set_file}[Gtk.Picture.set_file]}.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture], and then use
    {{!Ocgtk.Raw.Image.val-set_from_paintable}[Gtk.Image.set_from_paintable]}.
*)

external set_file : t -> Ocgio_raw.File.t option -> unit
  = "ml_gtk_picture_set_file"
(** Makes [self] load and display [file].

    See {{!Ocgtk.Raw.Picture.val-new_for_file}[Gtk.Picture.new_for_file]} for
    details.

    Note that this function should not be used with untrusted data. Use a proper
    image loading framework such as libglycin, which can load many image formats
    into a [GdkTexture], and then use
    {{!Ocgtk.Raw.Image.val-set_from_paintable}[Gtk.Image.set_from_paintable]}.
*)

external set_content_fit : t -> Ocgtk_enums.contentfit -> unit
  = "ml_gtk_picture_set_content_fit"
(** Sets how the content should be resized to fit the [GtkPicture].

    See {{!Ocgtk.Enums.type-contentfit}[Gtk.ContentFit]} for details. *)

external set_can_shrink : t -> bool -> unit = "ml_gtk_picture_set_can_shrink"
(** If set to [true], the [self] can be made smaller than its contents.

    The contents will then be scaled down when rendering.

    If you want to still force a minimum size manually, consider using
    {{!Ocgtk.Raw.Widget.val-set_size_request}[Gtk.Widget.set_size_request]}.

    Also of note is that a similar function for growing does not exist because
    the grow behavior can be controlled via
    {{!Ocgtk.Raw.Widget.val-set_halign}[Gtk.Widget.set_halign]} and
    {{!Ocgtk.Raw.Widget.val-set_valign}[Gtk.Widget.set_valign]}. *)

external set_alternative_text : t -> string option -> unit
  = "ml_gtk_picture_set_alternative_text"
[@@ocaml.doc
  "Sets an alternative textual description for the picture contents.\n\n\
   It is equivalent to the \"alt\" attribute for images on websites.\n\n\
   This text will be made available to accessibility tools.\n\n\
   If the picture cannot be described textually, set this property to [None]."]

external get_paintable : t -> Ocgdk_raw.Paintable.t option
  = "ml_gtk_picture_get_paintable"
(** Gets the [GdkPaintable] being displayed by the [GtkPicture]. *)

external get_keep_aspect_ratio : t -> bool
  = "ml_gtk_picture_get_keep_aspect_ratio"
(** Returns whether the [GtkPicture] preserves its contents aspect ratio. *)

external get_file : t -> Ocgio_raw.File.t option = "ml_gtk_picture_get_file"
(** Gets the [GFile] currently displayed if [self] is displaying a file.

    If [self] is not displaying a file, for example when
    {{!Ocgtk.Raw.Picture.val-set_paintable}[Gtk.Picture.set_paintable]} was
    used, then [None] is returned. *)

external get_content_fit : t -> Ocgtk_enums.contentfit
  = "ml_gtk_picture_get_content_fit"
(** Returns the fit mode for the content of the [GtkPicture].

    See {{!Ocgtk.Enums.type-contentfit}[Gtk.ContentFit]} for details. *)

external get_can_shrink : t -> bool = "ml_gtk_picture_get_can_shrink"
(** Returns whether the [GtkPicture] respects its contents size. *)

external get_alternative_text : t -> string option
  = "ml_gtk_picture_get_alternative_text"
(** Gets the alternative textual description of the picture.

    The returned string will be [None] if the picture cannot be described
    textually. *)

(* Properties *)

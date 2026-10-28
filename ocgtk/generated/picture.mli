(** Displays a [GdkPaintable].

    Its methods, signals and properties are on {!class-type-picture_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Picture}. *)

(** {1:class Class} *)

class type picture_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_alternative_text : unit -> string option
  (** Gets the alternative textual description of the picture.

      The returned string will be [None] if the picture cannot be described
      textually. *)

  method get_can_shrink : unit -> bool
  (** Returns whether the [GtkPicture] respects its contents size. *)

  method get_content_fit : unit -> Enums.contentfit
  (** Returns the fit mode for the content of the [GtkPicture].

      See [Gtk.ContentFit] for details. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the [GFile] currently displayed if [self] is displaying a file.

      If [self] is not displaying a file, for example when
      [Gtk.Picture.set_paintable] was used, then [None] is returned. *)

  method get_keep_aspect_ratio : unit -> bool
  (** Returns whether the [GtkPicture] preserves its contents aspect ratio. *)

  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  (** Gets the [GdkPaintable] being displayed by the [GtkPicture]. *)

  method set_alternative_text : string option -> unit
  [@@ocaml.doc
    "Sets an alternative textual description for the picture contents.\n\n\
     It is equivalent to the \"alt\" attribute for images on websites.\n\n\
     This text will be made available to accessibility tools.\n\n\
     If the picture cannot be described textually, set this property to [None]."]

  method set_can_shrink : bool -> unit
  (** If set to [true], the [self] can be made smaller than its contents.

      The contents will then be scaled down when rendering.

      If you want to still force a minimum size manually, consider using
      [Gtk.Widget.set_size_request].

      Also of note is that a similar function for growing does not exist because
      the grow behavior can be controlled via [Gtk.Widget.set_halign] and
      [Gtk.Widget.set_valign]. *)

  method set_content_fit : Enums.contentfit -> unit
  (** Sets how the content should be resized to fit the [GtkPicture].

      See [Gtk.ContentFit] for details. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Makes [self] load and display [file].

      See [Gtk.Picture.new_for_file] for details.

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_filename : string option -> unit
  (** Makes [self] load and display the given [filename].

      This is a utility function that calls [Gtk.Picture.set_file].

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_keep_aspect_ratio : bool -> unit
  (** If set to [true], the [self] will render its contents according to their
      aspect ratio.

      That means that empty space may show up at the top/bottom or left/right of
      [self].

      If set to [false] or if the contents provide no aspect ratio, the contents
      will be stretched over the picture's whole area. *)

  method set_paintable : Ocgdk.Paintable.paintable_t option -> unit
  (** Makes [self] display the given [paintable].

      If [paintable] is [None], nothing will be displayed.

      See [Gtk.Picture.new_for_paintable] for details. *)

  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  (** Sets a [GtkPicture] to show a [GdkPixbuf].

      See [Gtk.Picture.new_for_pixbuf] for details.

      This is a utility function that calls [Gtk.Picture.set_paintable]. *)

  method set_resource : string option -> unit
  (** Makes [self] load and display the resource at the given [resource_path].

      This is a utility function that calls [Gtk.Picture.set_file]. *)

  (** {2:conversions Conversions} *)

  method as_picture : Raw.Picture.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Picture].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Displays a [GdkPaintable].\n\n\
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
     with [Gtk.Picture.new_for_paintable].\n\n\
     Sometimes an application will want to avoid depending on external data\n\
     files, such as image files. See the documentation of [GResource] for \
     details.\n\
     In this case, [Gtk.Picture.new_for_resource] and\n\
     [Gtk.Picture.set_resource] should be used.\n\n\
     [GtkPicture] displays an image at its natural size. See [Gtk.Image]\n\
     if you want to display a fixed-size image, such as an icon.\n\n\
     {b Sizing the paintable}\n\n\
     You can influence how the paintable is displayed inside the [GtkPicture]\n\
     by changing [Gtk.Picture:content-fit]. See [Gtk.ContentFit]\n\
     for details. [Gtk.Picture:can-shrink] can be unset to make sure\n\
     that paintables are never made smaller than their ideal size - but\n\
     be careful if you do not know the size of the paintable in use (like\n\
     when displaying user-loaded images). This can easily cause the picture to\n\
     grow larger than the screen. And [Gtk.Widget:halign] and\n\
     [Gtk.Widget:valign] can be used to make sure the paintable doesn't\n\
     fill all available space but is instead displayed at its original size.\n\n\
     {b CSS nodes}\n\n\
     [GtkPicture] has a single CSS node with the name [picture].\n\n\
     {b Accessibility}\n\n\
     [GtkPicture] uses the [Gtk.AccessibleRole.img] role."]

class picture : Raw.Picture.t -> picture_t
(** Wraps a raw handle of {!Ocgtk.Raw.Picture.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Displays a [GdkPaintable].\n\n\
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
 with [Gtk.Picture.new_for_paintable].\n\n\
 Sometimes an application will want to avoid depending on external data\n\
 files, such as image files. See the documentation of [GResource] for details.\n\
 In this case, [Gtk.Picture.new_for_resource] and\n\
 [Gtk.Picture.set_resource] should be used.\n\n\
 [GtkPicture] displays an image at its natural size. See [Gtk.Image]\n\
 if you want to display a fixed-size image, such as an icon.\n\n\
 {b Sizing the paintable}\n\n\
 You can influence how the paintable is displayed inside the [GtkPicture]\n\
 by changing [Gtk.Picture:content-fit]. See [Gtk.ContentFit]\n\
 for details. [Gtk.Picture:can-shrink] can be unset to make sure\n\
 that paintables are never made smaller than their ideal size - but\n\
 be careful if you do not know the size of the paintable in use (like\n\
 when displaying user-loaded images). This can easily cause the picture to\n\
 grow larger than the screen. And [Gtk.Widget:halign] and\n\
 [Gtk.Widget:valign] can be used to make sure the paintable doesn't\n\
 fill all available space but is instead displayed at its original size.\n\n\
 {b CSS nodes}\n\n\
 [GtkPicture] has a single CSS node with the name [picture].\n\n\
 {b Accessibility}\n\n\
 [GtkPicture] uses the [Gtk.AccessibleRole.img] role."]

(** {1:constructors Constructors} *)

val new_ : unit -> picture_t
(** Creates a new empty [GtkPicture] widget. *)

val new_for_file : Ocgio.File.file_t option -> picture_t
(** Creates a new [GtkPicture] displaying the given [file].

    If the file isn’t found or can’t be loaded, the resulting [GtkPicture] is
    empty.

    If you need to detect failures to load the file, use an image loading
    framework such as libglycin to load the file yourself, then create the
    [GtkPicture] from the texture. *)

val new_for_filename : string option -> picture_t
(** Creates a new [GtkPicture] displaying the file [filename].

    This is a utility function that calls [Gtk.Picture.new_for_file]. See that
    function for details. *)

val new_for_paintable : Ocgdk.Paintable.paintable_t option -> picture_t
(** Creates a new [GtkPicture] displaying [paintable].

    The [GtkPicture] will track changes to the [paintable] and update its size
    and contents in response to it. *)

val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> picture_t
(** Creates a new [GtkPicture] displaying [pixbuf].

    This is a utility function that calls [Gtk.Picture.new_for_paintable], See
    that function for details.

    The pixbuf must not be modified after passing it to this function. *)

val new_for_resource : string option -> picture_t
(** Creates a new [GtkPicture] displaying the resource at [resource_path].

    This is a utility function that calls [Gtk.Picture.new_for_file]. See that
    function for details. *)

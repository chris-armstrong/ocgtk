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
 [GtkPicture] uses the [Gtk.AccessibleRole.img] role.\n\n\
 Its methods, signals and properties are on {!class-type-picture_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Picture}."]

(** The methods, signals and properties of a [GtkPicture]. *)
class type picture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_alternative_text : unit -> string option
  method get_can_shrink : unit -> bool
  method get_content_fit : unit -> Enums.contentfit
  method get_file : unit -> Ocgio.File.file_t option
  method get_keep_aspect_ratio : unit -> bool
  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  method set_alternative_text : string option -> unit
  method set_can_shrink : bool -> unit
  method set_content_fit : Enums.contentfit -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_keep_aspect_ratio : bool -> unit
  method set_paintable : Ocgdk.Paintable.paintable_t option -> unit
  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  method set_resource : string option -> unit
  method as_picture : Raw.Picture.t
end

class picture : Raw.Picture.t -> picture_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Picture.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPicture], give one already wrapped. *)

val new_ : unit -> picture_t
val new_for_file : Ocgio.File.file_t option -> picture_t
val new_for_filename : string option -> picture_t
val new_for_paintable : Ocgdk.Paintable.paintable_t option -> picture_t
val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> picture_t
val new_for_resource : string option -> picture_t

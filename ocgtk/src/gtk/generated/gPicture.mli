class type picture_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_alternative_text : unit -> string option
  method get_can_shrink : unit -> bool
  method get_content_fit : unit -> Gtk_enums.contentfit
  method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
  method get_keep_aspect_ratio : unit -> bool
  method get_paintable : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
  method set_alternative_text : string option -> unit
  method set_can_shrink : bool -> unit
  method set_content_fit : Gtk_enums.contentfit -> unit
  method set_file : Ocgtk_gio.Gio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_keep_aspect_ratio : bool -> unit
  method set_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit
  method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t option -> unit
  method set_resource : string option -> unit
  method as_picture : Picture.t
end

class picture : Picture.t -> picture_t

val new_ : unit -> picture_t
val new_for_file : Ocgtk_gio.Gio.File.file_t option -> picture_t
val new_for_filename : string option -> picture_t
val new_for_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> picture_t

val new_for_pixbuf :
  Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t option -> picture_t

val new_for_resource : string option -> picture_t

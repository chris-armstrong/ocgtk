class picture : Picture.t ->
  object
    method get_alternative_text : unit -> string option
    method get_can_shrink : unit -> bool
    method get_content_fit : unit -> Gtk_enums.contentfit
    method get_file : unit -> Ocgtk_gio.Gio.file option
    method get_keep_aspect_ratio : unit -> bool
    method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable option
    method set_alternative_text : string option -> unit
    method set_can_shrink : bool -> unit
    method set_content_fit : Gtk_enums.contentfit -> unit
    method set_file : #Ocgtk_gio.Gio.file option -> unit
    method set_filename : string option -> unit
    method set_keep_aspect_ratio : bool -> unit
    method set_paintable : #Ocgtk_gdk.Gdk.paintable option -> unit
    method set_pixbuf : #Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf option -> unit
    method set_resource : string option -> unit
    method as_picture : Picture.t
  end


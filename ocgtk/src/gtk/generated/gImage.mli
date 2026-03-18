class image : Image.t ->
  object
    method clear : unit -> unit
    method get_gicon : unit -> Ocgtk_gio.Gio.icon option
    method get_icon_name : unit -> string option
    method get_icon_size : unit -> Gtk_enums.iconsize
    method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable option
    method get_pixel_size : unit -> int
    method get_storage_type : unit -> Gtk_enums.imagetype
    method set_from_file : string option -> unit
    method set_from_gicon : #Ocgtk_gio.Gio.icon -> unit
    method set_from_icon_name : string option -> unit
    method set_from_paintable : #Ocgtk_gdk.Gdk.paintable option -> unit
    method set_from_pixbuf : #Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf option -> unit
    method set_from_resource : string option -> unit
    method set_icon_size : Gtk_enums.iconsize -> unit
    method set_pixel_size : int -> unit
    method file : string
    method set_file : string -> unit
    method resource : string
    method set_resource : string -> unit
    method use_fallback : bool
    method set_use_fallback : bool -> unit
    method as_image : Image.t
  end


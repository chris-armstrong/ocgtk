class cell_renderer_pixbuf : Cell_renderer_pixbuf.t ->
  object
    method gicon : Ocgtk_gio.Gio.icon
    method set_gicon : #Ocgtk_gio.Gio.icon -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method icon_size : Gtk_enums.iconsize
    method set_icon_size : Gtk_enums.iconsize -> unit
    method pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf
    method set_pixbuf : #Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf -> unit
    method pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf
    method set_pixbuf_expander_closed : #Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf -> unit
    method pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf
    method set_pixbuf_expander_open : #Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf -> unit
    method texture : Ocgtk_gdk.Gdk.texture
    method set_texture : #Ocgtk_gdk.Gdk.texture -> unit
    method as_cell_renderer_pixbuf : Cell_renderer_pixbuf.t
  end


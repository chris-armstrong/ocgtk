class type cell_renderer_pixbuf_t = object
    inherit GCell_renderer.cell_renderer_t
    method gicon : Ocgtk_gio.Gio.Icon.icon_t
    method set_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method icon_size : Gtk_enums.iconsize
    method set_icon_size : Gtk_enums.iconsize -> unit
    method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t
    method set_pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t
    method set_pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method texture : Ocgtk_gdk.Gdk.Texture.texture_t
    method set_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> unit
    method as_cell_renderer_pixbuf : Cell_renderer_pixbuf.t
end

class cell_renderer_pixbuf : Cell_renderer_pixbuf.t -> cell_renderer_pixbuf_t

val new_ : unit -> cell_renderer_pixbuf_t

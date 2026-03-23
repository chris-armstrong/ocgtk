class type cell_renderer_pixbuf_t = object
    inherit GCell_renderer.cell_renderer_t
    method gicon : Ocgtk_gio.Gio.Icon.icon_t
    method set_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method icon_size : Gtk_enums.iconsize
    method set_icon_size : Gtk_enums.iconsize -> unit
    method pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t
    method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t
    method set_pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t
    method set_pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit
    method texture : Ocgtk_gdk.Gdk.Texture.texture_t
    method set_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> unit
    method as_cell_renderer_pixbuf : Cell_renderer_pixbuf.t
end

(* High-level class for CellRendererPixbuf *)
class cell_renderer_pixbuf (obj : Cell_renderer_pixbuf.t) : cell_renderer_pixbuf_t = object (self)
  inherit GCell_renderer.cell_renderer (obj :> Cell_renderer.t)

  method gicon = new Ocgtk_gio.Gio.Icon.icon (Cell_renderer_pixbuf.get_gicon obj)
  method set_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit  = fun v ->  Cell_renderer_pixbuf.set_gicon obj v#as_icon

  method icon_name = Cell_renderer_pixbuf.get_icon_name obj
  method set_icon_name v =  Cell_renderer_pixbuf.set_icon_name obj v

  method icon_size = Cell_renderer_pixbuf.get_icon_size obj
  method set_icon_size v =  Cell_renderer_pixbuf.set_icon_size obj v

  method pixbuf = new Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf obj)
  method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf obj v#as_pixbuf

  method pixbuf_expander_closed = new Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf_expander_closed obj)
  method set_pixbuf_expander_closed : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf_expander_closed obj v#as_pixbuf

  method pixbuf_expander_open = new Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf_expander_open obj)
  method set_pixbuf_expander_open : Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf_expander_open obj v#as_pixbuf

  method texture = new Ocgtk_gdk.Gdk.Texture.texture (Cell_renderer_pixbuf.get_texture obj)
  method set_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> unit  = fun v ->  Cell_renderer_pixbuf.set_texture obj v#as_texture

    method as_cell_renderer_pixbuf = obj
end

let new_ () : cell_renderer_pixbuf_t =
  new cell_renderer_pixbuf (Cell_renderer_pixbuf.new_ ())


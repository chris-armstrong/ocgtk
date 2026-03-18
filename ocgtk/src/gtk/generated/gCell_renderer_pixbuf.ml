(* High-level class for CellRendererPixbuf *)
class cell_renderer_pixbuf (obj : Cell_renderer_pixbuf.t) = object (self)

  method gicon = new Ocgtk_gio.Gio.icon (Cell_renderer_pixbuf.get_gicon obj)
  method set_gicon : 'a . (#Ocgtk_gio.Gio.icon as 'a) -> unit  = fun v ->  Cell_renderer_pixbuf.set_gicon obj v#as_icon

  method icon_name = Cell_renderer_pixbuf.get_icon_name obj
  method set_icon_name v =  Cell_renderer_pixbuf.set_icon_name obj v

  method icon_size = Cell_renderer_pixbuf.get_icon_size obj
  method set_icon_size v =  Cell_renderer_pixbuf.set_icon_size obj v

  method pixbuf = new Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf obj)
  method set_pixbuf : 'a . (#Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf as 'a) -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf obj v#as_pixbuf

  method pixbuf_expander_closed = new Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf_expander_closed obj)
  method set_pixbuf_expander_closed : 'a . (#Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf as 'a) -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf_expander_closed obj v#as_pixbuf

  method pixbuf_expander_open = new Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf (Cell_renderer_pixbuf.get_pixbuf_expander_open obj)
  method set_pixbuf_expander_open : 'a . (#Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf as 'a) -> unit  = fun v ->  Cell_renderer_pixbuf.set_pixbuf_expander_open obj v#as_pixbuf

  method texture = new Ocgtk_gdk.Gdk.texture (Cell_renderer_pixbuf.get_texture obj)
  method set_texture : 'a . (#Ocgtk_gdk.Gdk.texture as 'a) -> unit  = fun v ->  Cell_renderer_pixbuf.set_texture obj v#as_texture

    method as_cell_renderer_pixbuf = obj
end


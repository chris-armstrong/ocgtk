class type cell_renderer_pixbuf_t = object
  inherit Cell_renderer.cell_renderer_t
  method gicon : Ocgio.Icon.icon_t
  method set_gicon : Ocgio.Icon.icon_t -> unit
  method icon_name : string
  method set_icon_name : string -> unit
  method icon_size : Enums.iconsize
  method set_icon_size : Enums.iconsize -> unit
  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  method pixbuf_expander_closed : Ocgdkpixbuf.Pixbuf.pixbuf_t
  method set_pixbuf_expander_closed : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  method pixbuf_expander_open : Ocgdkpixbuf.Pixbuf.pixbuf_t
  method set_pixbuf_expander_open : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  method texture : Ocgdk.Texture.texture_t
  method set_texture : Ocgdk.Texture.texture_t -> unit
  method as_cell_renderer_pixbuf : Raw.Cell_renderer_pixbuf.t
end

(* High-level class for CellRendererPixbuf *)
class cell_renderer_pixbuf (obj : Raw.Cell_renderer_pixbuf.t) :
  cell_renderer_pixbuf_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)
    method gicon = new Ocgio.Icon.icon (Raw.Cell_renderer_pixbuf.get_gicon obj)

    method set_gicon : Ocgio.Icon.icon_t -> unit =
      fun v -> Raw.Cell_renderer_pixbuf.set_gicon obj v#as_icon

    method icon_name = Raw.Cell_renderer_pixbuf.get_icon_name obj
    method set_icon_name v = Raw.Cell_renderer_pixbuf.set_icon_name obj v
    method icon_size = Raw.Cell_renderer_pixbuf.get_icon_size obj
    method set_icon_size v = Raw.Cell_renderer_pixbuf.set_icon_size obj v

    method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit =
      fun v -> Raw.Cell_renderer_pixbuf.set_pixbuf obj v#as_pixbuf

    method pixbuf_expander_closed =
      new Ocgdkpixbuf.Pixbuf.pixbuf
        (Raw.Cell_renderer_pixbuf.get_pixbuf_expander_closed obj)

    method set_pixbuf_expander_closed : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit =
      fun v ->
        Raw.Cell_renderer_pixbuf.set_pixbuf_expander_closed obj v#as_pixbuf

    method pixbuf_expander_open =
      new Ocgdkpixbuf.Pixbuf.pixbuf
        (Raw.Cell_renderer_pixbuf.get_pixbuf_expander_open obj)

    method set_pixbuf_expander_open : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit =
      fun v -> Raw.Cell_renderer_pixbuf.set_pixbuf_expander_open obj v#as_pixbuf

    method texture =
      new Ocgdk.Texture.texture (Raw.Cell_renderer_pixbuf.get_texture obj)

    method set_texture : Ocgdk.Texture.texture_t -> unit =
      fun v -> Raw.Cell_renderer_pixbuf.set_texture obj v#as_texture

    method as_cell_renderer_pixbuf = obj
  end

let new_ () : cell_renderer_pixbuf_t =
  new cell_renderer_pixbuf (Raw.Cell_renderer_pixbuf.new_ ())

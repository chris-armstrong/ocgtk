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

class cell_renderer_pixbuf :
  Raw.Cell_renderer_pixbuf.t ->
  cell_renderer_pixbuf_t

val new_ : unit -> cell_renderer_pixbuf_t

class type cell_renderer_pixbuf_t = object
  inherit Cell_renderer.cell_renderer_t

  (** {2:properties Properties} *)

  method gicon : Ocgio.Icon.icon_t
  (** The GIcon representing the icon to display. If the icon theme is changed,
      the image will be updated automatically. *)

  method set_gicon : Ocgio.Icon.icon_t -> unit
  (** The GIcon representing the icon to display. If the icon theme is changed,
      the image will be updated automatically. *)

  method icon_name : string
  [@@ocaml.doc
    "The name of the themed icon to display.\n\
     This property only has an effect if not overridden by the \"pixbuf\" \
     property."]

  method set_icon_name : string -> unit
  [@@ocaml.doc
    "The name of the themed icon to display.\n\
     This property only has an effect if not overridden by the \"pixbuf\" \
     property."]

  method icon_size : Enums.iconsize
  (** The [GtkIconSize] value that specifies the size of the rendered icon. *)

  method set_icon_size : Enums.iconsize -> unit
  (** The [GtkIconSize] value that specifies the size of the rendered icon. *)

  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  (** Set property: [pixbuf] ([GdkPixbuf.Pixbuf]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.pixbuf.html}upstream
       docs}. *)

  method pixbuf_expander_closed : Ocgdkpixbuf.Pixbuf.pixbuf_t
  (** Get property: [pixbuf-expander-closed] ([GdkPixbuf.Pixbuf]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.pixbuf-expander-closed.html}upstream
       docs}. *)

  method set_pixbuf_expander_closed : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  (** Set property: [pixbuf-expander-closed] ([GdkPixbuf.Pixbuf]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.pixbuf-expander-closed.html}upstream
       docs}. *)

  method pixbuf_expander_open : Ocgdkpixbuf.Pixbuf.pixbuf_t
  (** Get property: [pixbuf-expander-open] ([GdkPixbuf.Pixbuf]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.pixbuf-expander-open.html}upstream
       docs}. *)

  method set_pixbuf_expander_open : Ocgdkpixbuf.Pixbuf.pixbuf_t -> unit
  (** Set property: [pixbuf-expander-open] ([GdkPixbuf.Pixbuf]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.pixbuf-expander-open.html}upstream
       docs}. *)

  method texture : Ocgdk.Texture.texture_t
  (** Get property: [texture] ([Gdk.Texture]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.texture.html}upstream
       docs}. *)

  method set_texture : Ocgdk.Texture.texture_t -> unit
  (** Set property: [texture] ([Gdk.Texture]). See
      {{:https://docs.gtk.org/gtk4/property.CellRendererPixbuf.texture.html}upstream
       docs}. *)

  (** {2:conversions Conversions} *)

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

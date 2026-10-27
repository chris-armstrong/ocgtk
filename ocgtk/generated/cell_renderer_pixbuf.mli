(** Renders a pixbuf in a cell

    A [GtkCellRendererPixbuf] can be used to render an image in a cell. It
    allows to render either a given [GdkPixbuf] (set via the
    [GtkCellRendererPixbuf:pixbuf] property) or a named icon (set via the
    [GtkCellRendererPixbuf:icon-name] property).

    To support the tree view, [GtkCellRendererPixbuf] also supports rendering
    two alternative pixbufs, when the [GtkCellRenderer:is-expander] property is
    [TRUE]. If the [GtkCellRenderer:is-expanded property] is [TRUE] and the
    [GtkCellRendererPixbuf:pixbuf-expander-open] property is set to a pixbuf, it
    renders that pixbuf, if the [GtkCellRenderer:is-expanded] property is
    [FALSE] and the [GtkCellRendererPixbuf:pixbuf-expander-closed] property is
    set to a pixbuf, it renders that one.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_pixbuf_t}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_pixbuf}. *)

(** The methods, signals and properties of a [GtkCellRendererPixbuf]. *)
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
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer_pixbuf.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkCellRendererPixbuf], give one already wrapped. *)

val new_ : unit -> cell_renderer_pixbuf_t

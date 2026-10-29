(** Renders a pixbuf in a cell

    Its methods, signals and properties are on
    {!class-type-cell_renderer_pixbuf_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_pixbuf}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererPixbuf].}

    Inherits from:
    {{!Ocgtk.Cell_renderer.class-type-cell_renderer_t}Ocgtk.Cell_renderer}

    Renders a pixbuf in a cell

    A [GtkCellRendererPixbuf] can be used to render an image in a cell. It
    allows to render either a given [GdkPixbuf] (set via the
    [GtkCellRendererPixbuf:pixbuf] property) or a named icon (set via the
    [GtkCellRendererPixbuf:icon-name] property).

    To support the tree view, [GtkCellRendererPixbuf] also supports rendering
    two alternative pixbufs, when the [GtkCellRenderer:is-expander] property is
    [true]. If the [GtkCellRenderer:is-expanded property] is [true] and the
    [GtkCellRendererPixbuf:pixbuf-expander-open] property is set to a pixbuf, it
    renders that pixbuf, if the [GtkCellRenderer:is-expanded] property is
    [false] and the [GtkCellRendererPixbuf:pixbuf-expander-closed] property is
    set to a pixbuf, it renders that one. *)
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

class cell_renderer_pixbuf :
  Raw.Cell_renderer_pixbuf.t ->
  cell_renderer_pixbuf_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_pixbuf.t}. *)

(** {1:description Description}

    Renders a pixbuf in a cell

    A [GtkCellRendererPixbuf] can be used to render an image in a cell. It
    allows to render either a given [GdkPixbuf] (set via the
    [GtkCellRendererPixbuf:pixbuf] property) or a named icon (set via the
    [GtkCellRendererPixbuf:icon-name] property).

    To support the tree view, [GtkCellRendererPixbuf] also supports rendering
    two alternative pixbufs, when the [GtkCellRenderer:is-expander] property is
    [true]. If the [GtkCellRenderer:is-expanded property] is [true] and the
    [GtkCellRendererPixbuf:pixbuf-expander-open] property is set to a pixbuf, it
    renders that pixbuf, if the [GtkCellRenderer:is-expanded] property is
    [false] and the [GtkCellRendererPixbuf:pixbuf-expander-closed] property is
    set to a pixbuf, it renders that one. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_pixbuf_t
(** Creates a new [GtkCellRendererPixbuf]. Adjust rendering parameters using
    object properties. Object properties can be set globally (with
    [g_object_set ()]). Also, with [GtkTreeViewColumn], you can bind a property
    to a value in a [GtkTreeModel]. For example, you can bind the “pixbuf”
    property on the cell renderer to a pixbuf value in the model, thus rendering
    a different image in each row of the [GtkTreeView]. *)

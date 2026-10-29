(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererPixbuf: CellRendererPixbuf *)

(** Renders a pixbuf in a cell

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
    set to a pixbuf, it renders that one.

    The class built on this module is in {!Ocgtk.Cell_renderer_pixbuf}. *)

type t =
  [ `cell_renderer_pixbuf | `cell_renderer | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_pixbuf_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_pixbuf_new"
(** Creates a new [GtkCellRendererPixbuf]. Adjust rendering parameters using
    object properties. Object properties can be set globally (with
    g_object_set()). Also, with [GtkTreeViewColumn], you can bind a property to
    a value in a [GtkTreeModel]. For example, you can bind the “pixbuf” property
    on the cell renderer to a pixbuf value in the model, thus rendering a
    different image in each row of the [GtkTreeView]. *)

(* Methods *)
(* Properties *)

external get_gicon : t -> Ocgio_raw.Icon.t
  = "ml_gtk_cell_renderer_pixbuf_get_gicon"
(** The GIcon representing the icon to display. If the icon theme is changed,
    the image will be updated automatically. *)

external set_gicon : t -> Ocgio_raw.Icon.t -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_gicon"
(** The GIcon representing the icon to display. If the icon theme is changed,
    the image will be updated automatically. *)

external get_icon_name : t -> string
  = "ml_gtk_cell_renderer_pixbuf_get_icon_name"
[@@ocaml.doc
  "The name of the themed icon to display.\n\
   This property only has an effect if not overridden by the \"pixbuf\" \
   property."]

external set_icon_name : t -> string -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_icon_name"
[@@ocaml.doc
  "The name of the themed icon to display.\n\
   This property only has an effect if not overridden by the \"pixbuf\" \
   property."]

external get_icon_size : t -> Ocgtk_enums.iconsize
  = "ml_gtk_cell_renderer_pixbuf_get_icon_size"
(** The [GtkIconSize] value that specifies the size of the rendered icon. *)

external set_icon_size : t -> Ocgtk_enums.iconsize -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_icon_size"
(** The [GtkIconSize] value that specifies the size of the rendered icon. *)

external set_pixbuf : t -> Ocgdkpixbuf_raw.Pixbuf.t -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_pixbuf"
(** Set property: pixbuf *)

external get_pixbuf_expander_closed : t -> Ocgdkpixbuf_raw.Pixbuf.t
  = "ml_gtk_cell_renderer_pixbuf_get_pixbuf_expander_closed"
(** Get property: pixbuf-expander-closed *)

external set_pixbuf_expander_closed : t -> Ocgdkpixbuf_raw.Pixbuf.t -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_pixbuf_expander_closed"
(** Set property: pixbuf-expander-closed *)

external get_pixbuf_expander_open : t -> Ocgdkpixbuf_raw.Pixbuf.t
  = "ml_gtk_cell_renderer_pixbuf_get_pixbuf_expander_open"
(** Get property: pixbuf-expander-open *)

external set_pixbuf_expander_open : t -> Ocgdkpixbuf_raw.Pixbuf.t -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_pixbuf_expander_open"
(** Set property: pixbuf-expander-open *)

external get_texture : t -> Ocgdk_raw.Texture.t
  = "ml_gtk_cell_renderer_pixbuf_get_texture"
(** Get property: texture *)

external set_texture : t -> Ocgdk_raw.Texture.t -> unit
  = "ml_gtk_cell_renderer_pixbuf_set_texture"
(** Set property: texture *)

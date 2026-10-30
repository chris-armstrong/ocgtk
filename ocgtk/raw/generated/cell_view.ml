(* GENERATED CODE - DO NOT EDIT *)
(* CellView: CellView *)

(** A widget displaying a single row of a GtkTreeModel

    A [GtkCellView] displays a single row of a [GtkTreeModel] using a
    [GtkCellArea] and [GtkCellAreaContext]. A [GtkCellAreaContext] can be
    provided to the [GtkCellView] at construction time in order to keep the
    cellview in context of a group of cell views, this ensures that the
    renderers displayed will be properly aligned with each other (like the
    aligned cells in the menus of [GtkComboBox]).

    [GtkCellView] is [GtkOrientable] in order to decide in which orientation the
    underlying [GtkCellAreaContext] should be allocated. Taking the
    [GtkComboBox] menu as an example, cellviews should be oriented horizontally
    if the menus are listed top-to-bottom and thus all share the same width but
    may have separate individual heights (left-to-right menus should be
    allocated vertically since they all share the same height but may have
    variable widths).

    {b CSS nodes}

    GtkCellView has a single CSS node with name cellview.

    The class built on this module is in {!Ocgtk.Cell_view}. *)

type t = [ `cell_view | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_view_get_type"

external new_ : unit -> t = "ml_gtk_cell_view_new"
(** Creates a new [GtkCellView] widget. *)

external new_with_context :
  Cell_area_and__cell_area_context_and__cell_layout.Cell_area.t ->
  Cell_area_and__cell_area_context_and__cell_layout.Cell_area_context.t ->
  t = "ml_gtk_cell_view_new_with_context"
(** Creates a new [GtkCellView] widget with a specific [GtkCellArea] to layout
    cells and a specific [GtkCellAreaContext].

    Specifying the same context for a handful of cells lets the underlying area
    synchronize the geometry for those cells, in this way alignments with
    cellviews for other rows are possible. *)

external new_with_markup : string -> t = "ml_gtk_cell_view_new_with_markup"
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererText] to it, and
    makes it show [markup]. The text can be marked up with the
    {{:https://docs.gtk.org/Pango/pango_markup.html}Pango text markup language}.
*)

external new_with_text : string -> t = "ml_gtk_cell_view_new_with_text"
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererText] to it, and
    makes it show [text]. *)

external new_with_texture : Ocgdk_raw.Texture.t -> t
  = "ml_gtk_cell_view_new_with_texture"
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererPixbuf] to it,
    and makes it show [texture]. *)

(* Methods *)

external set_model : t -> Tree_model.t option -> unit
  = "ml_gtk_cell_view_set_model"
(** Sets the model for [cell_view]. If [cell_view] already has a model set, it
    will remove it before setting the new model. If [model] is [None], then it
    will unset the old model. *)

external set_fit_model : t -> bool -> unit = "ml_gtk_cell_view_set_fit_model"
(** Sets whether [cell_view] should request space to fit the entire
    [GtkTreeModel].

    This is used by [GtkComboBox] to ensure that the cell view displayed on the
    combo box’s button always gets enough space and does not resize when
    selection changes. *)

external set_draw_sensitive : t -> bool -> unit
  = "ml_gtk_cell_view_set_draw_sensitive"
(** Sets whether [cell_view] should draw all of its cells in a sensitive state,
    this is used by [GtkComboBox] menus to ensure that rows with insensitive
    cells that contain children appear sensitive in the parent menu item. *)

external set_displayed_row : t -> Tree_path.t option -> unit
  = "ml_gtk_cell_view_set_displayed_row"
(** Sets the row of the model that is currently displayed by the [GtkCellView].
    If the path is unset, then the contents of the cellview “stick” at their
    last value; this is not normally a desired result, but may be a needed
    intermediate state if say, the model for the [GtkCellView] becomes
    temporarily empty. *)

external get_model : t -> Tree_model.t option = "ml_gtk_cell_view_get_model"
(** Returns the model for [cell_view]. If no model is used [None] is returned.
*)

external get_fit_model : t -> bool = "ml_gtk_cell_view_get_fit_model"
(** Gets whether [cell_view] is configured to request space to fit the entire
    [GtkTreeModel]. *)

external get_draw_sensitive : t -> bool = "ml_gtk_cell_view_get_draw_sensitive"
(** Gets whether [cell_view] is configured to draw all of its cells in a
    sensitive state. *)

external get_displayed_row : t -> Tree_path.t option
  = "ml_gtk_cell_view_get_displayed_row"
(** Returns a [GtkTreePath] referring to the currently displayed row. If no row
    is currently displayed, [None] is returned. *)

(* Properties *)

external get_cell_area :
  t -> Cell_area_and__cell_area_context_and__cell_layout.Cell_area.t
  = "ml_gtk_cell_view_get_cell_area"
(** The [GtkCellArea] rendering cells

    If no area is specified when creating the cell view with
    {{!Ocgtk.Raw.Cell_view.val-new_with_context}[gtk_cell_view_new_with_context
                                                 ()]} a horizontally oriented
    [GtkCellArea]Box will be used.

    since 3.0 *)

external get_cell_area_context :
  t -> Cell_area_and__cell_area_context_and__cell_layout.Cell_area_context.t
  = "ml_gtk_cell_view_get_cell_area_context"
(** The [GtkCellAreaContext] used to compute the geometry of the cell view.

    A group of cell views can be assigned the same context in order to ensure
    the sizes and cell alignments match across all the views with the same
    context.

    [GtkComboBox] menus uses this to assign the same context to all cell views
    in the menu items for a single menu (each submenu creates its own context
    since the size of each submenu does not depend on parent or sibling menus).

    since 3.0 *)

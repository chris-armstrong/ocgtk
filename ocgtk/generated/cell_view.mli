(** A widget displaying a single row of a GtkTreeModel

    Its methods, signals and properties are on {!class-type-cell_view_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_view}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellView].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Cell_layout.class-type-cell_layout_t}Ocgtk.Cell_layout}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    A widget displaying a single row of a GtkTreeModel

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

    GtkCellView has a single CSS node with name cellview. *)
class type cell_view_t = object
  inherit Widget.widget_t
  inherit Cell_layout.cell_layout_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_displayed_row : unit -> Raw.Tree_path.t option
  (** Returns a [GtkTreePath] referring to the currently displayed row. If no
      row is currently displayed, [None] is returned. *)

  method get_draw_sensitive : unit -> bool
  (** Gets whether [cell_view] is configured to draw all of its cells in a
      sensitive state. *)

  method get_fit_model : unit -> bool
  (** Gets whether [cell_view] is configured to request space to fit the entire
      [GtkTreeModel]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model for [cell_view]. If no model is used [None] is returned.
  *)

  method set_displayed_row : Raw.Tree_path.t option -> unit
  (** Sets the row of the model that is currently displayed by the
      [GtkCellView]. If the path is unset, then the contents of the cellview
      “stick” at their last value; this is not normally a desired result, but
      may be a needed intermediate state if say, the model for the [GtkCellView]
      becomes temporarily empty. *)

  method set_draw_sensitive : bool -> unit
  (** Sets whether [cell_view] should draw all of its cells in a sensitive
      state, this is used by [GtkComboBox] menus to ensure that rows with
      insensitive cells that contain children appear sensitive in the parent
      menu item. *)

  method set_fit_model : bool -> unit
  (** Sets whether [cell_view] should request space to fit the entire
      [GtkTreeModel].

      This is used by [GtkComboBox] to ensure that the cell view displayed on
      the combo box’s button always gets enough space and does not resize when
      selection changes. *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model for [cell_view]. If [cell_view] already has a model set, it
      will remove it before setting the new model. If [model] is [None], then it
      will unset the old model. *)

  (** {2:properties Properties} *)

  method cell_area : Cell_area.cell_area_t
  (** The [GtkCellArea] rendering cells

      If no area is specified when creating the cell view with
      gtk_cell_view_new_with_context() a horizontally oriented [GtkCellArea]Box
      will be used.

      since 3.0 *)

  method cell_area_context : Cell_area_context.cell_area_context_t
  (** The [GtkCellAreaContext] used to compute the geometry of the cell view.

      A group of cell views can be assigned the same context in order to ensure
      the sizes and cell alignments match across all the views with the same
      context.

      [GtkComboBox] menus uses this to assign the same context to all cell views
      in the menu items for a single menu (each submenu creates its own context
      since the size of each submenu does not depend on parent or sibling
      menus).

      since 3.0 *)

  (** {2:conversions Conversions} *)

  method as_cell_view : Raw.Cell_view.t
end

class cell_view : Raw.Cell_view.t -> cell_view_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_view.t}. *)

(** {1:description Description}

    A widget displaying a single row of a GtkTreeModel

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

    GtkCellView has a single CSS node with name cellview. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_view_t
(** Creates a new [GtkCellView] widget. *)

val new_with_context :
  Cell_area.cell_area_t -> Cell_area_context.cell_area_context_t -> cell_view_t
(** Creates a new [GtkCellView] widget with a specific [GtkCellArea] to layout
    cells and a specific [GtkCellAreaContext].

    Specifying the same context for a handful of cells lets the underlying area
    synchronize the geometry for those cells, in this way alignments with
    cellviews for other rows are possible. *)

val new_with_markup : string -> cell_view_t
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererText] to it, and
    makes it show [markup]. The text can be marked up with the
    {{:https://docs.gtk.org/Pango/pango_markup.html}Pango text markup language}.
*)

val new_with_text : string -> cell_view_t
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererText] to it, and
    makes it show [text]. *)

val new_with_texture : Ocgdk.Texture.texture_t -> cell_view_t
(** Creates a new [GtkCellView] widget, adds a [GtkCellRendererPixbuf] to it,
    and makes it show [texture]. *)

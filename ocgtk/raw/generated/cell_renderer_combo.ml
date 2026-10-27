(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererCombo: CellRendererCombo *)

(** Renders a combobox in a cell

    [GtkCellRendererCombo] renders text in a cell like [GtkCellRendererText]
    from which it is derived. But while [GtkCellRendererText] offers a simple
    entry to edit the text, [GtkCellRendererCombo] offers a [GtkComboBox] widget
    to edit the text. The values to display in the combo box are taken from the
    tree model specified in the [GtkCellRendererCombo]:model property.

    The combo cell renderer takes care of adding a text cell renderer to the
    combo box and sets it to display the column specified by its
    [GtkCellRendererCombo]:text-column property. Further properties of the combo
    box can be set in a handler for the [GtkCellRenderer::editing-started]
    signal.

    The class built on this module is in {!Ocgtk.Cell_renderer_combo}. *)

type t =
  [ `cell_renderer_combo
  | `cell_renderer_text
  | `cell_renderer
  | `initially_unowned
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_cell_renderer_combo_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_combo_new"
(** Creates a new [GtkCellRendererCombo]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with g_object_set()).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

(* Methods *)
(* Properties *)

external get_has_entry : t -> bool = "ml_gtk_cell_renderer_combo_get_has_entry"
(** If [TRUE], the cell renderer will include an entry and allow to enter values
    other than the ones in the popup list. *)

external set_has_entry : t -> bool -> unit
  = "ml_gtk_cell_renderer_combo_set_has_entry"
(** If [TRUE], the cell renderer will include an entry and allow to enter values
    other than the ones in the popup list. *)

external get_model : t -> Tree_model.t = "ml_gtk_cell_renderer_combo_get_model"
(** Holds a tree model containing the possible values for the combo box. Use the
    text_column property to specify the column holding the values. *)

external set_model : t -> Tree_model.t -> unit
  = "ml_gtk_cell_renderer_combo_set_model"
(** Holds a tree model containing the possible values for the combo box. Use the
    text_column property to specify the column holding the values. *)

external get_text_column : t -> int
  = "ml_gtk_cell_renderer_combo_get_text_column"
(** Specifies the model column which holds the possible values for the combo
    box.

    Note that this refers to the model specified in the model property, not the
    model backing the tree view to which this cell renderer is attached.

    [GtkCellRendererCombo] automatically adds a text cell renderer for this
    column to its combo box. *)

external set_text_column : t -> int -> unit
  = "ml_gtk_cell_renderer_combo_set_text_column"
(** Specifies the model column which holds the possible values for the combo
    box.

    Note that this refers to the model specified in the model property, not the
    model backing the tree view to which this cell renderer is attached.

    [GtkCellRendererCombo] automatically adds a text cell renderer for this
    column to its combo box. *)

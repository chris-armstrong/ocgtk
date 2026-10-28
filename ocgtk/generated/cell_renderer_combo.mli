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

    Its methods, signals and properties are on
    {!class-type-cell_renderer_combo_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_combo}. *)

(** The methods, signals and properties of a [CellRendererCombo]. *)
class type cell_renderer_combo_t = object
  inherit Cell_renderer_text.cell_renderer_text_t
  method has_entry : bool
  method set_has_entry : bool -> unit
  method model : Tree_model.tree_model_t
  method set_model : Tree_model.tree_model_t -> unit
  method text_column : int
  method set_text_column : int -> unit
  method as_cell_renderer_combo : Raw.Cell_renderer_combo.t
end

class cell_renderer_combo : Raw.Cell_renderer_combo.t -> cell_renderer_combo_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_combo.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_combo_t
(** Creates a new [GtkCellRendererCombo]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with g_object_set()).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

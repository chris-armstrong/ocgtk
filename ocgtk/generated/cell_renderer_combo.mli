(** Renders a combobox in a cell

    Its methods, signals and properties are on
    {!class-type-cell_renderer_combo_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_combo}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererCombo].}

    Renders a combobox in a cell

    [GtkCellRendererCombo] renders text in a cell like [GtkCellRendererText]
    from which it is derived. But while [GtkCellRendererText] offers a simple
    entry to edit the text, [GtkCellRendererCombo] offers a [GtkComboBox] widget
    to edit the text. The values to display in the combo box are taken from the
    tree model specified in the [GtkCellRendererCombo]:model property.

    The combo cell renderer takes care of adding a text cell renderer to the
    combo box and sets it to display the column specified by its
    [GtkCellRendererCombo]:text-column property. Further properties of the combo
    box can be set in a handler for the [GtkCellRenderer::editing-started]
    signal. *)
class type cell_renderer_combo_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  method has_entry : bool
  (** If [TRUE], the cell renderer will include an entry and allow to enter
      values other than the ones in the popup list. *)

  method set_has_entry : bool -> unit
  (** If [TRUE], the cell renderer will include an entry and allow to enter
      values other than the ones in the popup list. *)

  method model : Tree_model.tree_model_t
  (** Holds a tree model containing the possible values for the combo box. Use
      the text_column property to specify the column holding the values. *)

  method set_model : Tree_model.tree_model_t -> unit
  (** Holds a tree model containing the possible values for the combo box. Use
      the text_column property to specify the column holding the values. *)

  method text_column : int
  (** Specifies the model column which holds the possible values for the combo
      box.

      Note that this refers to the model specified in the model property, not
      the model backing the tree view to which this cell renderer is attached.

      [GtkCellRendererCombo] automatically adds a text cell renderer for this
      column to its combo box. *)

  method set_text_column : int -> unit
  (** Specifies the model column which holds the possible values for the combo
      box.

      Note that this refers to the model specified in the model property, not
      the model backing the tree view to which this cell renderer is attached.

      [GtkCellRendererCombo] automatically adds a text cell renderer for this
      column to its combo box. *)

  method as_cell_renderer_combo : Raw.Cell_renderer_combo.t
end

class cell_renderer_combo : Raw.Cell_renderer_combo.t -> cell_renderer_combo_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_combo.t}. *)

(** {1:description Description}

    Renders a combobox in a cell

    [GtkCellRendererCombo] renders text in a cell like [GtkCellRendererText]
    from which it is derived. But while [GtkCellRendererText] offers a simple
    entry to edit the text, [GtkCellRendererCombo] offers a [GtkComboBox] widget
    to edit the text. The values to display in the combo box are taken from the
    tree model specified in the [GtkCellRendererCombo]:model property.

    The combo cell renderer takes care of adding a text cell renderer to the
    combo box and sets it to display the column specified by its
    [GtkCellRendererCombo]:text-column property. Further properties of the combo
    box can be set in a handler for the [GtkCellRenderer::editing-started]
    signal. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_combo_t
(** Creates a new [GtkCellRendererCombo]. Adjust how text is drawn using object
    properties. Object properties can be set globally (with g_object_set()).
    Also, with [GtkTreeViewColumn], you can bind a property to a value in a
    [GtkTreeModel]. For example, you can bind the “text” property on the cell
    renderer to a string value in the model, thus rendering a different string
    in each row of the [GtkTreeView]. *)

(** Renders a spin button in a cell

    [GtkCellRendererSpin] renders text in a cell like [GtkCellRendererText] from
    which it is derived. But while [GtkCellRendererText] offers a simple entry
    to edit the text, [GtkCellRendererSpin] offers a [GtkSpinButton] widget. Of
    course, that means that the text has to be parseable as a floating point
    number.

    The range of the spinbutton is taken from the adjustment property of the
    cell renderer, which can be set explicitly or mapped to a column in the tree
    model, like all properties of cell renders. [GtkCellRendererSpin] also has
    properties for the [GtkCellRendererSpin:climb-rate] and the number of
    [GtkCellRendererSpin:digits] to display. Other [GtkSpinButton] properties
    can be set in a handler for the [GtkCellRenderer::editing-started] signal.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_spin_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_spin}. *)

(** The methods, signals and properties of a [CellRendererSpin]. *)
class type cell_renderer_spin_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  method adjustment : Adjustment.adjustment_t
  (** The adjustment that holds the value of the spinbutton. This must be
      non-[NULL] for the cell renderer to be editable. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** The adjustment that holds the value of the spinbutton. This must be
      non-[NULL] for the cell renderer to be editable. *)

  method climb_rate : float
  (** The acceleration rate when you hold down a button. *)

  method set_climb_rate : float -> unit
  (** The acceleration rate when you hold down a button. *)

  method digits : int
  (** The number of decimal places to display. *)

  method set_digits : int -> unit
  (** The number of decimal places to display. *)

  method as_cell_renderer_spin : Raw.Cell_renderer_spin.t
end

class cell_renderer_spin : Raw.Cell_renderer_spin.t -> cell_renderer_spin_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_spin.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_spin_t
(** Creates a new [GtkCellRendererSpin]. *)

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

(** The methods, signals and properties of a [GtkCellRendererSpin]. *)
class type cell_renderer_spin_t = object
  inherit Cell_renderer_text.cell_renderer_text_t
  method adjustment : Adjustment.adjustment_t
  method set_adjustment : Adjustment.adjustment_t -> unit
  method climb_rate : float
  method set_climb_rate : float -> unit
  method digits : int
  method set_digits : int -> unit
  method as_cell_renderer_spin : Raw.Cell_renderer_spin.t
end

class cell_renderer_spin : Raw.Cell_renderer_spin.t -> cell_renderer_spin_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer_spin.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkCellRendererSpin], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_spin_t
(** Creates a new [GtkCellRendererSpin]. *)

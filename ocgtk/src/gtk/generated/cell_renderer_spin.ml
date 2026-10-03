(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererSpin: CellRendererSpin *)

type t =
  [ `cell_renderer_spin
  | `cell_renderer_text
  | `cell_renderer
  | `initially_unowned
  | `object_ ]
  Gobject.obj
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
*)

external new_ : unit -> t = "ml_gtk_cell_renderer_spin_new"
(** Create a new CellRendererSpin *)

(* Methods *)
(* Properties *)

external get_adjustment : t -> Adjustment.t
  = "ml_gtk_cell_renderer_spin_get_adjustment"
(** Get property: adjustment *)

external set_adjustment : t -> Adjustment.t -> unit
  = "ml_gtk_cell_renderer_spin_set_adjustment"
(** Set property: adjustment *)

external get_climb_rate : t -> float
  = "ml_gtk_cell_renderer_spin_get_climb_rate"
(** Get property: climb-rate *)

external set_climb_rate : t -> float -> unit
  = "ml_gtk_cell_renderer_spin_set_climb_rate"
(** Set property: climb-rate *)

external get_digits : t -> int = "ml_gtk_cell_renderer_spin_get_digits"
(** Get property: digits *)

external set_digits : t -> int -> unit = "ml_gtk_cell_renderer_spin_set_digits"
(** Set property: digits *)

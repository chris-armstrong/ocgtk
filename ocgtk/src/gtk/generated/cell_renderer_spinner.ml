(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererSpinner: CellRendererSpinner *)

type t =
  [ `cell_renderer_spinner | `cell_renderer | `initially_unowned | `object_ ]
  Gobject.obj
(** Renders a spinning animation in a cell

    [GtkCellRendererSpinner] renders a spinning animation in a cell, very
    similar to [GtkSpinner]. It can often be used as an alternative to a
    [GtkCellRendererProgress] for displaying indefinite activity, instead of
    actual progress.

    To start the animation in a cell, set the [GtkCellRendererSpinner:active]
    property to [TRUE] and increment the [GtkCellRendererSpinner:pulse] property
    at regular intervals. The usual way to set the cell renderer properties for
    each cell is to bind them to columns in your tree model using e.g.
    gtk_tree_view_column_add_attribute(). *)

external new_ : unit -> t = "ml_gtk_cell_renderer_spinner_new"
(** Create a new CellRendererSpinner *)

(* Methods *)
(* Properties *)

external get_active : t -> bool = "ml_gtk_cell_renderer_spinner_get_active"
(** Get property: active *)

external set_active : t -> bool -> unit
  = "ml_gtk_cell_renderer_spinner_set_active"
(** Set property: active *)

external get_pulse : t -> int = "ml_gtk_cell_renderer_spinner_get_pulse"
(** Get property: pulse *)

external set_pulse : t -> int -> unit = "ml_gtk_cell_renderer_spinner_set_pulse"
(** Set property: pulse *)

external get_size : t -> Gtk_enums.iconsize
  = "ml_gtk_cell_renderer_spinner_get_size"
(** Get property: size *)

external set_size : t -> Gtk_enums.iconsize -> unit
  = "ml_gtk_cell_renderer_spinner_set_size"
(** Set property: size *)

(** Renders a spinning animation in a cell

    [GtkCellRendererSpinner] renders a spinning animation in a cell, very
    similar to [GtkSpinner]. It can often be used as an alternative to a
    [GtkCellRendererProgress] for displaying indefinite activity, instead of
    actual progress.

    To start the animation in a cell, set the [GtkCellRendererSpinner:active]
    property to [TRUE] and increment the [GtkCellRendererSpinner:pulse] property
    at regular intervals. The usual way to set the cell renderer properties for
    each cell is to bind them to columns in your tree model using e.g.
    gtk_tree_view_column_add_attribute().

    Its methods, signals and properties are on
    {!class-type-cell_renderer_spinner_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_spinner}. *)

(** The methods, signals and properties of a [GtkCellRendererSpinner]. *)
class type cell_renderer_spinner_t = object
  inherit Cell_renderer.cell_renderer_t
  method active : bool
  method set_active : bool -> unit
  method pulse : int
  method set_pulse : int -> unit
  method size : Enums.iconsize
  method set_size : Enums.iconsize -> unit
  method as_cell_renderer_spinner : Raw.Cell_renderer_spinner.t
end

class cell_renderer_spinner :
  Raw.Cell_renderer_spinner.t ->
  cell_renderer_spinner_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer_spinner.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkCellRendererSpinner], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_spinner_t
(** Returns a new cell renderer which will show a spinner to indicate activity.
*)

(** Renders a spinning animation in a cell

    Its methods, signals and properties are on
    {!class-type-cell_renderer_spinner_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_spinner}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererSpinner].}

    Inherits from:
    {{!Ocgtk.Cell_renderer.class-type-cell_renderer_t}Ocgtk.Cell_renderer}

    Renders a spinning animation in a cell

    [GtkCellRendererSpinner] renders a spinning animation in a cell, very
    similar to [GtkSpinner]. It can often be used as an alternative to a
    [GtkCellRendererProgress] for displaying indefinite activity, instead of
    actual progress.

    To start the animation in a cell, set the [GtkCellRendererSpinner:active]
    property to [true] and increment the [GtkCellRendererSpinner:pulse] property
    at regular intervals. The usual way to set the cell renderer properties for
    each cell is to bind them to columns in your tree model using e.g.
    [gtk_tree_view_column_add_attribute ()]. *)
class type cell_renderer_spinner_t = object
  inherit Cell_renderer.cell_renderer_t

  (** {2:properties Properties} *)

  method active : bool
  (** Whether the spinner is active (ie. shown) in the cell *)

  method set_active : bool -> unit
  (** Whether the spinner is active (ie. shown) in the cell *)

  method pulse : int
  (** Pulse of the spinner. Increment this value to draw the next frame of the
      spinner animation. Usually, you would update this value in a timeout.

      By default, the [GtkSpinner] widget draws one full cycle of the animation,
      consisting of 12 frames, in 750 milliseconds. *)

  method set_pulse : int -> unit
  (** Pulse of the spinner. Increment this value to draw the next frame of the
      spinner animation. Usually, you would update this value in a timeout.

      By default, the [GtkSpinner] widget draws one full cycle of the animation,
      consisting of 12 frames, in 750 milliseconds. *)

  method size : Enums.iconsize
  (** The [GtkIconSize] value that specifies the size of the rendered spinner.
  *)

  method set_size : Enums.iconsize -> unit
  (** The [GtkIconSize] value that specifies the size of the rendered spinner.
  *)

  (** {2:conversions Conversions} *)

  method as_cell_renderer_spinner : Raw.Cell_renderer_spinner.t
end

class cell_renderer_spinner :
  Raw.Cell_renderer_spinner.t ->
  cell_renderer_spinner_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_spinner.t}. *)

(** {1:description Description}

    Renders a spinning animation in a cell

    [GtkCellRendererSpinner] renders a spinning animation in a cell, very
    similar to [GtkSpinner]. It can often be used as an alternative to a
    [GtkCellRendererProgress] for displaying indefinite activity, instead of
    actual progress.

    To start the animation in a cell, set the [GtkCellRendererSpinner:active]
    property to [true] and increment the [GtkCellRendererSpinner:pulse] property
    at regular intervals. The usual way to set the cell renderer properties for
    each cell is to bind them to columns in your tree model using e.g.
    [gtk_tree_view_column_add_attribute ()]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_spinner_t
(** Returns a new cell renderer which will show a spinner to indicate activity.
*)

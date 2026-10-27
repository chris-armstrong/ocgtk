(** Renders numbers as progress bars

    [GtkCellRendererProgress] renders a numeric value as a progress par in a
    cell. Additionally, it can display a text on top of the progress bar.

    Its methods, signals and properties are on
    {!class-type-cell_renderer_progress_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Cell_renderer_progress}. *)

(** The methods, signals and properties of a [GtkCellRendererProgress]. *)
class type cell_renderer_progress_t = object
  inherit Cell_renderer.cell_renderer_t
  inherit Orientable.orientable_t
  method inverted : bool
  method set_inverted : bool -> unit
  method pulse : int
  method set_pulse : int -> unit
  method text : string
  method set_text : string -> unit
  method text_xalign : float
  method set_text_xalign : float -> unit
  method text_yalign : float
  method set_text_yalign : float -> unit
  method value : int
  method set_value : int -> unit
  method as_cell_renderer_progress : Raw.Cell_renderer_progress.t
end

class cell_renderer_progress :
  Raw.Cell_renderer_progress.t ->
  cell_renderer_progress_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_renderer_progress.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkCellRendererProgress], give one already wrapped.
*)

(** {2:constructors Constructors} *)

val new_ : unit -> cell_renderer_progress_t
(** Creates a new [GtkCellRendererProgress]. *)

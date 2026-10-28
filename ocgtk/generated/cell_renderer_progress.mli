(** Renders numbers as progress bars

    Its methods, signals and properties are on
    {!class-type-cell_renderer_progress_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Cell_renderer_progress}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CellRendererProgress].}

    Renders numbers as progress bars

    [GtkCellRendererProgress] renders a numeric value as a progress par in a
    cell. Additionally, it can display a text on top of the progress bar. *)
class type cell_renderer_progress_t = object
  inherit Cell_renderer.cell_renderer_t
  inherit Orientable.orientable_t

  method inverted : bool
  (** Whether progess is inverted. *)

  method set_inverted : bool -> unit
  (** Whether progess is inverted. *)

  method pulse : int
  [@@ocaml.doc
    "Setting this to a non-negative value causes the cell renderer to\n\
     enter \"activity mode\", where a block bounces back and forth to\n\
     indicate that some progress is made, without specifying exactly how\n\
     much.\n\n\
     Each increment of the property causes the block to move by a little\n\
     bit.\n\n\
     To indicate that the activity has not started yet, set the property\n\
     to zero. To indicate completion, set the property to [G_MAXINT]."]

  method set_pulse : int -> unit
  [@@ocaml.doc
    "Setting this to a non-negative value causes the cell renderer to\n\
     enter \"activity mode\", where a block bounces back and forth to\n\
     indicate that some progress is made, without specifying exactly how\n\
     much.\n\n\
     Each increment of the property causes the block to move by a little\n\
     bit.\n\n\
     To indicate that the activity has not started yet, set the property\n\
     to zero. To indicate completion, set the property to [G_MAXINT]."]

  method text : string
  [@@ocaml.doc
    "The \"text\" property determines the label which will be drawn\n\
     over the progress bar. Setting this property to [NULL] causes the default\n\
     label to be displayed. Setting this property to an empty string causes\n\
     no label to be displayed."]

  method set_text : string -> unit
  [@@ocaml.doc
    "The \"text\" property determines the label which will be drawn\n\
     over the progress bar. Setting this property to [NULL] causes the default\n\
     label to be displayed. Setting this property to an empty string causes\n\
     no label to be displayed."]

  method text_xalign : float
  [@@ocaml.doc
    "The \"text-xalign\" property controls the horizontal alignment of the\n\
     text in the progress bar.  Valid values range from 0 (left) to 1\n\
     (right).  Reserved for RTL layouts."]

  method set_text_xalign : float -> unit
  [@@ocaml.doc
    "The \"text-xalign\" property controls the horizontal alignment of the\n\
     text in the progress bar.  Valid values range from 0 (left) to 1\n\
     (right).  Reserved for RTL layouts."]

  method text_yalign : float
  [@@ocaml.doc
    "The \"text-yalign\" property controls the vertical alignment of the\n\
     text in the progress bar.  Valid values range from 0 (top) to 1\n\
     (bottom)."]

  method set_text_yalign : float -> unit
  [@@ocaml.doc
    "The \"text-yalign\" property controls the vertical alignment of the\n\
     text in the progress bar.  Valid values range from 0 (top) to 1\n\
     (bottom)."]

  method value : int
  [@@ocaml.doc
    "The \"value\" property determines the percentage to which the\n\
     progress bar will be \"filled in\"."]

  method set_value : int -> unit
  [@@ocaml.doc
    "The \"value\" property determines the percentage to which the\n\
     progress bar will be \"filled in\"."]

  method as_cell_renderer_progress : Raw.Cell_renderer_progress.t
end

class cell_renderer_progress :
  Raw.Cell_renderer_progress.t ->
  cell_renderer_progress_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_renderer_progress.t}. *)

(** {1:description Description}

    Renders numbers as progress bars

    [GtkCellRendererProgress] renders a numeric value as a progress par in a
    cell. Additionally, it can display a text on top of the progress bar. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cell_renderer_progress_t
(** Creates a new [GtkCellRendererProgress]. *)

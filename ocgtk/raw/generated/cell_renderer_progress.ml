(* GENERATED CODE - DO NOT EDIT *)
(* CellRendererProgress: CellRendererProgress *)

(** Renders numbers as progress bars

    [GtkCellRendererProgress] renders a numeric value as a progress par in a
    cell. Additionally, it can display a text on top of the progress bar.

    The class built on this module is in {!Ocgtk.Cell_renderer_progress}. *)

type t =
  [ `cell_renderer_progress | `cell_renderer | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_cell_renderer_progress_get_type"

external new_ : unit -> t = "ml_gtk_cell_renderer_progress_new"
(** Creates a new [GtkCellRendererProgress]. *)

(* Methods *)
(* Properties *)

external get_inverted : t -> bool = "ml_gtk_cell_renderer_progress_get_inverted"
(** Whether progess is inverted. *)

external set_inverted : t -> bool -> unit
  = "ml_gtk_cell_renderer_progress_set_inverted"
(** Whether progess is inverted. *)

external get_pulse : t -> int = "ml_gtk_cell_renderer_progress_get_pulse"
[@@ocaml.doc
  "Setting this to a non-negative value causes the cell renderer to\n\
   enter \"activity mode\", where a block bounces back and forth to\n\
   indicate that some progress is made, without specifying exactly how\n\
   much.\n\n\
   Each increment of the property causes the block to move by a little\n\
   bit.\n\n\
   To indicate that the activity has not started yet, set the property\n\
   to zero. To indicate completion, set the property to [G_MAXINT]."]

external set_pulse : t -> int -> unit
  = "ml_gtk_cell_renderer_progress_set_pulse"
[@@ocaml.doc
  "Setting this to a non-negative value causes the cell renderer to\n\
   enter \"activity mode\", where a block bounces back and forth to\n\
   indicate that some progress is made, without specifying exactly how\n\
   much.\n\n\
   Each increment of the property causes the block to move by a little\n\
   bit.\n\n\
   To indicate that the activity has not started yet, set the property\n\
   to zero. To indicate completion, set the property to [G_MAXINT]."]

external get_text : t -> string = "ml_gtk_cell_renderer_progress_get_text"
[@@ocaml.doc
  "The \"text\" property determines the label which will be drawn\n\
   over the progress bar. Setting this property to [NULL] causes the default\n\
   label to be displayed. Setting this property to an empty string causes\n\
   no label to be displayed."]

external set_text : t -> string -> unit
  = "ml_gtk_cell_renderer_progress_set_text"
[@@ocaml.doc
  "The \"text\" property determines the label which will be drawn\n\
   over the progress bar. Setting this property to [NULL] causes the default\n\
   label to be displayed. Setting this property to an empty string causes\n\
   no label to be displayed."]

external get_text_xalign : t -> float
  = "ml_gtk_cell_renderer_progress_get_text_xalign"
[@@ocaml.doc
  "The \"text-xalign\" property controls the horizontal alignment of the\n\
   text in the progress bar.  Valid values range from 0 (left) to 1\n\
   (right).  Reserved for RTL layouts."]

external set_text_xalign : t -> float -> unit
  = "ml_gtk_cell_renderer_progress_set_text_xalign"
[@@ocaml.doc
  "The \"text-xalign\" property controls the horizontal alignment of the\n\
   text in the progress bar.  Valid values range from 0 (left) to 1\n\
   (right).  Reserved for RTL layouts."]

external get_text_yalign : t -> float
  = "ml_gtk_cell_renderer_progress_get_text_yalign"
[@@ocaml.doc
  "The \"text-yalign\" property controls the vertical alignment of the\n\
   text in the progress bar.  Valid values range from 0 (top) to 1\n\
   (bottom)."]

external set_text_yalign : t -> float -> unit
  = "ml_gtk_cell_renderer_progress_set_text_yalign"
[@@ocaml.doc
  "The \"text-yalign\" property controls the vertical alignment of the\n\
   text in the progress bar.  Valid values range from 0 (top) to 1\n\
   (bottom)."]

external get_value : t -> int = "ml_gtk_cell_renderer_progress_get_value"
[@@ocaml.doc
  "The \"value\" property determines the percentage to which the\n\
   progress bar will be \"filled in\"."]

external set_value : t -> int -> unit
  = "ml_gtk_cell_renderer_progress_set_value"
[@@ocaml.doc
  "The \"value\" property determines the percentage to which the\n\
   progress bar will be \"filled in\"."]

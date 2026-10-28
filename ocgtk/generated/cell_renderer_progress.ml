class type cell_renderer_progress_t = object
  inherit Cell_renderer.cell_renderer_t
  inherit Orientable.orientable_t

  (** {2:properties Properties} *)

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

  (** {2:conversions Conversions} *)

  method as_cell_renderer_progress : Raw.Cell_renderer_progress.t
end

(* High-level class for CellRendererProgress *)
class cell_renderer_progress (obj : Raw.Cell_renderer_progress.t) :
  cell_renderer_progress_t =
  object (self)
    inherit Cell_renderer.cell_renderer (obj :> Raw.Cell_renderer.t)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)
    method inverted = Raw.Cell_renderer_progress.get_inverted obj
    method set_inverted v = Raw.Cell_renderer_progress.set_inverted obj v
    method pulse = Raw.Cell_renderer_progress.get_pulse obj
    method set_pulse v = Raw.Cell_renderer_progress.set_pulse obj v
    method text = Raw.Cell_renderer_progress.get_text obj
    method set_text v = Raw.Cell_renderer_progress.set_text obj v
    method text_xalign = Raw.Cell_renderer_progress.get_text_xalign obj
    method set_text_xalign v = Raw.Cell_renderer_progress.set_text_xalign obj v
    method text_yalign = Raw.Cell_renderer_progress.get_text_yalign obj
    method set_text_yalign v = Raw.Cell_renderer_progress.set_text_yalign obj v
    method value = Raw.Cell_renderer_progress.get_value obj
    method set_value v = Raw.Cell_renderer_progress.set_value obj v
    method as_cell_renderer_progress = obj
  end

let new_ () : cell_renderer_progress_t =
  new cell_renderer_progress (Raw.Cell_renderer_progress.new_ ())

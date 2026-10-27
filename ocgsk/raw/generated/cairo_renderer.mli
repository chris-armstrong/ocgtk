(* GENERATED CODE - DO NOT EDIT *)
(* CairoRenderer: CairoRenderer *)

(** Renders a GSK rendernode tree with cairo.

    Since it is using cairo, this renderer cannot support 3D transformations.

    The class built on this module is in {!Ocgsk.Cairo_renderer}. *)

type t = [ `cairo_renderer | `renderer | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_cairo_renderer_get_type"

external new_ : unit -> t = "ml_gsk_cairo_renderer_new"
(** Creates a new Cairo renderer.

    The Cairo renderer is the fallback renderer drawing in ways similar to how
    GTK 3 drew its content. Its primary use is as comparison tool.

    The Cairo renderer is incomplete. It cannot render 3D transformed content
    and will instead render an error marker. Its usage should be avoided. *)

(* Methods *)

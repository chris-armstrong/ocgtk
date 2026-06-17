(* GENERATED CODE - DO NOT EDIT *)
(* Requisition: Requisition *)

(** A `GtkRequisition` represents the desired size of a widget. See
[GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
more information. *)
type t = [`requisition] Gobject.obj

(** Create a new Requisition *)
external new_ : unit -> t = "ml_gtk_requisition_new"

(* Methods *)

external get_type : unit -> Gobject.Type.t = "ml_gtk_requisition_get_type"

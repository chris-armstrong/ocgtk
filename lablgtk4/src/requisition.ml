(* GENERATED CODE - DO NOT EDIT *)
(* Record: Requisition *)

(** A `GtkRequisition` represents the desired size of a widget. See
[GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
more information. *)
type t = Obj.t

(** Create a new Requisition *)
external new_ : unit -> t = "ml_gtk_requisition_new"

(** Frees a `GtkRequisition`. *)
external free : t -> unit = "ml_gtk_requisition_free"

(** Copies a `GtkRequisition`. *)
external copy : t -> Obj.t = "ml_gtk_requisition_copy"


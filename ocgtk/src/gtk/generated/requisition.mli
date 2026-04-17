(* GENERATED CODE - DO NOT EDIT *)
(* Requisition: Requisition *)

type t = [ `requisition ] Gobject.obj
(** A `GtkRequisition` represents the desired size of a widget. See
    [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management)
    for more information. *)

external new_ : unit -> t = "ml_gtk_requisition_new"
(** Create a new Requisition *)

(* Methods *)

external free : t -> unit = "ml_gtk_requisition_free"
(** Frees a `GtkRequisition`. *)

external copy : t -> t = "ml_gtk_requisition_copy"
(** Copies a `GtkRequisition`. *)

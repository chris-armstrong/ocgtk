(* GENERATED CODE - DO NOT EDIT *)
(* Requisition: Requisition *)

type t = [ `requisition ] Gobject.obj
(** A `GtkRequisition` represents the desired size of a widget. See
    [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management)
    for more information. *)

external new_ : unit -> t = "ml_gtk_requisition_new"
(** Create a new Requisition *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_width : t -> int = "ml_gtk_requisition_get_width"
external get_height : t -> int = "ml_gtk_requisition_get_height"

(* Setters *)
external set_width : t -> int -> unit = "ml_gtk_requisition_set_width"
external set_height : t -> int -> unit = "ml_gtk_requisition_set_height"
external make : int -> int -> t = "ml_gtk_requisition_make"

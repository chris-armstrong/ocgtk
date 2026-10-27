(** Represents the desired size of a widget.

    See GtkWidget’s geometry management section for more information.

    Its methods, signals and properties are on {!class-type-requisition_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Requisition}. *)

(** The methods, signals and properties of a [GtkRequisition]. *)
class type requisition_t = object
  method as_requisition : Raw.Requisition.t
end

class requisition : Raw.Requisition.t -> requisition_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Requisition.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRequisition], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> requisition_t
(** Allocates a new [GtkRequisition].

    The struct is initialized to zero. *)

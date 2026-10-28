(** Represents the desired size of a widget.

    See GtkWidget’s geometry management section for more information.

    Its methods, signals and properties are on {!class-type-requisition_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Requisition}. *)

(** {b The methods, signals and properties of a [Requisition].}

    Represents the desired size of a widget.

    See GtkWidget’s geometry management section for more information. *)
class type requisition_t = object
  method as_requisition : Raw.Requisition.t
end

class requisition : Raw.Requisition.t -> requisition_t
(** Wraps a raw handle of {!Ocgtk.Raw.Requisition.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> requisition_t
(** Allocates a new [GtkRequisition].

    The struct is initialized to zero. *)

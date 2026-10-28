(** Represents the desired size of a widget.

    Its methods, signals and properties are on {!class-type-requisition_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Requisition}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Requisition].}

    Represents the desired size of a widget.

    See GtkWidget’s geometry management section for more information. *)
class type requisition_t = object
  method as_requisition : Raw.Requisition.t
end

class requisition : Raw.Requisition.t -> requisition_t
(** Wraps a raw handle of {!Ocgtk.Raw.Requisition.t}. *)

(** {1:description Description}

    Represents the desired size of a widget.

    See GtkWidget’s geometry management section for more information. *)

(** {1:constructors Constructors} *)

val new_ : unit -> requisition_t
(** Allocates a new [GtkRequisition].

    The struct is initialized to zero. *)

(** Base type for snapshot operations.

    Its methods, signals and properties are on {!class-type-snapshot_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Snapshot}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Snapshot].}

    Base type for snapshot operations.

    The subclass of [GdkSnapshot] used by GTK is GtkSnapshot. *)
class type snapshot_t = object
  (** {2:conversions Conversions} *)

  method as_snapshot : Raw.Snapshot.t
end

class snapshot : Raw.Snapshot.t -> snapshot_t
(** Wraps a raw handle of {!Ocgdk.Raw.Snapshot.t}. *)

(** {1:description Description}

    Base type for snapshot operations.

    The subclass of [GdkSnapshot] used by GTK is GtkSnapshot. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)

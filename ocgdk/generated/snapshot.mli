(** Base type for snapshot operations.

    Its methods, signals and properties are on {!class-type-snapshot_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgdk.Raw.Snapshot}. *)

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

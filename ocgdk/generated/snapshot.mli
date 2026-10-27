(** Base type for snapshot operations.

    The subclass of [GdkSnapshot] used by GTK is GtkSnapshot.

    Its methods, signals and properties are on {!class-type-snapshot_t}. The
    functions it is built on are in {!Ocgdk.Raw.Snapshot}. *)

(** The methods, signals and properties of a [GdkSnapshot]. *)
class type snapshot_t = object
  method as_snapshot : Raw.Snapshot.t
end

class snapshot : Raw.Snapshot.t -> snapshot_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Snapshot.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkSnapshot], give one already wrapped. *)

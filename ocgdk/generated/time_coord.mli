(** Stores a single event in a motion history.

    To check whether an axis is present, check whether the corresponding flag
    from the [Gdk.AxisFlags] enumeration is set in the [flags] To access
    individual axis values, use the values of the values of the [Gdk.AxisUse]
    enumerations as indices.

    Its methods, signals and properties are on {!class-type-time_coord_t}. The
    functions it is built on are in {!Ocgdk.Raw.Time_coord}. *)

(** The methods, signals and properties of a [GdkTimeCoord]. *)
class type time_coord_t = object
  method as_time_coord : Raw.Time_coord.t
end

class time_coord : Raw.Time_coord.t -> time_coord_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Time_coord.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkTimeCoord], give one already wrapped. *)

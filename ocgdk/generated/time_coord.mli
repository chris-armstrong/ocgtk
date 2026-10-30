(** Stores a single event in a motion history.

    Its methods, signals and properties are on {!class-type-time_coord_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Time_coord}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TimeCoord].}

    Stores a single event in a motion history.

    To check whether an axis is present, check whether the corresponding flag
    from the {{!Ocgdk.Enums.type-axisflags}[Gdk.AxisFlags]} enumeration is set
    in the [flags] To access individual axis values, use the values of the
    values of the {{!Ocgdk.Enums.type-axisuse}[Gdk.AxisUse]} enumerations as
    indices. *)
class type time_coord_t = object
  (** {2:conversions Conversions} *)

  method as_time_coord : Raw.Time_coord.t
end

class time_coord : Raw.Time_coord.t -> time_coord_t
(** Wraps a raw handle of {!Ocgdk.Raw.Time_coord.t}. *)

(** {1:description Description}

    Stores a single event in a motion history.

    To check whether an axis is present, check whether the corresponding flag
    from the {{!Ocgdk.Enums.type-axisflags}[Gdk.AxisFlags]} enumeration is set
    in the [flags] To access individual axis values, use the values of the
    values of the {{!Ocgdk.Enums.type-axisuse}[Gdk.AxisUse]} enumerations as
    indices. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)

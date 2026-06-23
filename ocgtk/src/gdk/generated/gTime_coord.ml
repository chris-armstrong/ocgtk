class type time_coord_t = object
  method get_time : UInt32.t
  method set_time : UInt32.t -> unit
  method get_flags : Gdk_enums.axisflags
  method set_flags : Gdk_enums.axisflags -> unit
  method get_axes : float array
  method set_axes : float array -> unit
  method as_time_coord : Time_coord.t
end

(* High-level class for TimeCoord *)
class time_coord (obj : Time_coord.t) : time_coord_t =
  object (self)
    method get_time : UInt32.t = Time_coord.get_time obj
    method set_time : UInt32.t -> unit = fun v -> Time_coord.set_time obj v
    method get_flags : Gdk_enums.axisflags = Time_coord.get_flags obj

    method set_flags : Gdk_enums.axisflags -> unit =
      fun v -> Time_coord.set_flags obj v

    method get_axes : float array = Time_coord.get_axes obj
    method set_axes : float array -> unit = fun v -> Time_coord.set_axes obj v
    method as_time_coord = obj
  end

let make (time : UInt32.t) (flags : Gdk_enums.axisflags) (axes : float array) :
    time_coord_t =
  new time_coord (Time_coord.make time flags axes)

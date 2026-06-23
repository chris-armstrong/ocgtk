class type time_coord_t = object
  method get_time : UInt32.t
  method set_time : UInt32.t -> unit
  method get_flags : Gdk_enums.axisflags
  method set_flags : Gdk_enums.axisflags -> unit
  method get_axes : float array
  method set_axes : float array -> unit
  method as_time_coord : Time_coord.t
end

class time_coord : Time_coord.t -> time_coord_t

val make : UInt32.t -> Gdk_enums.axisflags -> float array -> time_coord_t

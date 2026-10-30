class type time_coord_t = object
  (** {2:conversions Conversions} *)

  method as_time_coord : Raw.Time_coord.t
end

(* High-level class for TimeCoord *)
class time_coord (obj : Raw.Time_coord.t) : time_coord_t =
  object (self)
    method as_time_coord = obj
  end

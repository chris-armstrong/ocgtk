class type time_coord_t = object
    method as_time_coord : Time_coord.t
end

(* High-level class for TimeCoord *)
class time_coord (obj : Time_coord.t) : time_coord_t = object (self)

    method as_time_coord = obj
end


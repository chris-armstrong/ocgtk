class type time_coord_t = object
  method as_time_coord : Time_coord.t
end

class time_coord : Time_coord.t -> time_coord_t

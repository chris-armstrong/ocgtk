class type buildable_t = object
  method get_buildable_id : unit -> string option
  method as_buildable : Raw.Buildable.t
end

class buildable : Raw.Buildable.t -> buildable_t

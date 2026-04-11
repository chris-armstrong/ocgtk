class type buildable_t = object
  method get_buildable_id : unit -> string option
  method as_buildable : Buildable.t
end

class buildable : Buildable.t -> buildable_t

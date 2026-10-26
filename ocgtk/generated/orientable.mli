class type orientable_t = object
  method get_orientation : unit -> Enums.orientation
  method set_orientation : Enums.orientation -> unit
  method as_orientable : Raw.Orientable.t
end

class orientable : Raw.Orientable.t -> orientable_t

(* High-level class for MapListModel *)
class map_list_model (obj : Map_list_model.t) = object (self)

  method has_map : unit -> bool = fun () -> (Map_list_model.has_map obj )

    method as_map_list_model = obj
end


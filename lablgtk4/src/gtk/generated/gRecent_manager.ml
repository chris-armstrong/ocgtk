(* Signal class defined in grecent_manager_signals.ml *)

(* High-level class for RecentManager *)
class recent_manager (obj : Recent_manager.t) = object (self)
  inherit Grecent_manager_signals.recent_manager_signals obj

  method filename = Recent_manager.get_filename obj

  method size = Recent_manager.get_size obj

  method add_item : string -> bool = fun uri -> (Recent_manager.add_item obj uri)

  method has_item : string -> bool = fun uri -> (Recent_manager.has_item obj uri)

  method lookup_item : string -> (Recent_info.t option, GError.t) result = fun uri -> (Recent_manager.lookup_item obj uri)

  method move_item : string -> string option -> (bool, GError.t) result = fun uri new_uri -> (Recent_manager.move_item obj uri new_uri)

  method purge_items : unit -> (int, GError.t) result = fun () -> (Recent_manager.purge_items obj )

  method remove_item : string -> (bool, GError.t) result = fun uri -> (Recent_manager.remove_item obj uri)

    method as_recent_manager = obj
end


class type recent_manager_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_full : string -> Raw.Recent_data.t -> bool
  method add_item : string -> bool
  method get_items : unit -> Raw.Recent_info.t list
  method has_item : string -> bool
  method lookup_item : string -> (Raw.Recent_info.t option, GError.t) result
  method move_item : string -> string option -> (bool, GError.t) result
  method purge_items : unit -> (int, GError.t) result
  method remove_item : string -> (bool, GError.t) result
  method filename : string
  method size : int
  method as_recent_manager : Raw.Recent_manager.t
end

(* High-level class for RecentManager *)
class recent_manager (obj : Raw.Recent_manager.t) : recent_manager_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Recent_manager.on_changed ~after self#as_recent_manager ~callback

    method add_full : string -> Raw.Recent_data.t -> bool =
      fun uri recent_data -> Raw.Recent_manager.add_full obj uri recent_data

    method add_item : string -> bool =
      fun uri -> Raw.Recent_manager.add_item obj uri

    method get_items : unit -> Raw.Recent_info.t list =
      fun () -> Raw.Recent_manager.get_items obj

    method has_item : string -> bool =
      fun uri -> Raw.Recent_manager.has_item obj uri

    method lookup_item : string -> (Raw.Recent_info.t option, GError.t) result =
      fun uri -> Raw.Recent_manager.lookup_item obj uri

    method move_item : string -> string option -> (bool, GError.t) result =
      fun uri new_uri -> Raw.Recent_manager.move_item obj uri new_uri

    method purge_items : unit -> (int, GError.t) result =
      fun () -> Raw.Recent_manager.purge_items obj

    method remove_item : string -> (bool, GError.t) result =
      fun uri -> Raw.Recent_manager.remove_item obj uri

    method filename = Raw.Recent_manager.get_filename obj
    method size = Raw.Recent_manager.get_size obj
    method as_recent_manager = obj
  end

let new_ () : recent_manager_t = new recent_manager (Raw.Recent_manager.new_ ())

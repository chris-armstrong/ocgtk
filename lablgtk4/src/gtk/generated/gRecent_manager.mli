class recent_manager : Recent_manager.t ->
  object
    inherit Grecent_manager_signals.recent_manager_signals
    method filename : string
    method size : int
    method add_item : string -> bool
    method has_item : string -> bool
    method lookup_item : string -> (Recent_info.t option, GError.t) result
    method move_item : string -> string option -> (bool, GError.t) result
    method purge_items : unit -> (int, GError.t) result
    method remove_item : string -> (bool, GError.t) result
    method as_recent_manager : Recent_manager.t
  end


class type shortcut_manager_t = object
  method as_shortcut_manager : Raw.Shortcut_manager.t
end

class shortcut_manager : Raw.Shortcut_manager.t -> shortcut_manager_t

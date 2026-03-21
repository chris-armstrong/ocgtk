class type shortcut_manager_t = object
    method as_shortcut_manager : Shortcut_manager.t
end

(* High-level class for ShortcutManager *)
class shortcut_manager (obj : Shortcut_manager.t) : shortcut_manager_t = object (self)

    method as_shortcut_manager = obj
end


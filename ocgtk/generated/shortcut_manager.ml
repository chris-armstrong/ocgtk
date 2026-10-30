class type shortcut_manager_t = object
  (** {2:conversions Conversions} *)

  method as_shortcut_manager : Raw.Shortcut_manager.t
end

(* High-level class for ShortcutManager *)
class shortcut_manager (obj : Raw.Shortcut_manager.t) : shortcut_manager_t =
  object (self)
    method as_shortcut_manager = obj
  end

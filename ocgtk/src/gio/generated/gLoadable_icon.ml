class type loadable_icon_t = object
  method as_loadable_icon : Loadable_icon.t
end

(* High-level class for LoadableIcon *)
class loadable_icon (obj : Loadable_icon.t) : loadable_icon_t =
  object (self)
    method as_loadable_icon = obj
  end

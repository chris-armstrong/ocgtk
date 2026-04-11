class type loadable_icon_t = object
  method as_loadable_icon : Loadable_icon.t
end

class loadable_icon : Loadable_icon.t -> loadable_icon_t

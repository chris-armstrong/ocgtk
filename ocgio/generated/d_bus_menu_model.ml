class type d_bus_menu_model_t = object
  inherit Menu_model.menu_model_t

  (** {2:conversions Conversions} *)

  method as_d_bus_menu_model : Raw.D_bus_menu_model.t
end

(* High-level class for DBusMenuModel *)
class d_bus_menu_model (obj : Raw.D_bus_menu_model.t) : d_bus_menu_model_t =
  object (self)
    inherit Menu_model.menu_model (obj :> Raw.Menu_model.t)
    method as_d_bus_menu_model = obj
  end

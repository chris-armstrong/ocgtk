class type custom_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_custom_layout : Raw.Custom_layout.t
end

(* High-level class for CustomLayout *)
class custom_layout (obj : Raw.Custom_layout.t) : custom_layout_t =
  object (self)
    inherit Layout_manager.layout_manager (obj :> Raw.Layout_manager.t)
    method as_custom_layout = obj
  end

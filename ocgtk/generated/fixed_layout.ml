class type fixed_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_fixed_layout : Raw.Fixed_layout.t
end

(* High-level class for FixedLayout *)
class fixed_layout (obj : Raw.Fixed_layout.t) : fixed_layout_t =
  object (self)
    inherit Layout_manager.layout_manager (obj :> Raw.Layout_manager.t)
    method as_fixed_layout = obj
  end

let new_ () : fixed_layout_t = new fixed_layout (Raw.Fixed_layout.new_ ())

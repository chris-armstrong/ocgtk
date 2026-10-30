class type bin_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_bin_layout : Raw.Bin_layout.t
end

(* High-level class for BinLayout *)
class bin_layout (obj : Raw.Bin_layout.t) : bin_layout_t =
  object (self)
    inherit Layout_manager.layout_manager (obj :> Raw.Layout_manager.t)
    method as_bin_layout = obj
  end

let new_ () : bin_layout_t = new bin_layout (Raw.Bin_layout.new_ ())

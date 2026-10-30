class type custom_sorter_t = object
  inherit Sorter.sorter_t

  (** {2:conversions Conversions} *)

  method as_custom_sorter : Raw.Custom_sorter.t
end

(* High-level class for CustomSorter *)
class custom_sorter (obj : Raw.Custom_sorter.t) : custom_sorter_t =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)
    method as_custom_sorter = obj
  end

class type every_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_every_filter : Raw.Every_filter.t
end

(* High-level class for EveryFilter *)
class every_filter (obj : Raw.Every_filter.t) : every_filter_t =
  object (self)
    inherit Multi_filter.multi_filter (obj :> Raw.Multi_filter.t)
    method as_every_filter = obj
  end

let new_ () : every_filter_t = new every_filter (Raw.Every_filter.new_ ())

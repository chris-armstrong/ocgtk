class type every_filter_t = object
    inherit GMulti_filter.multi_filter_t
    method as_every_filter : Every_filter.t
end

(* High-level class for EveryFilter *)
class every_filter (obj : Every_filter.t) : every_filter_t = object (self)
  inherit GMulti_filter.multi_filter (Obj.magic obj : Multi_filter.t)

    method as_every_filter = obj
end

let new_ () : every_filter_t =
  new every_filter (Every_filter.new_ ())


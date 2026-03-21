class type custom_sorter_t = object
    method as_custom_sorter : Custom_sorter.t
end

(* High-level class for CustomSorter *)
class custom_sorter (obj : Custom_sorter.t) : custom_sorter_t = object (self)

    method as_custom_sorter = obj
end


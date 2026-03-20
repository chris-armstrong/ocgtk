class type custom_sorter_t = object
    method as_custom_sorter : Custom_sorter.t
end

class custom_sorter : Custom_sorter.t -> custom_sorter_t


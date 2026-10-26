class type custom_sorter_t = object
  inherit Sorter.sorter_t
  method as_custom_sorter : Raw.Custom_sorter.t
end

class custom_sorter : Raw.Custom_sorter.t -> custom_sorter_t

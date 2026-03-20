class type separator_t = object
    method as_separator : Separator.t
end

class separator : Separator.t -> separator_t


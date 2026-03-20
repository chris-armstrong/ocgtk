class type separator_t = object
    method as_separator : Separator.t
end

(* High-level class for Separator *)
class separator (obj : Separator.t) : separator_t = object (self)

    method as_separator = obj
end


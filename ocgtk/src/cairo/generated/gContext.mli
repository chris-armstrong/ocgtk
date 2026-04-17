class type context_t = object
    method as_context : Context.t
end

class context : Context.t -> context_t


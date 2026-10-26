class type context_t = object
  method as_context : Raw.Context.t
end

class context : Raw.Context.t -> context_t

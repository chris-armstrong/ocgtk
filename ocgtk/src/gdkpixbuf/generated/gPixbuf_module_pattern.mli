class type pixbuf_module_pattern_t = object
    method as_pixbuf_module_pattern : Pixbuf_module_pattern.t
end

class pixbuf_module_pattern : Pixbuf_module_pattern.t -> pixbuf_module_pattern_t


class type pixbuf_module_pattern_t = object
    method as_pixbuf_module_pattern : Pixbuf_module_pattern.t
end

(* High-level class for PixbufModulePattern *)
class pixbuf_module_pattern (obj : Pixbuf_module_pattern.t) : pixbuf_module_pattern_t = object (self)

    method as_pixbuf_module_pattern = obj
end


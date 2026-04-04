class type pixbuf_module_t = object
    method as_pixbuf_module : Pixbuf_module.t
end

class pixbuf_module : Pixbuf_module.t -> pixbuf_module_t


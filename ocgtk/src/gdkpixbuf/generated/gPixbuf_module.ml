class type pixbuf_module_t = object
    method as_pixbuf_module : Pixbuf_module.t
end

(* High-level class for PixbufModule *)
class pixbuf_module (obj : Pixbuf_module.t) : pixbuf_module_t = object (self)

    method as_pixbuf_module = obj
end


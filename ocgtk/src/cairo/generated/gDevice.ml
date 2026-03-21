class type device_t = object
    method as_device : Device.t
end

(* High-level class for Device *)
class device (obj : Device.t) : device_t = object (self)

    method as_device = obj
end


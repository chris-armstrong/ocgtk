class type device_t = object
    method as_device : Device.t
end

class device : Device.t -> device_t


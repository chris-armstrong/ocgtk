class type device_t = object
  method as_device : Raw.Device.t
end

class device : Raw.Device.t -> device_t

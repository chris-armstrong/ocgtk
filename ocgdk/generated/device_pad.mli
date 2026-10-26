class type device_pad_t = object
  method get_feature_group : Enums.devicepadfeature -> int -> int
  method get_group_n_modes : int -> int
  method get_n_features : Enums.devicepadfeature -> int
  method get_n_groups : unit -> int
  method as_device_pad : Raw.Device_pad.t
end

class device_pad : Raw.Device_pad.t -> device_pad_t

class device_pad : Device_pad.t ->
  object
    method get_feature_group : Gdk_enums.devicepadfeature -> int -> int
    method get_group_n_modes : int -> int
    method get_n_features : Gdk_enums.devicepadfeature -> int
    method get_n_groups : unit -> int
    method as_device_pad : Device_pad.t
  end


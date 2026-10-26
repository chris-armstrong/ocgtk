class type device_pad_t = object
  method get_feature_group : Enums.devicepadfeature -> int -> int
  method get_group_n_modes : int -> int
  method get_n_features : Enums.devicepadfeature -> int
  method get_n_groups : unit -> int
  method as_device_pad : Raw.Device_pad.t
end

(* High-level class for DevicePad *)
class device_pad (obj : Raw.Device_pad.t) : device_pad_t =
  object (self)
    method get_feature_group : Enums.devicepadfeature -> int -> int =
      fun feature feature_idx ->
        Raw.Device_pad.get_feature_group obj feature feature_idx

    method get_group_n_modes : int -> int =
      fun group_idx -> Raw.Device_pad.get_group_n_modes obj group_idx

    method get_n_features : Enums.devicepadfeature -> int =
      fun feature -> Raw.Device_pad.get_n_features obj feature

    method get_n_groups : unit -> int =
      fun () -> Raw.Device_pad.get_n_groups obj

    method as_device_pad = obj
  end

(* High-level class for DevicePad *)
class device_pad (obj : Device_pad.t) = object (self)

  method get_feature_group : Gdk_enums.devicepadfeature -> int -> int =
    fun feature feature_idx ->
      (Device_pad.get_feature_group obj feature feature_idx)

  method get_group_n_modes : int -> int =
    fun group_idx ->
      (Device_pad.get_group_n_modes obj group_idx)

  method get_n_features : Gdk_enums.devicepadfeature -> int =
    fun feature ->
      (Device_pad.get_n_features obj feature)

  method get_n_groups : unit -> int =
    fun () ->
      (Device_pad.get_n_groups obj)

    method as_device_pad = obj
end


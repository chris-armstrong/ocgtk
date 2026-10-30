class type device_pad_t = object
  (** {2:methods Methods} *)

  method get_feature_group : Enums.devicepadfeature -> int -> int
  (** Returns the group the given [feature] and [idx] belong to.

      f the feature or index do not exist in [pad], -1 is returned. *)

  method get_group_n_modes : int -> int
  (** Returns the number of modes that [group] may have. *)

  method get_n_features : Enums.devicepadfeature -> int
  (** Returns the number of features a tablet pad has. *)

  method get_n_groups : unit -> int
  (** Returns the number of groups this pad device has.

      Pads have at least one group. A pad group is a subcollection of
      buttons/strip/rings that is affected collectively by a same current mode.
  *)

  (** {2:conversions Conversions} *)

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

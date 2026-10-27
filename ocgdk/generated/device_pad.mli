(** An interface for tablet pad devices.

    It allows querying the features provided by the pad device.

    Tablet pads may contain one or more groups, each containing a subset of the
    buttons/rings/strips available. [Gdk.DevicePad.get_n_groups] can be used to
    obtain the number of groups, [Gdk.DevicePad.get_n_features] and
    [Gdk.DevicePad.get_feature_group] can be combined to find out the number of
    buttons/rings/strips the device has, and how are they grouped.

    Each of those groups have different modes, which may be used to map each
    individual pad feature to multiple actions. Only one mode is effective
    (current) for each given group, different groups may have different current
    modes. The number of available modes in a group can be found out through
    [Gdk.DevicePad.get_group_n_modes], and the current mode for a given group
    will be notified through events of type [GDK_PAD_GROUP_MODE].

    Its methods, signals and properties are on {!class-type-device_pad_t}. The
    functions it is built on are in {!Ocgdk.Raw.Device_pad}. *)

(** The methods, signals and properties of a [GdkDevicePad]. *)
class type device_pad_t = object
  method get_feature_group : Enums.devicepadfeature -> int -> int
  method get_group_n_modes : int -> int
  method get_n_features : Enums.devicepadfeature -> int
  method get_n_groups : unit -> int
  method as_device_pad : Raw.Device_pad.t
end

class device_pad : Raw.Device_pad.t -> device_pad_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Device_pad.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDevicePad], give one already wrapped. *)

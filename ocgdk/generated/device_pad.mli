(** An interface for tablet pad devices.

    Its methods, signals and properties are on {!class-type-device_pad_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgdk.Raw.Device_pad}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DevicePad].}

    An interface for tablet pad devices.

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
    will be notified through events of type [GDK_PAD_GROUP_MODE]. *)
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

class device_pad : Raw.Device_pad.t -> device_pad_t
(** Wraps a raw handle of {!Ocgdk.Raw.Device_pad.t}. *)

(** {1:description Description}

    An interface for tablet pad devices.

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
    will be notified through events of type [GDK_PAD_GROUP_MODE]. *)

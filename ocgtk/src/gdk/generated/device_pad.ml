(* GENERATED CODE - DO NOT EDIT *)
(* DevicePad: DevicePad *)

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
    will be notified through events of type [GDK_PAD_GROUP_MODE]. *)

type t = [ `device_pad ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gdk_device_pad_from_gobject"

(* Methods *)

external get_n_groups : t -> int = "ml_gdk_device_pad_get_n_groups"
(** Returns the number of groups this pad device has.

    Pads have at least one group. A pad group is a subcollection of
    buttons/strip/rings that is affected collectively by a same current mode. *)

external get_n_features : t -> Gdk_enums.devicepadfeature -> int
  = "ml_gdk_device_pad_get_n_features"
(** Returns the number of features a tablet pad has. *)

external get_group_n_modes : t -> int -> int
  = "ml_gdk_device_pad_get_group_n_modes"
(** Returns the number of modes that [group] may have. *)

external get_feature_group : t -> Gdk_enums.devicepadfeature -> int -> int
  = "ml_gdk_device_pad_get_feature_group"
(** Returns the group the given [feature] and [idx] belong to.

    f the feature or index do not exist in [pad], -1 is returned. *)

(** Bindings for [GNativeVolumeMonitor].

    Its methods, signals and properties are on
    {!class-type-native_volume_monitor_t}. The functions it is built on are in
    {!Ocgio.Raw.Native_volume_monitor}. *)

(** The methods, signals and properties of a [GNativeVolumeMonitor]. *)
class type native_volume_monitor_t = object
  inherit Volume_monitor.volume_monitor_t
  method as_native_volume_monitor : Raw.Native_volume_monitor.t
end

class native_volume_monitor :
  Raw.Native_volume_monitor.t ->
  native_volume_monitor_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Native_volume_monitor.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GNativeVolumeMonitor], give one already wrapped. *)

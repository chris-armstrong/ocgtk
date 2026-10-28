(** Bindings for [NativeVolumeMonitor].

    Its methods, signals and properties are on
    {!class-type-native_volume_monitor_t}. The functions it is built on are in
    {!Ocgio.Raw.Native_volume_monitor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NativeVolumeMonitor].} *)
class type native_volume_monitor_t = object
  inherit Volume_monitor.volume_monitor_t

  (** {2:conversions Conversions} *)

  method as_native_volume_monitor : Raw.Native_volume_monitor.t
end

class native_volume_monitor :
  Raw.Native_volume_monitor.t ->
  native_volume_monitor_t
(** Wraps a raw handle of {!Ocgio.Raw.Native_volume_monitor.t}. *)

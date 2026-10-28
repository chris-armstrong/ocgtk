(** Bindings for [Device].

    Its methods, signals and properties are on {!class-type-device_t}. The
    functions it is built on are in {!Occairo.Raw.Device}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Device].} *)
class type device_t = object
  (** {2:conversions Conversions} *)

  method as_device : Raw.Device.t
end

class device : Raw.Device.t -> device_t
(** Wraps a raw handle of {!Occairo.Raw.Device.t}. *)

(** Bindings for [cairo_device_t].

    Its methods, signals and properties are on {!class-type-device_t}. The
    functions it is built on are in {!Occairo.Raw.Device}. *)

(** The methods, signals and properties of a [cairo_device_t]. *)
class type device_t = object
  method as_device : Raw.Device.t
end

class device : Raw.Device.t -> device_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Device.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_device_t], give one already wrapped. *)

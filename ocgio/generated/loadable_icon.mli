(** [GLoadableIcon] extends the [Gio.Icon] interface and adds the ability to
    load icons from streams.

    Its methods, signals and properties are on {!class-type-loadable_icon_t}.
    The functions it is built on are in {!Ocgio.Raw.Loadable_icon}. *)

(** The methods, signals and properties of a [GLoadableIcon]. *)
class type loadable_icon_t = object
  method as_loadable_icon : Raw.Loadable_icon.t
end

class loadable_icon : Raw.Loadable_icon.t -> loadable_icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Loadable_icon.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GLoadableIcon], give one already wrapped. *)

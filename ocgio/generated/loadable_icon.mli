(** [GLoadableIcon] extends the [Gio.Icon] interface and adds the ability to
    load icons from streams.

    Its methods, signals and properties are on {!class-type-loadable_icon_t}.
    The functions it is built on are in {!Ocgio.Raw.Loadable_icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LoadableIcon].}

    Requires:
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}

    [GLoadableIcon] extends the [Gio.Icon] interface and adds the ability to
    load icons from streams. *)
class type loadable_icon_t = object
  (** {2:conversions Conversions} *)

  method as_loadable_icon : Raw.Loadable_icon.t
end

class loadable_icon : Raw.Loadable_icon.t -> loadable_icon_t
(** Wraps a raw handle of {!Ocgio.Raw.Loadable_icon.t}. *)

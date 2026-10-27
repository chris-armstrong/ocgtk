(** [GEmblemedIcon] is an implementation of [Gio.Icon] that supports adding an
    emblem to an icon. Adding multiple emblems to an icon is ensured via
    [Gio.EmblemedIcon.add_emblem].

    Note that [GEmblemedIcon] allows no control over the position of the
    emblems. See also [Gio.Emblem] for more information.

    Its methods, signals and properties are on {!class-type-emblemed_icon_t}.
    The functions it is built on are in {!Ocgio.Raw.Emblemed_icon}. *)

(** The methods, signals and properties of a [GEmblemedIcon]. *)
class type emblemed_icon_t = object
  inherit Icon.icon_t
  method add_emblem : Emblem.emblem_t -> unit
  method clear_emblems : unit -> unit
  method get_emblems : unit -> Emblem.emblem_t list
  method get_icon : unit -> Icon.icon_t
  method gicon : Icon.icon_t
  method as_emblemed_icon : Raw.Emblemed_icon.t
end

class emblemed_icon : Raw.Emblemed_icon.t -> emblemed_icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Emblemed_icon.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GEmblemedIcon], give one already wrapped. *)

val new_ : Icon.icon_t -> Emblem.emblem_t option -> emblemed_icon_t

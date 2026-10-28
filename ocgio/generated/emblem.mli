(** [GEmblem] is an implementation of [Gio.Icon] that supports having an emblem,
    which is an icon with additional properties. It can than be added to a
    [Gio.EmblemedIcon].

    Currently, only metainformation about the emblem's origin is supported. More
    may be added in the future.

    Its methods, signals and properties are on {!class-type-emblem_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Emblem}. *)

(** {b The methods, signals and properties of a [Emblem].}

    [GEmblem] is an implementation of [Gio.Icon] that supports having an emblem,
    which is an icon with additional properties. It can than be added to a
    [Gio.EmblemedIcon].

    Currently, only metainformation about the emblem's origin is supported. More
    may be added in the future. *)
class type emblem_t = object
  inherit Icon.icon_t

  method get_icon : unit -> Icon.icon_t
  (** Gives back the icon from [emblem]. *)

  method get_origin : unit -> Enums.emblemorigin
  (** Gets the origin of the emblem. *)

  method as_emblem : Raw.Emblem.t
end

class emblem : Raw.Emblem.t -> emblem_t
(** Wraps a raw handle of {!Ocgio.Raw.Emblem.t}. *)

(** {2:constructors Constructors} *)

val new_ : Icon.icon_t -> emblem_t
(** Creates a new emblem for [icon]. *)

val new_with_origin : Icon.icon_t -> Enums.emblemorigin -> emblem_t
(** Creates a new emblem for [icon]. *)

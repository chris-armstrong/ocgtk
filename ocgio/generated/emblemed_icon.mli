(** [GEmblemedIcon] is an implementation of [Gio.Icon] that supports adding an
    emblem to an icon. Adding multiple emblems to an icon is ensured via
    [Gio.EmblemedIcon.add_emblem].

    Its methods, signals and properties are on {!class-type-emblemed_icon_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Emblemed_icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EmblemedIcon].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}

    [GEmblemedIcon] is an implementation of [Gio.Icon] that supports adding an
    emblem to an icon. Adding multiple emblems to an icon is ensured via
    [Gio.EmblemedIcon.add_emblem].

    Note that [GEmblemedIcon] allows no control over the position of the
    emblems. See also [Gio.Emblem] for more information. *)
class type emblemed_icon_t = object
  inherit Icon.icon_t

  (** {2:methods Methods} *)

  method add_emblem : Emblem.emblem_t -> unit
  (** Adds [emblem] to the [GList] of [GEmblems]. *)

  method clear_emblems : unit -> unit
  (** Removes all the emblems from [icon]. *)

  method get_emblems : unit -> Emblem.emblem_t list
  (** Gets the list of emblems for the [icon]. *)

  method get_icon : unit -> Icon.icon_t
  (** Gets the main icon for [emblemed]. *)

  (** {2:properties Properties} *)

  method gicon : Icon.icon_t
  (** The [Gio.Icon] to attach emblems to. *)

  (** {2:conversions Conversions} *)

  method as_emblemed_icon : Raw.Emblemed_icon.t
end

class emblemed_icon : Raw.Emblemed_icon.t -> emblemed_icon_t
(** Wraps a raw handle of {!Ocgio.Raw.Emblemed_icon.t}. *)

(** {1:description Description}

    [GEmblemedIcon] is an implementation of [Gio.Icon] that supports adding an
    emblem to an icon. Adding multiple emblems to an icon is ensured via
    [Gio.EmblemedIcon.add_emblem].

    Note that [GEmblemedIcon] allows no control over the position of the
    emblems. See also [Gio.Emblem] for more information. *)

(** {1:constructors Constructors} *)

val new_ : Icon.icon_t -> Emblem.emblem_t option -> emblemed_icon_t
(** Creates a new emblemed icon for [icon] with the emblem [emblem]. *)

(** [GIcon] is a very minimal interface for icons. It provides functions for
    checking the equality of two icons, hashing of icons and serializing an icon
    to and from strings.

    [GIcon] does not provide the actual pixmap for the icon as this is out of
    GIO's scope, however implementations of [GIcon] may contain the name of an
    icon (see [Gio.ThemedIcon]), or the path to an icon (see
    [Gio.LoadableIcon]).

    To obtain a hash of a [GIcon], see [Gio.Icon.hash].

    To check if two [GIcon]s are equal, see [Gio.Icon.equal].

    For serializing a [GIcon], use [Gio.Icon.serialize] and
    [Gio.Icon.deserialize].

    If you want to consume [GIcon] (for example, in a toolkit) you must be
    prepared to handle at least the three following cases: [Gio.LoadableIcon],
    [Gio.ThemedIcon] and [Gio.EmblemedIcon]. It may also make sense to have
    fast-paths for other cases (like handling
    {{:https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html}[GdkPixbuf]} directly,
    for example) but all compliant [GIcon] implementations outside of GIO must
    implement [Gio.LoadableIcon].

    If your application or library provides one or more [GIcon] implementations
    you need to ensure that your new implementation also implements
    [Gio.LoadableIcon]. Additionally, you must provide an implementation of
    [Gio.Icon.serialize] that gives a result that is understood by
    [Gio.Icon.deserialize], yielding one of the built-in icon types.

    Its methods, signals and properties are on {!class-type-icon_t}. The
    functions it is built on are in {!Ocgio.Raw.Icon}. *)

(** The methods, signals and properties of a [GIcon]. *)
class type icon_t = object
  method equal : icon_t option -> bool
  method hash : unit -> int
  method serialize : unit -> Gvariant.t option
  method to_string : unit -> string option
  method as_icon : Raw.Icon.t
end

class icon : Raw.Icon.t -> icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Icon.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GIcon], give one already wrapped. *)

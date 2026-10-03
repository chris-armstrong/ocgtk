(* GENERATED CODE - DO NOT EDIT *)
(* Icon: Icon *)

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
    [Gio.Icon.deserialize], yielding one of the built-in icon types. *)

type t = [ `icon ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_icon_from_gobject"

(* Methods *)

external to_string : t -> string option = "ml_g_icon_to_string"
(** Generates a textual representation of [icon] that can be used for
    serialization such as when passing [icon] to a different process or saving
    it to persistent storage. Use g_icon_new_for_string() to get [icon] back
    from the returned string.

    The encoding of the returned string is proprietary to [GIcon] except in the
    following two cases

    - If [icon] is a [GFileIcon], the returned string is a native path (such as
      [/path/to/my icon.png]) without escaping if the [GFile] for [icon] is a
      native file. If the file is not native, the returned string is the result
      of g_file_get_uri() (such as [sftp://path/to/my%20icon.png]).

    - If [icon] is a [GThemedIcon] with exactly one name and no fallbacks, the
      encoding is simply the name (such as [network-server]). *)

external serialize : t -> Gvariant.t option = "ml_g_icon_serialize"
(** Serializes a [GIcon] into a [GVariant]. An equivalent [GIcon] can be
    retrieved back by calling g_icon_deserialize() on the returned value. As
    serialization will avoid using raw icon data when possible, it only makes
    sense to transfer the [GVariant] between processes on the same machine, (as
    opposed to over the network), and within the same file system namespace. *)

external hash : t -> int = "ml_g_icon_hash"
(** Gets a hash for an icon. *)

external equal : t -> t option -> bool = "ml_g_icon_equal"
(** Checks if two icons are equal. *)

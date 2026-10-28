(** [GIcon] is a very minimal interface for icons. It provides functions for
    checking the equality of two icons, hashing of icons and serializing an icon
    to and from strings.

    Its methods, signals and properties are on {!class-type-icon_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Icon].}

    [GIcon] is a very minimal interface for icons. It provides functions for
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
class type icon_t = object
  (** {2:methods Methods} *)

  method equal : icon_t option -> bool
  (** Checks if two icons are equal. *)

  method hash : unit -> int
  (** Gets a hash for an icon. *)

  method serialize : unit -> Gvariant.t option
  (** Serializes a [GIcon] into a [GVariant]. An equivalent [GIcon] can be
      retrieved back by calling g_icon_deserialize() on the returned value. As
      serialization will avoid using raw icon data when possible, it only makes
      sense to transfer the [GVariant] between processes on the same machine,
      (as opposed to over the network), and within the same file system
      namespace. *)

  method to_string : unit -> string option
  (** Generates a textual representation of [icon] that can be used for
      serialization such as when passing [icon] to a different process or saving
      it to persistent storage. Use g_icon_new_for_string() to get [icon] back
      from the returned string.

      The encoding of the returned string is proprietary to [GIcon] except in
      the following two cases

      - If [icon] is a [GFileIcon], the returned string is a native path (such
        as [/path/to/my icon.png]) without escaping if the [GFile] for [icon] is
        a native file. If the file is not native, the returned string is the
        result of g_file_get_uri() (such as [sftp://path/to/my%20icon.png]).

      - If [icon] is a [GThemedIcon] with exactly one name and no fallbacks, the
        encoding is simply the name (such as [network-server]). *)

  (** {2:conversions Conversions} *)

  method as_icon : Raw.Icon.t
end

class icon : Raw.Icon.t -> icon_t
(** Wraps a raw handle of {!Ocgio.Raw.Icon.t}. *)

(** {1:description Description}

    [GIcon] is a very minimal interface for icons. It provides functions for
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

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)

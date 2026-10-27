(** [GThemedIcon] is an implementation of [Gio.Icon] that supports icon themes.

    [GThemedIcon] contains a list of all of the icons present in an icon theme,
    so that icons can be looked up quickly. [GThemedIcon] does not provide
    actual pixmaps for icons, just the icon names. Ideally something like
    [Gtk.IconTheme.choose_icon] should be used to resolve the list of names so
    that fallback icons work nicely with themes that inherit other themes.

    Its methods, signals and properties are on {!class-type-themed_icon_t}. The
    functions it is built on are in {!Ocgio.Raw.Themed_icon}. *)

(** The methods, signals and properties of a [GThemedIcon]. *)
class type themed_icon_t = object
  inherit Icon.icon_t

  method append_name : string -> unit
  (** Append a name to the list of icons from within [icon].

      Note that doing so invalidates the hash computed by prior calls to
      g_icon_hash(). *)

  method get_names : unit -> string array
  (** Gets the names of icons from within [icon]. *)

  method prepend_name : string -> unit
  (** Prepend a name to the list of icons from within [icon].

      Note that doing so invalidates the hash computed by prior calls to
      g_icon_hash(). *)

  method use_default_fallbacks : bool
  method as_themed_icon : Raw.Themed_icon.t
end

class themed_icon : Raw.Themed_icon.t -> themed_icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Themed_icon.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GThemedIcon], give one already wrapped. *)

val new_ : string -> themed_icon_t
val new_from_names : string array -> int -> themed_icon_t
val new_with_default_fallbacks : string -> themed_icon_t

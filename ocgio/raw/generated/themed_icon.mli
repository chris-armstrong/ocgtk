(* GENERATED CODE - DO NOT EDIT *)
(* ThemedIcon: ThemedIcon *)

(** [GThemedIcon] is an implementation of {{!Ocgio.Raw.Icon}[Gio.Icon]} that
    supports icon themes.

    [GThemedIcon] contains a list of all of the icons present in an icon theme,
    so that icons can be looked up quickly. [GThemedIcon] does not provide
    actual pixmaps for icons, just the icon names. Ideally something like
    [Gtk.IconTheme.choose_icon] should be used to resolve the list of names so
    that fallback icons work nicely with themes that inherit other themes.

    The class built on this module is in {!Ocgio.Themed_icon}. *)

type t = [ `themed_icon | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_themed_icon_get_type"

external new_ : string -> t = "ml_g_themed_icon_new"
(** Creates a new themed icon for [iconname]. *)

external new_from_names : string array -> int -> t
  = "ml_g_themed_icon_new_from_names"
(** Creates a new themed icon for [iconnames]. *)

external new_with_default_fallbacks : string -> t
  = "ml_g_themed_icon_new_with_default_fallbacks"
[@@ocaml.doc
  "Creates a new themed icon for [iconname], and all the names\n\
   that can be created by shortening [iconname] at '-' characters.\n\n\
   In the following example, [icon1] and [icon2] are equivalent:\n\n\
   {[\n\
   const char *names[] = {\n\
  \  \"gnome-dev-cdrom-audio\",\n\
  \  \"gnome-dev-cdrom\",\n\
  \  \"gnome-dev\",\n\
  \  \"gnome\"\n\
   };\n\n\
   icon1 = g_themed_icon_new_from_names (names, 4);\n\
   icon2 = g_themed_icon_new_with_default_fallbacks (\"gnome-dev-cdrom-audio\");\n\
   ]}"]

(* Methods *)

external prepend_name : t -> string -> unit = "ml_g_themed_icon_prepend_name"
(** Prepend a name to the list of icons from within [icon].

    Note that doing so invalidates the hash computed by prior calls to
    {{!Ocgio.Raw.Icon.val-hash}[g_icon_hash ()]}. *)

external get_names : t -> string array = "ml_g_themed_icon_get_names"
(** Gets the names of icons from within [icon]. *)

external append_name : t -> string -> unit = "ml_g_themed_icon_append_name"
(** Append a name to the list of icons from within [icon].

    Note that doing so invalidates the hash computed by prior calls to
    {{!Ocgio.Raw.Icon.val-hash}[g_icon_hash ()]}. *)

(* Properties *)

external get_use_default_fallbacks : t -> bool
  = "ml_g_themed_icon_get_use_default_fallbacks"
[@@ocaml.doc
  "Whether to use the default fallbacks found by shortening the icon name\n\
   at '-' characters. If the \"names\" array has more than one element,\n\
   ignores any past the first.\n\n\
   For example, if the icon name was \"gnome-dev-cdrom-audio\", the array\n\
   would become\n\n\
   {[\n\
   {\n\
  \  \"gnome-dev-cdrom-audio\",\n\
  \  \"gnome-dev-cdrom\",\n\
  \  \"gnome-dev\",\n\
  \  \"gnome\",\n\
  \  NULL\n\
   };\n\
   ]}"]

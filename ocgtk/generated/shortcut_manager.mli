(** An interface that is used to implement shortcut scopes.

    This is important for [Gtk.Native] widgets that have their own surface,
    since the event controllers that are used to implement managed and global
    scopes are limited to the same native.

    Examples for widgets implementing [GtkShortcutManager] are [Gtk.Window] and
    [Gtk.Popover].

    Every widget that implements [GtkShortcutManager] will be used as a
    [GTK_SHORTCUT_SCOPE_MANAGED].

    Its methods, signals and properties are on {!class-type-shortcut_manager_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcut_manager}. *)

(** {b The methods, signals and properties of a [ShortcutManager].}

    An interface that is used to implement shortcut scopes.

    This is important for [Gtk.Native] widgets that have their own surface,
    since the event controllers that are used to implement managed and global
    scopes are limited to the same native.

    Examples for widgets implementing [GtkShortcutManager] are [Gtk.Window] and
    [Gtk.Popover].

    Every widget that implements [GtkShortcutManager] will be used as a
    [GTK_SHORTCUT_SCOPE_MANAGED]. *)
class type shortcut_manager_t = object
  method as_shortcut_manager : Raw.Shortcut_manager.t
end

class shortcut_manager : Raw.Shortcut_manager.t -> shortcut_manager_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcut_manager.t}. *)

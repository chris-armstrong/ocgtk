(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutManager: ShortcutManager *)

(** An interface that is used to implement shortcut scopes.

    This is important for [Gtk.Native] widgets that have their own surface,
    since the event controllers that are used to implement managed and global
    scopes are limited to the same native.

    Examples for widgets implementing [GtkShortcutManager] are [Gtk.Window] and
    [Gtk.Popover].

    Every widget that implements [GtkShortcutManager] will be used as a
    [GTK_SHORTCUT_SCOPE_MANAGED]. *)

type t = [ `shortcut_manager ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_shortcut_manager_from_gobject"

(* Methods *)

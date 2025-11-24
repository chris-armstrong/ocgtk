(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutController *)

type t = Gtk.Widget.t

(** Create a new ShortcutController *)
external new_ : unit -> t = "ml_gtk_shortcut_controller_new"

(** Create a new ShortcutController *)
external new_for_model : unit -> t = "ml_gtk_shortcut_controller_new_for_model"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_shortcut_controller_get_n_items"

external set_scope : t -> Gtk_enums.shortcutscope -> unit = "ml_gtk_shortcut_controller_set_scope"

external set_mnemonics_modifiers : t -> Gdk.modifiertype -> unit = "ml_gtk_shortcut_controller_set_mnemonics_modifiers"

external remove_shortcut : t -> Gtk.Widget.t -> unit = "ml_gtk_shortcut_controller_remove_shortcut"

external get_scope : t -> Gtk_enums.shortcutscope = "ml_gtk_shortcut_controller_get_scope"

external get_mnemonics_modifiers : t -> Gdk.modifiertype = "ml_gtk_shortcut_controller_get_mnemonics_modifiers"

external add_shortcut : t -> Gtk.Widget.t -> unit = "ml_gtk_shortcut_controller_add_shortcut"


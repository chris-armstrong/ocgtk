(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutLabel *)

type t = [`shortcut_label | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ShortcutLabel *)
external new_ : string -> t = "ml_gtk_shortcut_label_new"

(* Properties *)

(** Sets the text to be displayed by @self when no accelerator is set. *)
external set_disabled_text : t -> string -> unit = "ml_gtk_shortcut_label_set_disabled_text"

(** Sets the accelerator to be displayed by @self. *)
external set_accelerator : t -> string -> unit = "ml_gtk_shortcut_label_set_accelerator"

(** Retrieves the text that is displayed when no accelerator is set. *)
external get_disabled_text : t -> string = "ml_gtk_shortcut_label_get_disabled_text"

(** Retrieves the current accelerator of @self. *)
external get_accelerator : t -> string = "ml_gtk_shortcut_label_get_accelerator"


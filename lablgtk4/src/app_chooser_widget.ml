(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserWidget *)

type t = [`app_chooser_widget | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new AppChooserWidget *)
external new_ : string -> t = "ml_gtk_app_chooser_widget_new"

(* Properties *)

(** Sets whether the app chooser should show recommended applications
for the content type in a separate section. *)
external set_show_recommended : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_recommended"

(** Sets whether the app chooser should show applications
which are unrelated to the content type. *)
external set_show_other : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_other"

(** Sets whether the app chooser should show related applications
for the content type in a separate section. *)
external set_show_fallback : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_fallback"

(** Sets whether the app chooser should show the default handler
for the content type in a separate section. *)
external set_show_default : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_default"

(** Sets whether the app chooser should show all applications
in a flat list. *)
external set_show_all : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_all"

(** Sets the text that is shown if there are not applications
that can handle the content type. *)
external set_default_text : t -> string -> unit = "ml_gtk_app_chooser_widget_set_default_text"

(** Gets whether the app chooser should show recommended applications
for the content type in a separate section. *)
external get_show_recommended : t -> bool = "ml_gtk_app_chooser_widget_get_show_recommended"

(** Gets whether the app chooser should show applications
which are unrelated to the content type. *)
external get_show_other : t -> bool = "ml_gtk_app_chooser_widget_get_show_other"

(** Gets whether the app chooser should show related applications
for the content type in a separate section. *)
external get_show_fallback : t -> bool = "ml_gtk_app_chooser_widget_get_show_fallback"

(** Gets whether the app chooser should show the default handler
for the content type in a separate section. *)
external get_show_default : t -> bool = "ml_gtk_app_chooser_widget_get_show_default"

(** Gets whether the app chooser should show all applications
in a flat list. *)
external get_show_all : t -> bool = "ml_gtk_app_chooser_widget_get_show_all"

(** Returns the text that is shown if there are not applications
that can handle the content type. *)
external get_default_text : t -> string option = "ml_gtk_app_chooser_widget_get_default_text"


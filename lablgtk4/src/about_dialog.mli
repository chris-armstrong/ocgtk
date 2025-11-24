(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AboutDialog *)

type t = Gtk.Widget.t

(** Create a new AboutDialog *)
external new_ : unit -> t = "ml_gtk_about_dialog_new"

(* Properties *)

(** Get property: comments *)
external get_comments : t -> string = "ml_gtk_about_dialog_get_comments"

(** Set property: comments *)
external set_comments : t -> string -> unit = "ml_gtk_about_dialog_set_comments"

(** Get property: copyright *)
external get_copyright : t -> string = "ml_gtk_about_dialog_get_copyright"

(** Set property: copyright *)
external set_copyright : t -> string -> unit = "ml_gtk_about_dialog_set_copyright"

(** Get property: license *)
external get_license : t -> string = "ml_gtk_about_dialog_get_license"

(** Set property: license *)
external set_license : t -> string -> unit = "ml_gtk_about_dialog_set_license"

(** Get property: logo-icon-name *)
external get_logo_icon_name : t -> string = "ml_gtk_about_dialog_get_logo_icon_name"

(** Set property: logo-icon-name *)
external set_logo_icon_name : t -> string -> unit = "ml_gtk_about_dialog_set_logo_icon_name"

(** Get property: program-name *)
external get_program_name : t -> string = "ml_gtk_about_dialog_get_program_name"

(** Set property: program-name *)
external set_program_name : t -> string -> unit = "ml_gtk_about_dialog_set_program_name"

(** Get property: system-information *)
external get_system_information : t -> string = "ml_gtk_about_dialog_get_system_information"

(** Set property: system-information *)
external set_system_information : t -> string -> unit = "ml_gtk_about_dialog_set_system_information"

(** Get property: translator-credits *)
external get_translator_credits : t -> string = "ml_gtk_about_dialog_get_translator_credits"

(** Set property: translator-credits *)
external set_translator_credits : t -> string -> unit = "ml_gtk_about_dialog_set_translator_credits"

(** Get property: version *)
external get_version : t -> string = "ml_gtk_about_dialog_get_version"

(** Set property: version *)
external set_version : t -> string -> unit = "ml_gtk_about_dialog_set_version"

(** Get property: website *)
external get_website : t -> string = "ml_gtk_about_dialog_get_website"

(** Set property: website *)
external set_website : t -> string -> unit = "ml_gtk_about_dialog_set_website"

(** Get property: website-label *)
external get_website_label : t -> string = "ml_gtk_about_dialog_get_website_label"

(** Set property: website-label *)
external set_website_label : t -> string -> unit = "ml_gtk_about_dialog_set_website_label"

(** Get property: wrap-license *)
external get_wrap_license : t -> bool = "ml_gtk_about_dialog_get_wrap_license"

(** Set property: wrap-license *)
external set_wrap_license : t -> bool -> unit = "ml_gtk_about_dialog_set_wrap_license"

external get_documenters : t -> unit = "ml_gtk_about_dialog_get_documenters"

external get_authors : t -> unit = "ml_gtk_about_dialog_get_authors"

external get_artists : t -> unit = "ml_gtk_about_dialog_get_artists"


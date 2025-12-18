(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserWidget *)

type t = [`app_chooser_widget | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new AppChooserWidget *)
external new_ : string -> t = "ml_gtk_app_chooser_widget_new"

(* Properties *)

(** Get property: default-text *)
external get_default_text : t -> string = "ml_gtk_app_chooser_widget_get_default_text"

(** Set property: default-text *)
external set_default_text : t -> string -> unit = "ml_gtk_app_chooser_widget_set_default_text"

(** Get property: show-all *)
external get_show_all : t -> bool = "ml_gtk_app_chooser_widget_get_show_all"

(** Set property: show-all *)
external set_show_all : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_all"

(** Get property: show-default *)
external get_show_default : t -> bool = "ml_gtk_app_chooser_widget_get_show_default"

(** Set property: show-default *)
external set_show_default : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_default"

(** Get property: show-fallback *)
external get_show_fallback : t -> bool = "ml_gtk_app_chooser_widget_get_show_fallback"

(** Set property: show-fallback *)
external set_show_fallback : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_fallback"

(** Get property: show-other *)
external get_show_other : t -> bool = "ml_gtk_app_chooser_widget_get_show_other"

(** Set property: show-other *)
external set_show_other : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_other"

(** Get property: show-recommended *)
external get_show_recommended : t -> bool = "ml_gtk_app_chooser_widget_get_show_recommended"

(** Set property: show-recommended *)
external set_show_recommended : t -> bool -> unit = "ml_gtk_app_chooser_widget_set_show_recommended"


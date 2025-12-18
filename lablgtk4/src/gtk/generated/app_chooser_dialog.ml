(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AppChooserDialog *)

type t = [`app_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new AppChooserDialog *)
external new_ : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> unit -> t = "ml_gtk_app_chooser_dialog_new"

(** Create a new AppChooserDialog *)
external new_for_content_type : Application_and__window_and__window_group.Window.t option -> Gtk_enums.dialogflags -> string -> t = "ml_gtk_app_chooser_dialog_new_for_content_type"

(* Properties *)

(** Get property: heading *)
external get_heading : t -> string = "ml_gtk_app_chooser_dialog_get_heading"

(** Set property: heading *)
external set_heading : t -> string -> unit = "ml_gtk_app_chooser_dialog_set_heading"

(** Returns the `GtkAppChooserWidget` of this dialog. *)
external get_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_app_chooser_dialog_get_widget"


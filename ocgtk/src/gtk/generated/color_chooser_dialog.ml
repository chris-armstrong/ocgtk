(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorChooserDialog *)

type t = [`color_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ColorChooserDialog *)
external new_ : string option -> Application_and__window_and__window_group.Window.t option -> t = "ml_gtk_color_chooser_dialog_new"

(* Methods *)
(* Properties *)

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_chooser_dialog_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_chooser_dialog_set_show_editor"


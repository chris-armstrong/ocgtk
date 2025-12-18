(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColorChooserWidget *)

type t = [`color_chooser_widget | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ColorChooserWidget *)
external new_ : unit -> t = "ml_gtk_color_chooser_widget_new"

(* Properties *)

(** Get property: show-editor *)
external get_show_editor : t -> bool = "ml_gtk_color_chooser_widget_get_show_editor"

(** Set property: show-editor *)
external set_show_editor : t -> bool -> unit = "ml_gtk_color_chooser_widget_set_show_editor"


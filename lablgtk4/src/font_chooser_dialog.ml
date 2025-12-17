(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooserDialog *)

type t = [`font_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new FontChooserDialog *)
external new_ : string option -> Application_and__window_and__window_group.Window.t option -> t = "ml_gtk_font_chooser_dialog_new"


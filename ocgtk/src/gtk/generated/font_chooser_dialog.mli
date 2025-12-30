(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooserDialog *)

type t = [`font_chooser_dialog | `dialog | `window | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new FontChooserDialog *)
external new_ : string option -> Application_and__window_and__window_group.Window.t option -> t = "ml_gtk_font_chooser_dialog_new"

(* Methods *)

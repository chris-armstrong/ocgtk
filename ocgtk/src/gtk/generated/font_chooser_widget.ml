(* GENERATED CODE - DO NOT EDIT *)
(* FontChooserWidget: FontChooserWidget *)

type t = [`font_chooser_widget | `widget | `initially_unowned] Gobject.obj

(** Create a new FontChooserWidget *)
external new_ : unit -> t = "ml_gtk_font_chooser_widget_new"

(* Methods *)
(* Properties *)

(** Get property: tweak-action *)
external get_tweak_action : t -> Ocgtk_gio.Gio.Wrappers.Action.t = "ml_gtk_font_chooser_widget_get_tweak_action"


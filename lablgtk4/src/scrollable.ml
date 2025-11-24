(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scrollable *)

type t = Gtk.widget

(* Properties *)

external set_vscroll_policy : t -> Gtk_enums.scrollablepolicy -> unit = "ml_gtk_scrollable_set_vscroll_policy"

external set_vadjustment : t -> Gtk.widget option -> unit = "ml_gtk_scrollable_set_vadjustment"

external set_hscroll_policy : t -> Gtk_enums.scrollablepolicy -> unit = "ml_gtk_scrollable_set_hscroll_policy"

external set_hadjustment : t -> Gtk.widget option -> unit = "ml_gtk_scrollable_set_hadjustment"

external get_vscroll_policy : t -> Gtk_enums.scrollablepolicy = "ml_gtk_scrollable_get_vscroll_policy"

external get_vadjustment : t -> Gtk.widget = "ml_gtk_scrollable_get_vadjustment"

external get_hscroll_policy : t -> Gtk_enums.scrollablepolicy = "ml_gtk_scrollable_get_hscroll_policy"

external get_hadjustment : t -> Gtk.widget = "ml_gtk_scrollable_get_hadjustment"

external get_border : t -> Gtk.widget -> bool = "ml_gtk_scrollable_get_border"


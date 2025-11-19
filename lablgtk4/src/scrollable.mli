(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scrollable *)

type t = Gtk.Widget.t

(* Properties *)

external set_vscroll_policy : t -> scrollablepolicy -> unit = "ml_gtk_scrollable_set_vscroll_policy"

external set_vadjustment : t -> Gtk.Widget.t option -> unit = "ml_gtk_scrollable_set_vadjustment"

external set_hscroll_policy : t -> scrollablepolicy -> unit = "ml_gtk_scrollable_set_hscroll_policy"

external set_hadjustment : t -> Gtk.Widget.t option -> unit = "ml_gtk_scrollable_set_hadjustment"

external get_vscroll_policy : t -> scrollablepolicy = "ml_gtk_scrollable_get_vscroll_policy"

external get_vadjustment : t -> Gtk.Widget.t = "ml_gtk_scrollable_get_vadjustment"

external get_hscroll_policy : t -> scrollablepolicy = "ml_gtk_scrollable_get_hscroll_policy"

external get_hadjustment : t -> Gtk.Widget.t = "ml_gtk_scrollable_get_hadjustment"

external get_border : t -> Gtk.Widget.t -> bool = "ml_gtk_scrollable_get_border"


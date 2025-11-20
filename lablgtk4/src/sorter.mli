(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Sorter *)

type t = Gtk.Widget.t

external get_order : t -> Gtk_enums.sorterorder = "ml_gtk_sorter_get_order"

external compare : t -> unit -> unit -> Gtk_enums.ordering = "ml_gtk_sorter_compare"

external changed : t -> Gtk_enums.sorterchange -> unit = "ml_gtk_sorter_changed"


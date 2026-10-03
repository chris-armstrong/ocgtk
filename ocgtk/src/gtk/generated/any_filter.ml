(* GENERATED CODE - DO NOT EDIT *)
(* AnyFilter: AnyFilter *)

type t = [ `any_filter | `multi_filter | `filter | `object_ ] Gobject.obj
(** Matches an item when at least one of its filters matches.

    To add filters to a [GtkAnyFilter], use [Gtk.MultiFilter.append]. *)

external new_ : unit -> t = "ml_gtk_any_filter_new"
(** Create a new AnyFilter *)

(* Methods *)

(* GENERATED CODE - DO NOT EDIT *)
(* AnyFilter: AnyFilter *)

(** Matches an item when at least one of its filters matches.

    To add filters to a [GtkAnyFilter], use [Gtk.MultiFilter.append]. *)

type t = [ `any_filter | `multi_filter | `filter | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_any_filter_new"
(** Create a new AnyFilter *)

(* Methods *)

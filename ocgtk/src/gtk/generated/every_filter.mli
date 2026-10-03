(* GENERATED CODE - DO NOT EDIT *)
(* EveryFilter: EveryFilter *)

type t = [ `every_filter | `multi_filter | `filter | `object_ ] Gobject.obj
(** Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use [Gtk.MultiFilter.append]. *)

external new_ : unit -> t = "ml_gtk_every_filter_new"
(** Create a new EveryFilter *)

(* Methods *)

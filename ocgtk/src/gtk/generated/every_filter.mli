(* GENERATED CODE - DO NOT EDIT *)
(* EveryFilter: EveryFilter *)

(** Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use [Gtk.MultiFilter.append]. *)

type t = [ `every_filter | `multi_filter | `filter | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_every_filter_new"
(** Create a new EveryFilter *)

(* Methods *)

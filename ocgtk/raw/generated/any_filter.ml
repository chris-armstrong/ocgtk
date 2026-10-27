(* GENERATED CODE - DO NOT EDIT *)
(* AnyFilter: AnyFilter *)

(** Matches an item when at least one of its filters matches.

    To add filters to a [GtkAnyFilter], use [Gtk.MultiFilter.append].

    The class built on this module is in {!Ocgtk.Any_filter}. *)

type t = [ `any_filter | `multi_filter | `filter | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_any_filter_get_type"

external new_ : unit -> t = "ml_gtk_any_filter_new"
(** Create a new AnyFilter *)

(* Methods *)

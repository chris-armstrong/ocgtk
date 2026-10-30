(* GENERATED CODE - DO NOT EDIT *)
(* EveryFilter: EveryFilter *)

(** Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use
    {{!Ocgtk.Raw.Multi_filter.val-append}[Gtk.MultiFilter.append]}.

    The class built on this module is in {!Ocgtk.Every_filter}. *)

type t = [ `every_filter | `multi_filter | `filter | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_every_filter_get_type"

external new_ : unit -> t = "ml_gtk_every_filter_new"
[@@ocaml.doc
  "Creates a new empty \"every\" filter.\n\n\
   Use {{!Ocgtk.Raw.Multi_filter.val-append}[Gtk.MultiFilter.append]} to add \
   filters to it.\n\n\
   This filter matches an item if each of the filters added to it\n\
   matches the item. In particular, this means that if no filter\n\
   has been added to it, the filter matches every item."]

(* Methods *)

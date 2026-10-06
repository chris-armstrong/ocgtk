(* GENERATED CODE - DO NOT EDIT *)
(* SectionModel: SectionModel *)

(** An interface that adds support for sections to list models.

    A [GtkSectionModel] groups successive items into so-called sections. List
    widgets like [GtkListView] and [GtkGridView] then allow displaying section
    headers for these sections by installing a header factory.

    Many GTK list models support sections inherently, or they pass through the
    sections of a model they are wrapping.

    When the section groupings of a model change, the model will emit the
    [Gtk.SectionModel::sections-changed] signal by calling the
    [Gtk.SectionModel.sections_changed] function. All sections in the given
    range then need to be queried again. The [Gio.ListModel::items-changed]
    signal has the same effect, all sections in that range are invalidated, too.
*)

type t = [ `section_model ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_section_model_from_gobject"

(* Methods *)

external sections_changed : t -> int -> int -> unit
  = "ml_gtk_section_model_sections_changed"
(** This function emits the [Gtk.SectionModel::sections-changed] signal to
    notify about changes to sections.

    It must cover all positions that used to be a section start or that are now
    a section start. It does not have to cover all positions for which the
    section has changed.

    The [Gio.ListModel::items-changed] implies the effect of the
    [Gtk.SectionModel::sections-changed] signal for all the items it covers.

    It is recommended that when changes to the items cause section changes in a
    larger range, that the larger range is included in the emission of the
    [Gio.ListModel::items-changed] instead of emitting two signals. *)

external get_section : t -> int -> int * int
  = "ml_gtk_section_model_get_section"
(** Query the section that covers the given position. The number of items in the
    section can be computed by [out_end - out_start].

    If the position is larger than the number of items, a single range from
    n_items to G_MAXUINT will be returned. *)

val on_sections_changed :
  ?after:bool ->
  t ->
  callback:(position:int -> n_items:int -> unit) ->
  Gobject.Signal.handler_id

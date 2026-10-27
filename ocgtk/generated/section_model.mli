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

    Its methods, signals and properties are on {!class-type-section_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Section_model}. *)

(** The methods, signals and properties of a [GtkSectionModel]. *)
class type section_model_t = object
  method on_sections_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method sections_changed : int -> int -> unit
  (** This function emits the [Gtk.SectionModel::sections-changed] signal to
      notify about changes to sections.

      It must cover all positions that used to be a section start or that are
      now a section start. It does not have to cover all positions for which the
      section has changed.

      The [Gio.ListModel::items-changed] implies the effect of the
      [Gtk.SectionModel::sections-changed] signal for all the items it covers.

      It is recommended that when changes to the items cause section changes in
      a larger range, that the larger range is included in the emission of the
      [Gio.ListModel::items-changed] instead of emitting two signals. *)

  method as_section_model : Raw.Section_model.t
end

class section_model : Raw.Section_model.t -> section_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Section_model.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSectionModel], give one already wrapped. *)

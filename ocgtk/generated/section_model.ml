class type section_model_t = object
  (** {2:signals Signals} *)

  method on_sections_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the start-of-section state of some of the items in [model]
      changes.

      Note that this signal does not specify the new section state of the items,
      they need to be queried manually. It is also not necessary for a model to
      change the section state of any of the items in the section model, though
      it would be rather useless to emit such a signal.

      The [Gio.ListModel::items-changed] implies the effect of the
      [Gtk.SectionModel::sections-changed] signal for all the items it covers.
  *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_section_model : Raw.Section_model.t
end

(* High-level class for SectionModel *)
class section_model (obj : Raw.Section_model.t) : section_model_t =
  object (self)
    method on_sections_changed ?(after = false) ~callback () =
      Raw.Section_model.on_sections_changed ~after self#as_section_model
        ~callback

    method sections_changed : int -> int -> unit =
      fun position n_items ->
        Raw.Section_model.sections_changed obj position n_items

    method as_section_model = obj
  end

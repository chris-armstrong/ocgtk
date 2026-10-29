class type constraint_layout_t = object
  inherit Layout_manager.layout_manager_t
  inherit Buildable.buildable_t

  (** {2:methods Methods} *)

  method add_constraint : Constraint.constraint__t -> unit
  (** Adds a constraint to the layout manager.

      The [Gtk.Constraint:source] and [Gtk.Constraint:target] properties of
      [constraint] can be:

      - set to [NULL] to indicate that the constraint refers to the widget using
        [layout]
      - set to the [Gtk.Widget] using [layout]
      - set to a child of the [Gtk.Widget] using [layout]
      - set to a [Gtk.ConstraintGuide] that is part of [layout]

      The [layout] acquires the ownership of [constraint] after calling this
      function. *)

  method add_guide : Constraint_guide.constraint_guide_t -> unit
  (** Adds a guide to [layout].

      A guide can be used as the source or target of constraints, like a widget,
      but it is not visible.

      The [layout] acquires the ownership of [guide] after calling this
      function. *)

  method observe_constraints : unit -> Ocgio.List_model.list_model_t
  (** Returns a [GListModel] to track the constraints that are part of the
      layout.

      Calling this function will enable extra internal bookkeeping to track
      constraints and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  method observe_guides : unit -> Ocgio.List_model.list_model_t
  (** Returns a [GListModel] to track the guides that are part of the layout.

      Calling this function will enable extra internal bookkeeping to track
      guides and emit signals on the returned listmodel. It may slow down
      operations a lot.

      Applications should try hard to avoid calling this function because of the
      slowdowns. *)

  method remove_all_constraints : unit -> unit
  (** Removes all constraints from the layout manager. *)

  method remove_constraint : Constraint.constraint__t -> unit
  (** Removes [constraint] from the layout manager, so that it no longer
      influences the layout. *)

  method remove_guide : Constraint_guide.constraint_guide_t -> unit
  (** Removes [guide] from the layout manager, so that it no longer influences
      the layout. *)

  (** {2:conversions Conversions} *)

  method as_constraint_layout : Raw.Constraint_layout.t
end

(* High-level class for ConstraintLayout *)
class constraint_layout (obj : Raw.Constraint_layout.t) : constraint_layout_t =
  object (self)
    inherit Layout_manager.layout_manager (obj :> Raw.Layout_manager.t)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method add_constraint : Constraint.constraint__t -> unit =
      fun constraint_ ->
        let constraint_ = constraint_#as_constraint_ in
        Raw.Constraint_layout.add_constraint obj constraint_

    method add_guide : Constraint_guide.constraint_guide_t -> unit =
      fun guide ->
        let guide = guide#as_constraint_guide in
        Raw.Constraint_layout.add_guide obj guide

    method observe_constraints : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model
          (Raw.Constraint_layout.observe_constraints obj)

    method observe_guides : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model
          (Raw.Constraint_layout.observe_guides obj)

    method remove_all_constraints : unit -> unit =
      fun () -> Raw.Constraint_layout.remove_all_constraints obj

    method remove_constraint : Constraint.constraint__t -> unit =
      fun constraint_ ->
        let constraint_ = constraint_#as_constraint_ in
        Raw.Constraint_layout.remove_constraint obj constraint_

    method remove_guide : Constraint_guide.constraint_guide_t -> unit =
      fun guide ->
        let guide = guide#as_constraint_guide in
        Raw.Constraint_layout.remove_guide obj guide

    method as_constraint_layout = obj
  end

let new_ () : constraint_layout_t =
  new constraint_layout (Raw.Constraint_layout.new_ ())

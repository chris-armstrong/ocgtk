class type selection_model_t = object
  (** {2:signals Signals} *)

  method on_selection_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the selection state of some of the items in [model] changes.

      Note that this signal does not specify the new selection state of the
      items, they need to be queried manually. It is also not necessary for a
      model to change the selection state of any of the items in the selection
      model, though it would be rather useless to emit such a signal. *)

  (** {2:methods Methods} *)

  method get_selection : unit -> Raw.Bitset.t
  (** Gets the set containing all currently selected items in the model.

      This function may be slow, so if you are only interested in single item,
      consider using [Gtk.SelectionModel.is_selected] or if you are only
      interested in a few, consider [Gtk.SelectionModel.get_selection_in_range].
  *)

  method get_selection_in_range : int -> int -> Raw.Bitset.t
  (** Gets the set of selected items in a range.

      This function is an optimization for [Gtk.SelectionModel.get_selection]
      when you are only interested in part of the model's selected state. A
      common use case is in response to the
      [Gtk.SelectionModel::selection-changed] signal. *)

  method is_selected : int -> bool
  (** Checks if the given item is selected. *)

  method select_all : unit -> bool
  (** Requests to select all items in the model. *)

  method select_item : int -> bool -> bool
  (** Requests to select an item in the model. *)

  method select_range : int -> int -> bool -> bool
  (** Requests to select a range of items in the model. *)

  method selection_changed : int -> int -> unit
  (** Helper function for implementations of [GtkSelectionModel].

      Call this when the selection changes to emit the
      [Gtk.SelectionModel::selection-changed] signal. *)

  method set_selection : Raw.Bitset.t -> Raw.Bitset.t -> bool
  (** Make selection changes.

      This is the most advanced selection updating method that allows the most
      fine-grained control over selection changes. If you can, you should try
      the simpler versions, as implementations are more likely to implement
      support for those.

      Requests that the selection state of all positions set in [mask] be
      updated to the respective value in the [selected] bitmask.

      In pseudocode, it would look something like this:

      {[
      for (i = 0; i < n_items; i++)
        {
          // don't change values not in the mask
          if (!gtk_bitset_contains (mask, i))
            continue;

          if (gtk_bitset_contains (selected, i))
            select_item (i);
          else
            unselect_item (i);
        }

      gtk_selection_model_selection_changed (model,
                                             first_changed_item,
                                             n_changed_items);
      ]}

      [mask] and [selected] must not be modified. They may refer to the same
      bitset, which would mean that every item in the set should be selected. *)

  method unselect_all : unit -> bool
  (** Requests to unselect all items in the model. *)

  method unselect_item : int -> bool
  (** Requests to unselect an item in the model. *)

  method unselect_range : int -> int -> bool
  (** Requests to unselect a range of items in the model. *)

  (** {2:conversions Conversions} *)

  method as_selection_model : Raw.Selection_model.t
end

(* High-level class for SelectionModel *)
class selection_model (obj : Raw.Selection_model.t) : selection_model_t =
  object (self)
    method on_selection_changed ?(after = false) ~callback () =
      Raw.Selection_model.on_selection_changed ~after self#as_selection_model
        ~callback

    method get_selection : unit -> Raw.Bitset.t =
      fun () -> Raw.Selection_model.get_selection obj

    method get_selection_in_range : int -> int -> Raw.Bitset.t =
      fun position n_items ->
        Raw.Selection_model.get_selection_in_range obj position n_items

    method is_selected : int -> bool =
      fun position -> Raw.Selection_model.is_selected obj position

    method select_all : unit -> bool =
      fun () -> Raw.Selection_model.select_all obj

    method select_item : int -> bool -> bool =
      fun position unselect_rest ->
        Raw.Selection_model.select_item obj position unselect_rest

    method select_range : int -> int -> bool -> bool =
      fun position n_items unselect_rest ->
        Raw.Selection_model.select_range obj position n_items unselect_rest

    method selection_changed : int -> int -> unit =
      fun position n_items ->
        Raw.Selection_model.selection_changed obj position n_items

    method set_selection : Raw.Bitset.t -> Raw.Bitset.t -> bool =
      fun selected mask -> Raw.Selection_model.set_selection obj selected mask

    method unselect_all : unit -> bool =
      fun () -> Raw.Selection_model.unselect_all obj

    method unselect_item : int -> bool =
      fun position -> Raw.Selection_model.unselect_item obj position

    method unselect_range : int -> int -> bool =
      fun position n_items ->
        Raw.Selection_model.unselect_range obj position n_items

    method as_selection_model = obj
  end

class type single_selection_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  inherit Selection_model.selection_model_t

  (** {2:methods Methods} *)

  method get_autoselect : unit -> bool
  (** Checks if autoselect has been enabled or disabled via
      gtk_single_selection_set_autoselect(). *)

  method get_can_unselect : unit -> bool
  (** If [true], gtk_selection_model_unselect_item() is supported and allows
      unselecting the selected item. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that [self] is wrapping. *)

  method get_selected : unit -> int
  (** Gets the position of the selected item.

      If no item is selected, [GTK_INVALID_LIST_POSITION] is returned. *)

  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the selected item.

      If no item is selected, [None] is returned. *)

  method set_autoselect : bool -> unit
  (** Enables or disables autoselect.

      If [autoselect] is [true], [self] will enforce that an item is always
      selected. It will select a new item when the currently selected item is
      deleted and it will disallow unselecting the current item. *)

  method set_can_unselect : bool -> unit
  (** If [true], unselecting the current item via
      gtk_selection_model_unselect_item() is supported.

      Note that setting [Gtk.SingleSelection:autoselect] will cause unselecting
      to not work, so it practically makes no sense to set both at the same
      time. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model that [self] should wrap.

      If [model] is [None], [self] will be empty. *)

  method set_selected : int -> unit
  (** Selects the item at the given position.

      If the list does not have an item at [position] or
      [GTK_INVALID_LIST_POSITION] is given, the behavior depends on the value of
      the [Gtk.SingleSelection:autoselect] property: If it is set, no change
      will occur and the old item will stay selected. If it is unset, the
      selection will be unset and no item will be selected. This also applies if
      [Gtk.SingleSelection:can-unselect] is set to [false]. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_single_selection : Raw.Single_selection.t
end

(* High-level class for SingleSelection *)
class single_selection (obj : Raw.Single_selection.t) : single_selection_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    inherit
      Selection_model.selection_model (Raw.Selection_model.from_gobject obj)

    method get_autoselect : unit -> bool =
      fun () -> Raw.Single_selection.get_autoselect obj

    method get_can_unselect : unit -> bool =
      fun () -> Raw.Single_selection.get_can_unselect obj

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Single_selection.get_model obj)

    method get_selected : unit -> int =
      fun () -> Raw.Single_selection.get_selected obj

    method get_selected_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Single_selection.get_selected_item obj

    method set_autoselect : bool -> unit =
      fun autoselect -> Raw.Single_selection.set_autoselect obj autoselect

    method set_can_unselect : bool -> unit =
      fun can_unselect -> Raw.Single_selection.set_can_unselect obj can_unselect

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Single_selection.set_model obj model

    method set_selected : int -> unit =
      fun position -> Raw.Single_selection.set_selected obj position

    method item_type = Raw.Single_selection.get_item_type obj
    method n_items = Raw.Single_selection.get_n_items obj
    method as_single_selection = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) : single_selection_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.Single_selection.new_ model in
  new single_selection obj_

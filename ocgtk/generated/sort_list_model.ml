class type sort_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  (** {2:methods Methods} *)

  method get_incremental : unit -> bool
  (** Returns whether incremental sorting is enabled.

      See [Gtk.SortListModel.set_incremental]. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model currently sorted or [None] if none. *)

  method get_pending : unit -> int
  (** Estimates progress of an ongoing sorting operation.

      The estimate is the number of items that would still need to be sorted to
      finish the sorting operation if this was a linear algorithm. So this
      number is not related to how many items are already correctly sorted.

      If you want to estimate the progress, you can use code like this:

      {[
      pending = gtk_sort_list_model_get_pending self;
      model = gtk_sort_list_model_get_model self;
      progress = 1.0 - (pending / double MAX (1, g_list_model_get_n_items model))
      ]}

      If no sort operation is ongoing - in particular when
      [Gtk.SortListModel:incremental] is [false] - this function returns 0. *)

  method get_section_sorter : unit -> Sorter.sorter_t option
  (** Gets the section sorter that is used to sort items of [self] into
      sections. *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Gets the sorter that is used to sort [self]. *)

  method set_incremental : bool -> unit
  (** Sets the sort model to do an incremental sort.

      When incremental sorting is enabled, the [GtkSortListModel] will not do a
      complete sort immediately, but will instead queue an idle handler that
      incrementally sorts the items towards their correct position. This of
      course means that items do not instantly appear in the right place. It
      also means that the total sorting time is a lot slower.

      When your filter blocks the UI while sorting, you might consider turning
      this on. Depending on your model and sorters, this may become interesting
      around 10,000 to 100,000 items.

      By default, incremental sorting is disabled.

      See [Gtk.SortListModel.get_pending] for progress information about an
      ongoing incremental sorting operation. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to be sorted.

      The [model]'s item type must conform to the item type of [self]. *)

  method set_section_sorter : Sorter.sorter_t option -> unit
  (** Sets a new section sorter on [self]. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Sets a new sorter on [self]. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_sort_list_model : Raw.Sort_list_model.t
end

(* High-level class for SortListModel *)
class sort_list_model (obj : Raw.Sort_list_model.t) : sort_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_incremental : unit -> bool =
      fun () -> Raw.Sort_list_model.get_incremental obj

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Sort_list_model.get_model obj)

    method get_pending : unit -> int =
      fun () -> Raw.Sort_list_model.get_pending obj

    method get_section_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Sort_list_model.get_section_sorter obj)

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Sort_list_model.get_sorter obj)

    method set_incremental : bool -> unit =
      fun incremental -> Raw.Sort_list_model.set_incremental obj incremental

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Sort_list_model.set_model obj model

    method set_section_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Sort_list_model.set_section_sorter obj sorter

    method set_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Sort_list_model.set_sorter obj sorter

    method item_type = Raw.Sort_list_model.get_item_type obj
    method n_items = Raw.Sort_list_model.get_n_items obj
    method as_sort_list_model = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option)
    (sorter : Sorter.sorter_t option) : sort_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let sorter = Option.map (fun c -> c#as_sorter) sorter in
  let obj_ = Raw.Sort_list_model.new_ model sorter in
  new sort_list_model obj_

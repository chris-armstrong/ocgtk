class type slice_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that is currently being used or [NULL] if none. *)

  method get_offset : unit -> int
  (** Gets the offset set via gtk_slice_list_model_set_offset(). *)

  method get_size : unit -> int
  (** Gets the size set via gtk_slice_list_model_set_size(). *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to show a slice of.

      The model's item type must conform to [self]'s item type. *)

  method set_offset : int -> unit
  (** Sets the offset into the original model for this slice.

      If the offset is too large for the sliced model, [self] will end up empty.
  *)

  method set_size : int -> unit
  (** Sets the maximum size. [self] will never have more items than [size].

      It can however have fewer items if the offset is too large or the model
      sliced from doesn't have enough items. *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  method as_slice_list_model : Raw.Slice_list_model.t
end

(* High-level class for SliceListModel *)
class slice_list_model (obj : Raw.Slice_list_model.t) : slice_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)
    inherit Section_model.section_model (Raw.Section_model.from_gobject obj)

    method get_model : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Slice_list_model.get_model obj)

    method get_offset : unit -> int =
      fun () -> Raw.Slice_list_model.get_offset obj

    method get_size : unit -> int = fun () -> Raw.Slice_list_model.get_size obj

    method set_model : Ocgio.List_model.list_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_list_model) model in
        Raw.Slice_list_model.set_model obj model

    method set_offset : int -> unit =
      fun offset -> Raw.Slice_list_model.set_offset obj offset

    method set_size : int -> unit =
      fun size -> Raw.Slice_list_model.set_size obj size

    method item_type = Raw.Slice_list_model.get_item_type obj
    method n_items = Raw.Slice_list_model.get_n_items obj
    method as_slice_list_model = obj
  end

let new_ (model : Ocgio.List_model.list_model_t option) (offset : int)
    (size : int) : slice_list_model_t =
  let model = Option.map (fun c -> c#as_list_model) model in
  let obj_ = Raw.Slice_list_model.new_ model offset size in
  new slice_list_model obj_

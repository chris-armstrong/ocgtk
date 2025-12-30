(* GENERATED CODE - DO NOT EDIT *)
(* ListModel: ListModel *)

type t = [`list_model] Gobject.obj

(* Methods *)
(** Emits the #GListModel::items-changed signal on @list.

This function should only be called by classes implementing
#GListModel. It has to be called after the internal representation
of @list has been updated, because handlers connected to this signal
might query the new state of the list.

Implementations must only make changes to the model (as visible to
its consumer) in places that will not cause problems for that
consumer.  For models that are driven directly by a write API (such
as #GListStore), changes can be reported in response to uses of that
API.  For models that represent remote data, changes should only be
made from a fresh mainloop dispatch.  It is particularly not
permitted to make changes in response to a call to the #GListModel
consumer API.

Stated another way: in general, it is assumed that code making a
series of accesses to the model via the API, without returning to the
mainloop, and without calling other code, will continue to view the
same contents of the model. *)
external items_changed : t -> int -> int -> int -> unit = "ml_g_list_model_items_changed"

(** Gets the number of items in @list.

Depending on the model implementation, calling this function may be
less efficient than iterating the list with increasing values for
@position until g_list_model_get_item() returns %NULL. *)
external get_n_items : t -> int = "ml_g_list_model_get_n_items"


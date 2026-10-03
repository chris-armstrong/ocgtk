(* GENERATED CODE - DO NOT EDIT *)
(* ListModel: ListModel *)

(** [GListModel] is an interface that represents a mutable list of
    [GObject.Object]. Its main intention is as a model for various widgets in
    user interfaces, such as list views, but it can also be used as a convenient
    method of returning lists of data, with support for updates.

    Each object in the list may also report changes in itself via some mechanism
    (normally the [GObject.Object::notify] signal). Taken together with the
    [Gio.ListModel::items-changed] signal, this provides for a list that can
    change its membership, and in which the members can change their individual
    properties.

    A good example would be the list of visible wireless network access points,
    where each access point can report dynamic properties such as signal
    strength.

    It is important to note that the [GListModel] itself does not report changes
    to the individual items. It only reports changes to the list membership. If
    you want to observe changes to the objects themselves then you need to
    connect signals to the objects that you are interested in.

    All items in a [GListModel] are of (or derived from) the same type.
    [Gio.ListModel.get_item_type] returns that type. The type may be an
    interface, in which case all objects in the list must implement it.

    The semantics are close to that of an array: [Gio.ListModel.get_n_items]
    returns the number of items in the list and [Gio.ListModel.get_item] returns
    an item at a (0-based) position. In order to allow implementations to
    calculate the list length lazily, you can also iterate over items: starting
    from 0, repeatedly call [Gio.ListModel.get_item] until it returns [NULL].

    An implementation may create objects lazily, but must take care to return
    the same object for a given position until all references to it are gone.

    On the other side, a consumer is expected only to hold references on objects
    that are currently ‘user visible’, in order to facilitate the maximum level
    of laziness in the implementation of the list and to reduce the required
    number of signal connections at a given time.

    This interface is intended only to be used from a single thread. The thread
    in which it is appropriate to use it depends on the particular
    implementation, but typically it will be from the thread that owns the
    thread-default main context (see [GLib.MainContext.push_thread_default]) in
    effect at the time that the model was created.

    Over time, it has established itself as good practice for list model
    implementations to provide properties [item-type] and [n-items] to ease
    working with them. While it is not required, it is recommended that
    implementations provide these two properties. They should return the values
    of [Gio.ListModel.get_item_type] and [Gio.ListModel.get_n_items]
    respectively and be defined as such:

    {[
    properties[PROP_ITEM_TYPE] =
      g_param_spec_gtype (“item-type”, NULL, NULL, G_TYPE_OBJECT,
                          G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
    properties[PROP_N_ITEMS] =
      g_param_spec_uint (“n-items”, NULL, NULL, 0, G_MAXUINT, 0,
                         G_PARAM_READABLE | G_PARAM_STATIC_STRINGS);
    ]} *)

type t = [ `list_model ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_list_model_from_gobject"

(* Methods *)

external items_changed : t -> int -> int -> int -> unit
  = "ml_g_list_model_items_changed"
(** Emits the [GListModel::items]-changed signal on [list].

    This function should only be called by classes implementing [GListModel]. It
    has to be called after the internal representation of [list] has been
    updated, because handlers connected to this signal might query the new state
    of the list.

    Implementations must only make changes to the model (as visible to its
    consumer) in places that will not cause problems for that consumer. For
    models that are driven directly by a write API (such as [GListStore]),
    changes can be reported in response to uses of that API. For models that
    represent remote data, changes should only be made from a fresh mainloop
    dispatch. It is particularly not permitted to make changes in response to a
    call to the [GListModel] consumer API.

    Stated another way: in general, it is assumed that code making a series of
    accesses to the model via the API, without returning to the mainloop, and
    without calling other code, will continue to view the same contents of the
    model. *)

external get_object : t -> int -> [ `object_ ] Gobject.obj option
  = "ml_g_list_model_get_object"
(** Get the item at [position].

    If [position] is greater than the number of items in [list], [NULL] is
    returned.

    [NULL] is never returned for an index that is smaller than the length of the
    list.

    This function is meant to be used by language bindings in place of
    g_list_model_get_item().

    See also: g_list_model_get_n_items() *)

external get_n_items : t -> int = "ml_g_list_model_get_n_items"
(** Gets the number of items in [list].

    Depending on the model implementation, calling this function may be less
    efficient than iterating the list with increasing values for [position]
    until g_list_model_get_item() returns [NULL]. *)

external get_item_type : t -> Gobject.Type.t = "ml_g_list_model_get_item_type"
(** Gets the type of the items in [list].

    All items returned from g_list_model_get_item() are of the type returned by
    this function, or a subtype, or if the type is an interface, they are an
    implementation of that interface.

    The item type of a [GListModel] can not change during the life of the model.
*)

let on_items_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let position =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_uint v
        in
        let removed =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_uint v
        in
        let added =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Gobject.Value.get_uint v
        in
        callback ~position ~removed ~added)
  in
  Gobject.Signal.connect obj ~name:"items-changed" ~callback:closure
    ~after:(Option.value after ~default:false)

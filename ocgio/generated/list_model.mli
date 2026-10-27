[@@@ocaml.text
"[GListModel] is an interface that represents a mutable list of\n\
 [GObject.Object]. Its main intention is as a model for various widgets\n\
 in user interfaces, such as list views, but it can also be used as a\n\
 convenient method of returning lists of data, with support for\n\
 updates.\n\n\
 Each object in the list may also report changes in itself via some\n\
 mechanism (normally the [GObject.Object::notify] signal).  Taken\n\
 together with the [Gio.ListModel::items-changed] signal, this provides\n\
 for a list that can change its membership, and in which the members can\n\
 change their individual properties.\n\n\
 A good example would be the list of visible wireless network access\n\
 points, where each access point can report dynamic properties such as\n\
 signal strength.\n\n\
 It is important to note that the [GListModel] itself does not report\n\
 changes to the individual items.  It only reports changes to the list\n\
 membership.  If you want to observe changes to the objects themselves\n\
 then you need to connect signals to the objects that you are\n\
 interested in.\n\n\
 All items in a [GListModel] are of (or derived from) the same type.\n\
 [Gio.ListModel.get_item_type] returns that type.  The type may be an\n\
 interface, in which case all objects in the list must implement it.\n\n\
 The semantics are close to that of an array:\n\
 [Gio.ListModel.get_n_items] returns the number of items in the list\n\
 and [Gio.ListModel.get_item] returns an item at a (0-based) position.\n\
 In order to allow implementations to calculate the list length lazily,\n\
 you can also iterate over items: starting from 0, repeatedly call\n\
 [Gio.ListModel.get_item] until it returns [NULL].\n\n\
 An implementation may create objects lazily, but must take care to\n\
 return the same object for a given position until all references to\n\
 it are gone.\n\n\
 On the other side, a consumer is expected only to hold references on\n\
 objects that are currently ‘user visible’, in order to facilitate the\n\
 maximum level of laziness in the implementation of the list and to\n\
 reduce the required number of signal connections at a given time.\n\n\
 This interface is intended only to be used from a single thread.  The\n\
 thread in which it is appropriate to use it depends on the particular\n\
 implementation, but typically it will be from the thread that owns\n\
 the thread-default main context (see\n\
 [GLib.MainContext.push_thread_default]) in effect at the time that the\n\
 model was created.\n\n\
 Over time, it has established itself as good practice for list model\n\
 implementations to provide properties [item-type] and [n-items] to\n\
 ease working with them. While it is not required, it is recommended\n\
 that implementations provide these two properties. They should return\n\
 the values of [Gio.ListModel.get_item_type] and\n\
 [Gio.ListModel.get_n_items] respectively and be defined as such:\n\n\
 {[\n\
 properties[PROP_ITEM_TYPE] =\n\
\  g_param_spec_gtype (\"item-type\", NULL, NULL, G_TYPE_OBJECT,\n\
\                      G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE | \
 G_PARAM_STATIC_STRINGS);\n\
 properties[PROP_N_ITEMS] =\n\
\  g_param_spec_uint (\"n-items\", NULL, NULL, 0, G_MAXUINT, 0,\n\
\                     G_PARAM_READABLE | G_PARAM_STATIC_STRINGS);\n\
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-list_model_t}. The \
 functions it is built on are in {!Ocgio.Raw.List_model}."]

(** The methods, signals and properties of a [GListModel]. *)
class type list_model_t = object
  method on_items_changed :
    ?after:bool ->
    callback:(position:int -> removed:int -> added:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_item_type : unit -> Gobject.Type.t
  method get_n_items : unit -> int
  method get_object : int -> [ `object_ ] Gobject.obj option
  method items_changed : int -> int -> int -> unit
  method as_list_model : Raw.List_model.t
end

class list_model : Raw.List_model.t -> list_model_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.List_model.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GListModel], give one already wrapped. *)

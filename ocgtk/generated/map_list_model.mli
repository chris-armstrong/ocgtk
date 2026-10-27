(** A list model that maps the items in another model to different items.

    [GtkMapListModel] uses a [Gtk.MapListModelMapFunc].

    Example: Create a list of [GtkEventControllers]

    {[
    static gpointer
    map_to_controllers (gpointer widget,
                        gpointer data)
    {
      gpointer result = gtk_widget_observe_controllers (widget);
      g_object_unref (widget);
      return result;
    }

    widgets = gtk_widget_observe_children (widget);

    controllers = gtk_map_list_model_new (widgets,
                                          map_to_controllers,
                                          NULL, NULL);

    model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
                                        controllers);
    ]}

    [GtkMapListModel] will attempt to discard the mapped objects as soon as they
    are no longer needed and recreate them if necessary.

    [GtkMapListModel] passes through sections from the underlying model.

    Its methods, signals and properties are on {!class-type-map_list_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Map_list_model}. *)

(** The methods, signals and properties of a [GtkMapListModel]. *)
class type map_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method has_map : unit -> bool
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_map_list_model : Raw.Map_list_model.t
end

class map_list_model : Raw.Map_list_model.t -> map_list_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Map_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkMapListModel], give one already wrapped. *)

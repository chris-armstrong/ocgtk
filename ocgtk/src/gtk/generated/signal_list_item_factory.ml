(* GENERATED CODE - DO NOT EDIT *)
(* SignalListItemFactory: SignalListItemFactory *)

type t =
  [ `signal_list_item_factory | `list_item_factory | `object_ ] Gobject.obj
(** Emits signals to manage listitems.

    Signals are emitted for every listitem in the same order:

    + [Gtk.SignalListItemFactory::setup] is emitted to set up permanent things
      on the listitem. This usually means constructing the widgets used in the
      row and adding them to the listitem.

    + [Gtk.SignalListItemFactory::bind] is emitted to bind the item passed via
      [Gtk.ListItem:item] to the widgets that have been created in step 1 or to
      add item-specific widgets. Signals are connected to listen to changes -
      both to changes in the item to update the widgets or to changes in the
      widgets to update the item. After this signal has been called, the
      listitem may be shown in a list widget.

    + [Gtk.SignalListItemFactory::unbind] is emitted to undo everything done in
      step 2. Usually this means disconnecting signal handlers. Once this signal
      has been called, the listitem will no longer be used in a list widget.

    + [Gtk.SignalListItemFactory::bind] and [Gtk.SignalListItemFactory::unbind]
      may be emitted multiple times again to bind the listitem for use with new
      items. By reusing listitems, potentially costly setup can be avoided.
      However, it means code needs to make sure to properly clean up the
      listitem in step 3 so that no information from the previous use leaks into
      the next one.

    + [Gtk.SignalListItemFactory::teardown] is emitted to allow undoing the
      effects of [Gtk.SignalListItemFactory::setup]. After this signal was
      emitted on a listitem, the listitem will be destroyed and not be used
      again.

    Note that during the signal emissions, changing properties on the listitems
    passed will not trigger notify signals as the listitem's notifications are
    frozen. See [GObject.Object.freeze_notify] for details.

    For tracking changes in other properties in the listitem, the ::notify
    signal is recommended. The signal can be connected in the
    [Gtk.SignalListItemFactory::setup] signal and removed again during
    [Gtk.SignalListItemFactory::teardown]. *)

external new_ : unit -> t = "ml_gtk_signal_list_item_factory_new"
(** Create a new SignalListItemFactory *)

(* Methods *)

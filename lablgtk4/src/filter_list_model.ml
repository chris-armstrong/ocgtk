(* GENERATED CODE - DO NOT EDIT *)
(* FilterListModel: FilterListModel *)

type t = [`filter_list_model | `object_] Gobject.obj

(** Create a new FilterListModel *)
external new_ : unit -> Filter.t option -> t = "ml_gtk_filter_list_model_new"

(* Properties *)

(** Sets the filter model to do an incremental sort.

When incremental filtering is enabled, the `GtkFilterListModel` will not
run filters immediately, but will instead queue an idle handler that
incrementally filters the items and adds them to the list. This of course
means that items are not instantly added to the list, but only appear
incrementally.

When your filter blocks the UI while filtering, you might consider
turning this on. Depending on your model and filters, this may become
interesting around 10,000 to 100,000 items.

By default, incremental filtering is disabled.

See [method@Gtk.FilterListModel.get_pending] for progress information
about an ongoing incremental filtering operation. *)
external set_incremental : t -> bool -> unit = "ml_gtk_filter_list_model_set_incremental"

(** Sets the filter used to filter items. *)
external set_filter : t -> Filter.t option -> unit = "ml_gtk_filter_list_model_set_filter"

(** Returns the number of items that have not been filtered yet.

You can use this value to check if @self is busy filtering by
comparing the return value to 0 or you can compute the percentage
of the filter remaining by dividing the return value by the total
number of items in the underlying model:

```c
pending = gtk_filter_list_model_get_pending (self);
model = gtk_filter_list_model_get_model (self);
percentage = pending / (double) g_list_model_get_n_items (model);
```

If no filter operation is ongoing - in particular when
[property@Gtk.FilterListModel:incremental] is %FALSE - this
function returns 0. *)
external get_pending : t -> int = "ml_gtk_filter_list_model_get_pending"

(** Returns whether incremental filtering is enabled.

See [method@Gtk.FilterListModel.set_incremental]. *)
external get_incremental : t -> bool = "ml_gtk_filter_list_model_get_incremental"

(** Gets the `GtkFilter` currently set on @self. *)
external get_filter : t -> Filter.t option = "ml_gtk_filter_list_model_get_filter"


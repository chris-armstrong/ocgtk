(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SortListModel *)

type t = Gtk.widget

(** Create a new SortListModel *)
external new_ : unit -> Gtk.widget option -> t = "ml_gtk_sort_list_model_new"

(* Properties *)

(** Sets a new sorter on @self. *)
external set_sorter : t -> Gtk.widget option -> unit = "ml_gtk_sort_list_model_set_sorter"

(** Sets a new section sorter on @self. *)
external set_section_sorter : t -> Gtk.widget option -> unit = "ml_gtk_sort_list_model_set_section_sorter"

(** Sets the sort model to do an incremental sort.

When incremental sorting is enabled, the `GtkSortListModel` will not do
a complete sort immediately, but will instead queue an idle handler that
incrementally sorts the items towards their correct position. This of
course means that items do not instantly appear in the right place. It
also means that the total sorting time is a lot slower.

When your filter blocks the UI while sorting, you might consider
turning this on. Depending on your model and sorters, this may become
interesting around 10,000 to 100,000 items.

By default, incremental sorting is disabled.

See [method@Gtk.SortListModel.get_pending] for progress information
about an ongoing incremental sorting operation. *)
external set_incremental : t -> bool -> unit = "ml_gtk_sort_list_model_set_incremental"

(** Gets the sorter that is used to sort @self. *)
external get_sorter : t -> Gtk.widget = "ml_gtk_sort_list_model_get_sorter"

(** Gets the section sorter that is used to sort items of @self into
sections. *)
external get_section_sorter : t -> Gtk.widget = "ml_gtk_sort_list_model_get_section_sorter"

(** Estimates progress of an ongoing sorting operation.

The estimate is the number of items that would still need to be
sorted to finish the sorting operation if this was a linear
algorithm. So this number is not related to how many items are
already correctly sorted.

If you want to estimate the progress, you can use code like this:
```c
pending = gtk_sort_list_model_get_pending (self);
model = gtk_sort_list_model_get_model (self);
progress = 1.0 - pending / (double) MAX (1, g_list_model_get_n_items (model));
```

If no sort operation is ongoing - in particular when
[property@Gtk.SortListModel:incremental] is %FALSE - this
function returns 0. *)
external get_pending : t -> int = "ml_gtk_sort_list_model_get_pending"

(** Returns whether incremental sorting is enabled.

See [method@Gtk.SortListModel.set_incremental]. *)
external get_incremental : t -> bool = "ml_gtk_sort_list_model_get_incremental"


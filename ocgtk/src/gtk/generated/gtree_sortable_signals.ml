(* Signal handlers for TreeSortable *)
class tree_sortable_signals (obj : Tree_sortable.t) =
  object
    method on_sort_column_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"sort-column-changed" ~callback
        ~after:false
    (** The ::sort-column-changed signal is emitted when the sort column
or sort order of @sortable is changed. The signal is emitted before
the contents of @sortable are resorted. *)
  end

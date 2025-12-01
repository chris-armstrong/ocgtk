(* Signal handlers for TreeSortable *)
class tree_sortable_signals (obj : Tree_sortable.t) = object
  (** The ::sort-column-changed signal is emitted when the sort column
or sort order of @sortable is changed. The signal is emitted before
the contents of @sortable are resorted. *)
  method sort_column_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"sort-column-changed" ~callback ~after:false

end

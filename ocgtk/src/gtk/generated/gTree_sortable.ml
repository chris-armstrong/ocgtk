class type tree_sortable_t = object
  method on_sort_column_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method has_default_sort_func : unit -> bool
  method set_sort_column_id : int -> Gtk_enums.sorttype -> unit
  method sort_column_changed : unit -> unit
  method as_tree_sortable : Tree_sortable.t
end

(* High-level class for TreeSortable *)
class tree_sortable (obj : Tree_sortable.t) : tree_sortable_t =
  object (self)
    method on_sort_column_changed ~callback =
      Tree_sortable.on_sort_column_changed self#as_tree_sortable ~callback

    method has_default_sort_func : unit -> bool =
      fun () -> Tree_sortable.has_default_sort_func obj

    method set_sort_column_id : int -> Gtk_enums.sorttype -> unit =
      fun sort_column_id order ->
        Tree_sortable.set_sort_column_id obj sort_column_id order

    method sort_column_changed : unit -> unit =
      fun () -> Tree_sortable.sort_column_changed obj

    method as_tree_sortable = obj
  end

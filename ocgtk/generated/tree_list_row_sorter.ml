class type tree_list_row_sorter_t = object
  inherit Sorter.sorter_t

  (** {2:methods Methods} *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns the sorter used by [self]. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Sets the sorter to use for items with the same parent.

      This sorter will be passed the [Gtk.TreeListRow:item] of the tree list
      rows passed to [self]. *)

  (** {2:conversions Conversions} *)

  method as_tree_list_row_sorter : Raw.Tree_list_row_sorter.t
end

(* High-level class for TreeListRowSorter *)
class tree_list_row_sorter (obj : Raw.Tree_list_row_sorter.t) :
  tree_list_row_sorter_t =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Tree_list_row_sorter.get_sorter obj)

    method set_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Tree_list_row_sorter.set_sorter obj sorter

    method as_tree_list_row_sorter = obj
  end

let new_ (sorter : Sorter.sorter_t option) : tree_list_row_sorter_t =
  let sorter = Option.map (fun c -> c#as_sorter) sorter in
  let obj_ = Raw.Tree_list_row_sorter.new_ sorter in
  new tree_list_row_sorter obj_

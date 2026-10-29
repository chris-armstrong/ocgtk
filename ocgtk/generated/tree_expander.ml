class type tree_expander_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget displayed by [self]. *)

  method get_hide_expander : unit -> bool
  (** Gets whether the TreeExpander should be hidden in a GtkTreeListRow. *)

  method get_indent_for_depth : unit -> bool
  (** TreeExpander indents each level of depth with an additional indent. *)

  method get_indent_for_icon : unit -> bool
  (** TreeExpander indents the child by the width of an expander-icon if it is
      not expandable. *)

  method get_item : unit -> [ `object_ ] Gobject.obj option
  (** Forwards the item set on the [GtkTreeListRow] that [self] is managing.

      This call is essentially equivalent to calling:

      {[
      gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (@self));
      ]} *)

  method get_list_row : unit -> Tree_list_row.tree_list_row_t option
  (** Gets the list row managed by [self]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the content widget to display. *)

  method set_hide_expander : bool -> unit
  (** Sets whether the expander icon should be visible in a GtkTreeListRow. *)

  method set_indent_for_depth : bool -> unit
  (** Sets if the TreeExpander should indent the child according to its depth.
  *)

  method set_indent_for_icon : bool -> unit
  (** Sets if the TreeExpander should indent the child by the width of an
      expander-icon when it is not expandable. *)

  method set_list_row : Tree_list_row.tree_list_row_t option -> unit
  (** Sets the tree list row that this expander should manage. *)

  (** {2:conversions Conversions} *)

  method as_tree_expander : Raw.Tree_expander.t
end

(* High-level class for TreeExpander *)
class tree_expander (obj : Raw.Tree_expander.t) : tree_expander_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Tree_expander.get_child obj)

    method get_hide_expander : unit -> bool =
      fun () -> Raw.Tree_expander.get_hide_expander obj

    method get_indent_for_depth : unit -> bool =
      fun () -> Raw.Tree_expander.get_indent_for_depth obj

    method get_indent_for_icon : unit -> bool =
      fun () -> Raw.Tree_expander.get_indent_for_icon obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Tree_expander.get_item obj

    method get_list_row : unit -> Tree_list_row.tree_list_row_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_list_row.tree_list_row ret)
          (Raw.Tree_expander.get_list_row obj)

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Tree_expander.set_child obj child

    method set_hide_expander : bool -> unit =
      fun hide_expander -> Raw.Tree_expander.set_hide_expander obj hide_expander

    method set_indent_for_depth : bool -> unit =
      fun indent_for_depth ->
        Raw.Tree_expander.set_indent_for_depth obj indent_for_depth

    method set_indent_for_icon : bool -> unit =
      fun indent_for_icon ->
        Raw.Tree_expander.set_indent_for_icon obj indent_for_icon

    method set_list_row : Tree_list_row.tree_list_row_t option -> unit =
      fun list_row ->
        let list_row = Option.map (fun c -> c#as_tree_list_row) list_row in
        Raw.Tree_expander.set_list_row obj list_row

    method as_tree_expander = obj
  end

let new_ () : tree_expander_t = new tree_expander (Raw.Tree_expander.new_ ())

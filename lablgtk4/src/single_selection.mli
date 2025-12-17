(* GENERATED CODE - DO NOT EDIT *)
(* SingleSelection: SingleSelection *)

type t = [`single_selection | `object_] Gobject.obj

(** Create a new SingleSelection *)
external new_ : unit -> t = "ml_gtk_single_selection_new"

(* Properties *)

(** Selects the item at the given position.

If the list does not have an item at @position or
%GTK_INVALID_LIST_POSITION is given, the behavior depends on the
value of the [property@Gtk.SingleSelection:autoselect] property:
If it is set, no change will occur and the old item will stay
selected. If it is unset, the selection will be unset and no item
will be selected. *)
external set_selected : t -> int -> unit = "ml_gtk_single_selection_set_selected"

(** If %TRUE, unselecting the current item via
gtk_selection_model_unselect_item() is supported.

Note that setting [property@Gtk.SingleSelection:autoselect] will
cause unselecting to not work, so it practically makes no sense
to set both at the same time the same time. *)
external set_can_unselect : t -> bool -> unit = "ml_gtk_single_selection_set_can_unselect"

(** Enables or disables autoselect.

If @autoselect is %TRUE, @self will enforce that an item is always
selected. It will select a new item when the currently selected
item is deleted and it will disallow unselecting the current item. *)
external set_autoselect : t -> bool -> unit = "ml_gtk_single_selection_set_autoselect"

(** Gets the position of the selected item.

If no item is selected, %GTK_INVALID_LIST_POSITION is returned. *)
external get_selected : t -> int = "ml_gtk_single_selection_get_selected"

(** If %TRUE, gtk_selection_model_unselect_item() is supported and allows
unselecting the selected item. *)
external get_can_unselect : t -> bool = "ml_gtk_single_selection_get_can_unselect"

(** Checks if autoselect has been enabled or disabled via
gtk_single_selection_set_autoselect(). *)
external get_autoselect : t -> bool = "ml_gtk_single_selection_get_autoselect"


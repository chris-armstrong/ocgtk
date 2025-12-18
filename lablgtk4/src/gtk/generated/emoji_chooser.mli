(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EmojiChooser *)

type t = [`emoji_chooser | `popover | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new EmojiChooser *)
external new_ : unit -> t = "ml_gtk_emoji_chooser_new"


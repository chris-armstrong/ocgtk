(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontButton *)

type t = [`font_button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new FontButton *)
external new_ : unit -> t = "ml_gtk_font_button_new"

(** Create a new FontButton *)
external new_with_font : string -> t = "ml_gtk_font_button_new_with_font"

(* Methods *)
(** If @use_size is %TRUE, the font name will be written using
the selected size. *)
external set_use_size : t -> bool -> unit = "ml_gtk_font_button_set_use_size"

(** If @use_font is %TRUE, the font name will be written
using the selected font. *)
external set_use_font : t -> bool -> unit = "ml_gtk_font_button_set_use_font"

(** Sets the title for the font chooser dialog. *)
external set_title : t -> string -> unit = "ml_gtk_font_button_set_title"

(** Sets whether the dialog should be modal. *)
external set_modal : t -> bool -> unit = "ml_gtk_font_button_set_modal"

(** Returns whether the selected size is used in the label. *)
external get_use_size : t -> bool = "ml_gtk_font_button_get_use_size"

(** Returns whether the selected font is used in the label. *)
external get_use_font : t -> bool = "ml_gtk_font_button_get_use_font"

(** Retrieves the title of the font chooser dialog. *)
external get_title : t -> string = "ml_gtk_font_button_get_title"

(** Gets whether the dialog is modal. *)
external get_modal : t -> bool = "ml_gtk_font_button_get_modal"

(* Properties *)


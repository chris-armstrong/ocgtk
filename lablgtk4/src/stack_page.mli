(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StackPage *)

type t = Gtk.widget

(* Properties *)

(** Sets whether @page is visible in its `GtkStack`. *)
external set_visible : t -> bool -> unit = "ml_gtk_stack_page_set_visible"

(** Sets whether underlines in the page title indicate mnemonics. *)
external set_use_underline : t -> bool -> unit = "ml_gtk_stack_page_set_use_underline"

(** Sets the page title. *)
external set_title : t -> string -> unit = "ml_gtk_stack_page_set_title"

(** Sets whether the page is marked as “needs attention”. *)
external set_needs_attention : t -> bool -> unit = "ml_gtk_stack_page_set_needs_attention"

(** Sets the name of the page. *)
external set_name : t -> string -> unit = "ml_gtk_stack_page_set_name"

(** Sets the icon name of the page. *)
external set_icon_name : t -> string -> unit = "ml_gtk_stack_page_set_icon_name"

(** Returns whether @page is visible in its `GtkStack`.

This is independent from the [property@Gtk.Widget:visible]
property of its widget. *)
external get_visible : t -> bool = "ml_gtk_stack_page_get_visible"

(** Gets whether underlines in the page title indicate mnemonics. *)
external get_use_underline : t -> bool = "ml_gtk_stack_page_get_use_underline"

(** Gets the page title. *)
external get_title : t -> string option = "ml_gtk_stack_page_get_title"

(** Returns whether the page is marked as “needs attention”. *)
external get_needs_attention : t -> bool = "ml_gtk_stack_page_get_needs_attention"

(** Returns the name of the page. *)
external get_name : t -> string option = "ml_gtk_stack_page_get_name"

(** Returns the icon name of the page. *)
external get_icon_name : t -> string option = "ml_gtk_stack_page_get_icon_name"

(** Returns the stack child to which @self belongs. *)
external get_child : t -> Gtk.widget = "ml_gtk_stack_page_get_child"


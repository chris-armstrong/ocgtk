(* GENERATED CODE - DO NOT EDIT *)
(* PrintContext: PrintContext *)

type t = [`print_context | `object_] Gobject.obj

(** Obtains the width of the `GtkPrintContext`, in pixels. *)
external get_width : t -> float = "ml_gtk_print_context_get_width"

(** Obtains the height of the `GtkPrintContext`, in pixels. *)
external get_height : t -> float = "ml_gtk_print_context_get_height"

(** Obtains the vertical resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_y : t -> float = "ml_gtk_print_context_get_dpi_y"

(** Obtains the horizontal resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_x : t -> float = "ml_gtk_print_context_get_dpi_x"


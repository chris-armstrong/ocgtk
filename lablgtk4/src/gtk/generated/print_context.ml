(* GENERATED CODE - DO NOT EDIT *)
(* PrintContext: PrintContext *)

type t = [`print_context | `object_] Gobject.obj

(* Methods *)
(** Obtains the width of the `GtkPrintContext`, in pixels. *)
external get_width : t -> float = "ml_gtk_print_context_get_width"

(** Obtains the height of the `GtkPrintContext`, in pixels. *)
external get_height : t -> float = "ml_gtk_print_context_get_height"

(** Obtains the hardware printer margins of the `GtkPrintContext`,
in units. *)
external get_hard_margins : t -> bool * float * float * float * float = "ml_gtk_print_context_get_hard_margins"

(** Obtains the vertical resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_y : t -> float = "ml_gtk_print_context_get_dpi_y"

(** Obtains the horizontal resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_x : t -> float = "ml_gtk_print_context_get_dpi_x"


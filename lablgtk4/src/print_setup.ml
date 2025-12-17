(* GENERATED CODE - DO NOT EDIT *)
(* PrintSetup: PrintSetup *)

(** A `GtkPrintSetup` is an auxiliary object for printing that allows decoupling
the setup from the printing.

A print setup is obtained by calling [method@Gtk.PrintDialog.setup],
and can later be passed to print functions such as [method@Gtk.PrintDialog.print].

Print setups can be reused for multiple print calls.

Applications may wish to store the page_setup and print_settings from the print setup
and copy them to the PrintDialog if they want to keep using them. *)
type t = [`print_setup] Gobject.obj

(** Decrease the reference count of @setup.

If the reference count reaches zero,
the object is freed. *)
external unref : t -> unit = "ml_gtk_print_setup_unref"

(** Increase the reference count of @setup. *)
external ref : t -> t = "ml_gtk_print_setup_ref"


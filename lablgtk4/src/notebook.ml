(* GTK4 Notebook Container - Manually Created *)

type t = [`notebook | `widget] Gobject.obj

(** {2 External C bindings} *)

external create : unit -> t = "ml_gtk_notebook_new"
external append_page_impl : t -> Gtk.widget -> Gtk.widget option -> int = "ml_gtk_notebook_append_page"
external prepend_page_impl : t -> Gtk.widget -> Gtk.widget option -> int = "ml_gtk_notebook_prepend_page"
external insert_page_impl : t -> Gtk.widget -> Gtk.widget option -> int -> int = "ml_gtk_notebook_insert_page"
external remove_page_impl : t -> int -> unit = "ml_gtk_notebook_remove_page"
let remove_page t ~page = remove_page_impl t page
external detach_tab_impl : t -> Gtk.widget -> unit = "ml_gtk_notebook_detach_tab"
let detach_tab t ~child = detach_tab_impl t child
external get_current_page : t -> int = "ml_gtk_notebook_get_current_page"
external set_current_page : t -> int -> unit = "ml_gtk_notebook_set_current_page"
external next_page : t -> unit = "ml_gtk_notebook_next_page"
external prev_page : t -> unit = "ml_gtk_notebook_prev_page"
external get_nth_page : t -> int -> Gtk.widget option = "ml_gtk_notebook_get_nth_page"
external get_n_pages : t -> int = "ml_gtk_notebook_get_n_pages"
external page_num : t -> Gtk.widget -> int = "ml_gtk_notebook_page_num"
external set_show_tabs : t -> bool -> unit = "ml_gtk_notebook_set_show_tabs"
external get_show_tabs : t -> bool = "ml_gtk_notebook_get_show_tabs"
external set_show_border : t -> bool -> unit = "ml_gtk_notebook_set_show_border"
external get_show_border : t -> bool = "ml_gtk_notebook_get_show_border"
external set_scrollable : t -> bool -> unit = "ml_gtk_notebook_set_scrollable"
external get_scrollable : t -> bool = "ml_gtk_notebook_get_scrollable"

(** {2 Wrapped functions} *)

let append_page notebook ~child ?tab_label () =
  append_page_impl notebook child tab_label

let prepend_page notebook ~child ?tab_label () =
  prepend_page_impl notebook child tab_label

let insert_page notebook ~child ?tab_label ~position () =
  insert_page_impl notebook child tab_label position

let as_widget (notebook : t) : Gtk.widget = Obj.magic notebook

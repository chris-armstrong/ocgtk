open Ocgtk_gtk.Gtk
open Ocgtk_gio.Gio

let activate app =
  let window = Window.new_ () in
  window#set_title (Some "OCaml GTK4 Calculator");
  window#set_default_size 400 500;
  window#set_resizable false;

  (* Keep the application alive while the window is open *)
  app#hold ();
  ignore
    (window#on_close_request
       ~callback:(fun () ->
         app#release ();
         false)
       ());

  ignore (Calc_ui.build window);
  window#present ()

let () =
  ignore (Ocgtk_gtk.GMain.init ());
  let app = Application.new_ (Some "org.ocgtk.Calculator") [ `DEFAULT_FLAGS ] in
  ignore (app#on_activate ~callback:(fun () -> activate app) ());
  let status = app#run 0 None in
  exit status

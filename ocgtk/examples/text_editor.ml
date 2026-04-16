open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Simple Text Editor
   Demonstrates: TextView, TextBuffer, Entry, ScrolledWindow, Button *)

let on_close_request window_obj callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        callback ();
        Gobject.Value.set_boolean (Gobject.Closure.result argv) false)
  in
  ignore
    (Gobject.Signal.connect window_obj ~name:"close-request" ~callback:closure
       ~after:false)

let () =
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Wrappers.Window.new_ () in
  let window = new Window.window window_obj in
  window#set_title (Some "Simple Text Editor");
  window#set_default_size 600 400;
  on_close_request window_obj (fun () -> GMain.quit ());

  (* Create vertical box for layout *)
  let vbox = new Box.box (Wrappers.Box.new_ `VERTICAL 5) in
  window#set_child (Some (vbox :> Widget.widget_t));

  (* Create text buffer and view *)
  let buffer = new Text_buffer.text_buffer (Wrappers.Text_buffer.new_ None) in
  let text_view = new Text_view.text_view (Wrappers.Text_view.new_ ()) in
  text_view#set_buffer (Some (buffer :> Text_buffer.text_buffer_t));
  text_view#set_wrap_mode `WORD;

  (* Add scrolled window for text view *)
  let scrolled =
    new Scrolled_window.scrolled_window (Wrappers.Scrolled_window.new_ ())
  in
  scrolled#set_child (Some (text_view :> Widget.widget_t));
  vbox#append (scrolled :> Widget.widget_t);

  (* Insert some initial text *)
  buffer#insert_at_cursor "Welcome to the Simple Text Editor!\n\n" (-1);
  buffer#insert_at_cursor "Type your text here.\n" (-1);

  (* Entry for new text *)
  let entry_ = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry_#set_placeholder_text (Some "Type text to insert...");
  vbox#append (entry_ :> Widget.widget_t);

  (* Button row *)
  let button_box = new Box.box (Wrappers.Box.new_ `HORIZONTAL 5) in
  vbox#append (button_box :> Widget.widget_t);

  (* Insert text button *)
  let insert_btn =
    new Button.button (Wrappers.Button.new_with_label "Insert Text")
  in
  button_box#append (insert_btn :> Widget.widget_t);

  ignore
    (insert_btn#on_clicked ~callback:(fun () ->
         let entry_buffer = entry_#get_buffer () in
         let text = entry_buffer#get_text () in
         if text <> "" then begin
           buffer#insert_at_cursor (text ^ "\n") (-1);
           entry_buffer#set_text "" (-1)
         end));

  (* Clear button *)
  let clear_btn =
    new Button.button (Wrappers.Button.new_with_label "Clear All")
  in
  button_box#append (clear_btn :> Widget.widget_t);

  ignore (clear_btn#on_clicked ~callback:(fun () -> buffer#set_text "" (-1)));

  (* Status label - updates on buffer changes *)
  let status_label = new Label.label (Wrappers.Label.new_ None) in
  let update_status () =
    let char_count = buffer#get_char_count () in
    status_label#set_label (Printf.sprintf "Characters: %d" char_count)
  in
  update_status ();
  ignore (buffer#on_changed ~callback:update_status);
  vbox#append (status_label :> Widget.widget_t);

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()

open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Simple Text Editor
   Demonstrates: TextView, TextBuffer, Entry, ScrolledWindow, Button *)

let () =
  ignore (GMain.init ());

  (* Create main window *)
  let window = new window (Wrappers.Window.new_ ()) in
  window#set_title (Some "Simple Text Editor");
  window#set_default_size 600 400;

  (* Create vertical box for layout *)
  let vbox = new box (Wrappers.Box.new_ `VERTICAL 5) in
  window#set_child (Some (vbox :> widget));

  (* Create text buffer and view *)
  let buffer_obj = Wrappers.Text_buffer.new_ None in
  let buffer = new text_buffer buffer_obj in
  let text_view_obj = Wrappers.Text_view.new_ () in
  let text_view = new text_view text_view_obj in
  text_view#set_buffer (Some buffer);
  text_view#set_wrap_mode `WORD;

  (* Add scrolled window for text view *)
  let scrolled = new scrolled_window (Wrappers.Scrolled_window.new_ ()) in
  scrolled#set_child (Some (text_view :> widget));
  vbox#append (scrolled :> widget);

  (* Insert some initial text *)
  buffer#insert_at_cursor "Welcome to the Simple Text Editor!\n\n" (-1);
  buffer#insert_at_cursor "Type your text here.\n" (-1);

  (* Entry for new text *)
  let entry_obj = Wrappers.Entry.new_ () in
  let entry_ = new entry entry_obj in
  entry_#set_placeholder_text (Some "Type text to insert...");
  vbox#append (entry_ :> widget);

  (* Button row *)
  let button_box = new box (Wrappers.Box.new_ `HORIZONTAL 5) in
  vbox#append (button_box :> widget);

  (* Insert text button *)
  let insert_btn = new button (Wrappers.Button.new_with_label "Insert Text") in
  button_box#append (insert_btn :> widget);

  ignore
    (insert_btn#on_clicked ~callback:(fun () ->
         let entry_buffer = entry_#get_buffer () in
         let text = entry_buffer#get_text () in
         if text <> "" then begin
           buffer#insert_at_cursor (text ^ "\n") (-1);
           entry_buffer#set_text "" (-1)
         end));

  (* Clear button *)
  let clear_btn = new button (Wrappers.Button.new_with_label "Clear All") in
  button_box#append (clear_btn :> widget);

  ignore
    (clear_btn#on_clicked ~callback:(fun () ->
         buffer#set_text "" (-1)));

  (* Status label *)
  let status_label_obj = Wrappers.Label.new_ None in
  let status_label = new label status_label_obj in
  let update_status () =
    let char_count = buffer#get_char_count () in
    status_label#set_label (Printf.sprintf "Characters: %d" char_count)
  in
  update_status ();
  vbox#append (status_label :> widget);

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()

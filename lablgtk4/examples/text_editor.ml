(* Simple Text Editor
   Demonstrates: TextView, TextBuffer, TextTag, Entry, Button *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window = GWindow.window ~title:"Simple Text Editor" ~width:600 ~height:400 () in

  (* Create vertical box for layout *)
  let vbox = GBox.vbox ~spacing:5 () in
  window#add (vbox :> GObj.widget);

  (* Create text buffer and view *)
  let buffer = Text_buffer.new_ None in
  let text_view = Text_view.new_ () in
  Text_view.set_buffer text_view (Some buffer);
  Text_view.set_wrap_mode text_view `WORD;

  (* Add scrolled window for text view *)
  let scrolled = GScrolledWindow.scrolled_window () in
  scrolled#add (GObj.widget_of_obj (text_view));
  vbox#append (scrolled :> GObj.widget);

  (* Insert some initial text *)
  Text_buffer.insert_at_cursor buffer "Welcome to the Simple Text Editor!\n\n" (-1);
  Text_buffer.insert_at_cursor buffer "Type your text here.\n" (-1);

  (* Entry for new text *)
  let entry = Entry.new_ () in
  Entry.set_placeholder_text entry (Some "Type text to insert...");
  vbox#append (GObj.widget_of_obj (entry));

  (* Button row *)
  let button_box = GBox.hbox ~spacing:5 () in
  vbox#append (button_box :> GObj.widget);

  (* Insert text button *)
  let insert_btn = GButton.button ~label:"Insert Text" () in
  button_box#append (insert_btn :> GObj.widget);

  ignore (insert_btn#connect#clicked ~callback:(fun () ->
    let text = Entry.get_text entry in
    if text <> "" then begin
      Text_buffer.insert_at_cursor buffer (text ^ "\n") (-1);
      Entry.set_text entry ""
    end
  ));

  (* Clear button *)
  let clear_btn = GButton.button ~label:"Clear All" () in
  button_box#append (clear_btn :> GObj.widget);

  ignore (clear_btn#connect#clicked ~callback:(fun () ->
    Text_buffer.set_text buffer "" (-1)
  ));

  (* Status label *)
  let status_label = Label.new_ None in
  let update_status () =
    let char_count = Text_buffer.get_char_count buffer in
    Label.set_label status_label
      (Printf.sprintf "Characters: %d" char_count)
  in
  update_status ();
  vbox#append (GObj.widget_of_obj (status_label));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()

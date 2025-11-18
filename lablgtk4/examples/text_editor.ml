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
  let buffer = GtkTextBuffer.new_ () in
  let text_view = GtkTextView.new_ () in
  GtkTextView.set_buffer text_view buffer;
  GtkTextView.set_wrap_mode text_view 2; (* GTK_WRAP_WORD *)

  (* Add scrolled window for text view *)
  let scrolled = GScrolledWindow.scrolled_window () in
  scrolled#add (GObj.widget_of_obj text_view);
  vbox#append (scrolled :> GObj.widget);

  (* Insert some initial text *)
  GtkTextBuffer.insert_at_cursor buffer "Welcome to the Simple Text Editor!\n\n" (-1);
  GtkTextBuffer.insert_at_cursor buffer "Type your text here.\n" (-1);

  (* Entry for new text *)
  let entry = GtkEntry.new_ () in
  GtkEntry.set_placeholder_text entry (Some "Type text to insert...");
  vbox#append (GObj.widget_of_obj entry);

  (* Button row *)
  let button_box = GBox.hbox ~spacing:5 () in
  vbox#append (button_box :> GObj.widget);

  (* Insert text button *)
  let insert_btn = GButton.button ~label:"Insert Text" () in
  button_box#append (insert_btn :> GObj.widget);

  ignore (insert_btn#connect#clicked ~callback:(fun () ->
    let text = GtkEntry.get_text entry in
    if text <> "" then begin
      GtkTextBuffer.insert_at_cursor buffer (text ^ "\n") (-1);
      GtkEntry.set_text entry ""
    end
  ));

  (* Clear button *)
  let clear_btn = GButton.button ~label:"Clear All" () in
  button_box#append (clear_btn :> GObj.widget);

  ignore (clear_btn#connect#clicked ~callback:(fun () ->
    GtkTextBuffer.set_text buffer "" (-1)
  ));

  (* Status label *)
  let status_label = GtkLabel.new_ () in
  let update_status () =
    let char_count = GtkTextBuffer.get_char_count buffer in
    GtkLabel.set_label status_label
      (Printf.sprintf "Characters: %d" char_count)
  in
  update_status ();
  vbox#append (GObj.widget_of_obj status_label);

  (* Show window and run main loop *)
  window#show;
  GMain.main ()

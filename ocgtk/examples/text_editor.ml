  (* Simple Text Editor
   Demonstrates: TextView, TextBuffer, TextTag, Entry, Button *)
let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Application_and__window_and__window_group.Window.new_ () in
  let window = new GApplication_and__window_and__window_group.window window_obj in
  window#set_title (Some "Simple Text Editor");
  window#set_default_size 600 400;

  (* Create vertical box for layout *)
  let vbox_obj = Box.new_ `VERTICAL 5 in
  let vbox = new GBox.box vbox_obj in
  window#set_child (Some (vbox :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget));

  (* Create text buffer and view *)
  let buffer = Text_buffer_and__text_iter_and__text_mark.Text_buffer.new_ None in
  let text_view_obj = Text_view.new_ () in
  Text_view.set_buffer text_view_obj (Some buffer);
  Text_view.set_wrap_mode text_view_obj `WORD;

  (* Add scrolled window for text view *)
  let scrolled_obj = Scrolled_window.new_ () in
  let scrolled = new GScrolled_window.scrolled_window scrolled_obj in
  let text_view_widget = Text_view.as_widget text_view_obj in
  scrolled#set_child (Some (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget text_view_widget));
  vbox#append (scrolled :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);

  (* Insert some initial text *)
  Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_at_cursor buffer "Welcome to the Simple Text Editor!\n\n" (-1);
  Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_at_cursor buffer "Type your text here.\n" (-1);

  (* Entry for new text *)
  let entry_obj = Entry.new_ () in
  Entry.set_placeholder_text entry_obj (Some "Type text to insert...");
  let entry_widget = Entry.as_widget entry_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget entry_widget);

  (* Button row *)
  let button_box_obj = Box.new_ `HORIZONTAL 5 in
  let button_box = new GBox.box button_box_obj in
  vbox#append (button_box :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);

  (* Insert text button *)
  let insert_btn_obj = Button.new_with_label "Insert Text" in
  let insert_btn = new GButton.button insert_btn_obj in
  button_box#append (insert_btn :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);

  ignore (insert_btn#on_clicked ~callback:(fun () ->
    let entry_buffer = Entry.get_buffer entry_obj in
    let text = Entry_buffer.get_text entry_buffer in
    if text <> "" then begin
      Text_buffer_and__text_iter_and__text_mark.Text_buffer.insert_at_cursor buffer (text ^ "\n") (-1);
      Entry_buffer.set_text entry_buffer "" (-1)
    end
  ));

  (* Clear button *)
  let clear_btn_obj = Button.new_with_label "Clear All" in
  let clear_btn = new GButton.button clear_btn_obj in
  button_box#append (clear_btn :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);

  ignore (clear_btn#on_clicked ~callback:(fun () ->
    Text_buffer_and__text_iter_and__text_mark.Text_buffer.set_text buffer "" (-1)
  ));

  (* Status label *)
  let status_label_obj = Label.new_ None in
  let update_status () =
    let char_count = Text_buffer_and__text_iter_and__text_mark.Text_buffer.get_char_count buffer in
    Label.set_label status_label_obj
      (Printf.sprintf "Characters: %d" char_count)
  in
  update_status ();
  let status_label_widget = Label.as_widget status_label_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget status_label_widget);

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()

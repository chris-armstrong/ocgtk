class settings : Settings.t ->
  object
    method reset_property : string -> unit
    method gtk_alternative_button_order : bool
    method set_gtk_alternative_button_order : bool -> unit
    method gtk_alternative_sort_arrows : bool
    method set_gtk_alternative_sort_arrows : bool -> unit
    method gtk_application_prefer_dark_theme : bool
    method set_gtk_application_prefer_dark_theme : bool -> unit
    method gtk_cursor_aspect_ratio : float
    method set_gtk_cursor_aspect_ratio : float -> unit
    method gtk_cursor_blink : bool
    method set_gtk_cursor_blink : bool -> unit
    method gtk_cursor_blink_time : int
    method set_gtk_cursor_blink_time : int -> unit
    method gtk_cursor_blink_timeout : int
    method set_gtk_cursor_blink_timeout : int -> unit
    method gtk_cursor_theme_name : string
    method set_gtk_cursor_theme_name : string -> unit
    method gtk_cursor_theme_size : int
    method set_gtk_cursor_theme_size : int -> unit
    method gtk_decoration_layout : string
    method set_gtk_decoration_layout : string -> unit
    method gtk_dialogs_use_header : bool
    method set_gtk_dialogs_use_header : bool -> unit
    method gtk_dnd_drag_threshold : int
    method set_gtk_dnd_drag_threshold : int -> unit
    method gtk_double_click_distance : int
    method set_gtk_double_click_distance : int -> unit
    method gtk_double_click_time : int
    method set_gtk_double_click_time : int -> unit
    method gtk_enable_accels : bool
    method set_gtk_enable_accels : bool -> unit
    method gtk_enable_animations : bool
    method set_gtk_enable_animations : bool -> unit
    method gtk_enable_event_sounds : bool
    method set_gtk_enable_event_sounds : bool -> unit
    method gtk_enable_input_feedback_sounds : bool
    method set_gtk_enable_input_feedback_sounds : bool -> unit
    method gtk_enable_primary_paste : bool
    method set_gtk_enable_primary_paste : bool -> unit
    method gtk_entry_password_hint_timeout : int
    method set_gtk_entry_password_hint_timeout : int -> unit
    method gtk_entry_select_on_focus : bool
    method set_gtk_entry_select_on_focus : bool -> unit
    method gtk_error_bell : bool
    method set_gtk_error_bell : bool -> unit
    method gtk_font_name : string
    method set_gtk_font_name : string -> unit
    method gtk_fontconfig_timestamp : int
    method set_gtk_fontconfig_timestamp : int -> unit
    method gtk_hint_font_metrics : bool
    method set_gtk_hint_font_metrics : bool -> unit
    method gtk_icon_theme_name : string
    method set_gtk_icon_theme_name : string -> unit
    method gtk_im_module : string
    method set_gtk_im_module : string -> unit
    method gtk_keynav_use_caret : bool
    method set_gtk_keynav_use_caret : bool -> unit
    method gtk_label_select_on_focus : bool
    method set_gtk_label_select_on_focus : bool -> unit
    method gtk_long_press_time : int
    method set_gtk_long_press_time : int -> unit
    method gtk_overlay_scrolling : bool
    method set_gtk_overlay_scrolling : bool -> unit
    method gtk_primary_button_warps_slider : bool
    method set_gtk_primary_button_warps_slider : bool -> unit
    method gtk_print_backends : string
    method set_gtk_print_backends : string -> unit
    method gtk_print_preview_command : string
    method set_gtk_print_preview_command : string -> unit
    method gtk_recent_files_enabled : bool
    method set_gtk_recent_files_enabled : bool -> unit
    method gtk_recent_files_max_age : int
    method set_gtk_recent_files_max_age : int -> unit
    method gtk_shell_shows_app_menu : bool
    method set_gtk_shell_shows_app_menu : bool -> unit
    method gtk_shell_shows_desktop : bool
    method set_gtk_shell_shows_desktop : bool -> unit
    method gtk_shell_shows_menubar : bool
    method set_gtk_shell_shows_menubar : bool -> unit
    method gtk_show_status_shapes : bool
    method set_gtk_show_status_shapes : bool -> unit
    method gtk_sound_theme_name : string
    method set_gtk_sound_theme_name : string -> unit
    method gtk_split_cursor : bool
    method set_gtk_split_cursor : bool -> unit
    method gtk_theme_name : string
    method set_gtk_theme_name : string -> unit
    method gtk_titlebar_double_click : string
    method set_gtk_titlebar_double_click : string -> unit
    method gtk_titlebar_middle_click : string
    method set_gtk_titlebar_middle_click : string -> unit
    method gtk_titlebar_right_click : string
    method set_gtk_titlebar_right_click : string -> unit
    method gtk_xft_antialias : int
    method set_gtk_xft_antialias : int -> unit
    method gtk_xft_dpi : int
    method set_gtk_xft_dpi : int -> unit
    method gtk_xft_hinting : int
    method set_gtk_xft_hinting : int -> unit
    method gtk_xft_hintstyle : string
    method set_gtk_xft_hintstyle : string -> unit
    method gtk_xft_rgba : string
    method set_gtk_xft_rgba : string -> unit
    method as_settings : Settings.t
  end


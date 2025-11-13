; GTK4 Enum generation rules

(rule
 (targets gtk4_tags_raw.h gtk4_tags_raw.c Gtk4Enums.ml)
 (deps %{project_root}/src/tools/varcc.exe)
 (action (run %{project_root}/src/tools/varcc.exe -h gtk4_tags_raw.h -c gtk4_tags_raw.c %{dep:gtk4_tags.var})))

(rule
 (target gtk4_tags.h)
 (deps gtk4_tags_raw.h)
 (action (copy gtk4_tags_raw.h gtk4_tags.h)))

(rule
 (target gtk4_tags.c)
 (deps gtk4_tags_raw.c wrappers.h gtk4_tags.h)
 (action (bash "echo '#include \"wrappers.h\"' > gtk4_tags.c && echo '#include \"gtk4_tags.h\"' >> gtk4_tags.c && cat gtk4_tags_raw.c >> gtk4_tags.c")))

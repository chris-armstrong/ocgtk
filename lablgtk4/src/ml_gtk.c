/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"
#include "ml_gobject.h"

/* Widget type conversions are defined in wrappers.h */

/* ========== Visibility ========== */

ML_1 (gtk_widget_show, GtkWidget_val, Unit)
ML_1 (gtk_widget_hide, GtkWidget_val, Unit)
ML_1 (gtk_widget_get_visible, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_visible, GtkWidget_val, Bool_val, Unit)

/* ========== Size and Allocation ========== */

ML_1 (gtk_widget_get_allocated_width, GtkWidget_val, Val_int)
ML_1 (gtk_widget_get_allocated_height, GtkWidget_val, Val_int)
ML_1 (gtk_widget_get_width, GtkWidget_val, Val_int)
ML_1 (gtk_widget_get_height, GtkWidget_val, Val_int)

CAMLprim value ml_gtk_widget_set_size_request(value widget, value width, value height)
{
  CAMLparam3(widget, width, height);
  gtk_widget_set_size_request(
    GtkWidget_val(widget),
    Int_val(width),
    Int_val(height)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_get_size_request(value widget)
{
  CAMLparam1(widget);
  CAMLlocal1(result);
  int width, height;

  gtk_widget_get_size_request(GtkWidget_val(widget), &width, &height);

  result = caml_alloc_tuple(2);
  Store_field(result, 0, Val_int(width));
  Store_field(result, 1, Val_int(height));

  CAMLreturn(result);
}

/* ========== Properties ========== */

ML_1 (gtk_widget_get_sensitive, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_sensitive, GtkWidget_val, Bool_val, Unit)

CAMLprim value ml_gtk_widget_get_name(value widget)
{
  CAMLparam1(widget);
  CAMLlocal1(result);
  const char *name;

  name = gtk_widget_get_name(GtkWidget_val(widget));

  /* Security: Check for NULL pointer */
  if (name == NULL) {
    result = caml_copy_string("");
  } else {
    result = caml_copy_string(name);
  }

  CAMLreturn(result);
}

CAMLprim value ml_gtk_widget_set_name(value widget, value name)
{
  CAMLparam2(widget, name);

  /* String_val is safe - no need for NULL check on OCaml strings */
  gtk_widget_set_name(GtkWidget_val(widget), String_val(name));

  CAMLreturn(Val_unit);
}

/* ========== Focus ========== */

ML_1 (gtk_widget_get_focusable, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_focusable, GtkWidget_val, Bool_val, Unit)
ML_1 (gtk_widget_has_focus, GtkWidget_val, Val_bool)
ML_1 (gtk_widget_grab_focus, GtkWidget_val, Val_bool)

/* ========== Parent/Root ========== */

CAMLprim value ml_gtk_widget_get_parent(value widget)
{
  CAMLparam1(widget);
  GtkWidget *parent = gtk_widget_get_parent(GtkWidget_val(widget));
  CAMLreturn(Val_option(parent, Val_GtkWidget));
}

CAMLprim value ml_gtk_widget_get_root(value widget)
{
  CAMLparam1(widget);
  GtkRoot *root = gtk_widget_get_root(GtkWidget_val(widget));
  /* GtkRoot is a GtkWidget */
  CAMLreturn(Val_option(root, Val_GtkWidget));
}

/* ========== CSS Classes ========== */

CAMLprim value ml_gtk_widget_add_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gtk_widget_add_css_class(GtkWidget_val(widget), String_val(css_class));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_remove_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gtk_widget_remove_css_class(GtkWidget_val(widget), String_val(css_class));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_has_css_class(value widget, value css_class)
{
  CAMLparam2(widget, css_class);
  gboolean has_class = gtk_widget_has_css_class(
    GtkWidget_val(widget),
    String_val(css_class)
  );
  CAMLreturn(Val_bool(has_class));
}

CAMLprim value ml_gtk_widget_get_css_classes(value widget)
{
  CAMLparam1(widget);
  CAMLlocal2(result, cons);

  char **classes = gtk_widget_get_css_classes(GtkWidget_val(widget));

  result = Val_emptylist;
  /* Security: Check for NULL pointer */
  if (classes != NULL) {
    /* Build list in reverse order */
    int i;
    /* First count to build list properly */
    for (i = 0; classes[i] != NULL; i++) {
      cons = caml_alloc(2, 0);
      Store_field(cons, 0, caml_copy_string(classes[i]));
      Store_field(cons, 1, result);
      result = cons;
    }
  }

  /* Note: gtk_widget_get_css_classes returns internal const array,
     not to be freed */
  CAMLreturn(result);
}

/* ========== State Flags ========== */

CAMLprim value ml_gtk_widget_get_state_flags(value widget)
{
  CAMLparam1(widget);
  GtkStateFlags flags = gtk_widget_get_state_flags(GtkWidget_val(widget));
  CAMLreturn(Val_int((int)flags));
}

CAMLprim value ml_gtk_widget_set_state_flags(value widget, value flags, value clear)
{
  CAMLparam3(widget, flags, clear);
  gtk_widget_set_state_flags(
    GtkWidget_val(widget),
    (GtkStateFlags)Int_val(flags),
    Bool_val(clear)
  );
  CAMLreturn(Val_unit);
}

/* ========== Queue Draw/Resize ========== */

ML_1 (gtk_widget_queue_draw, GtkWidget_val, Unit)
ML_1 (gtk_widget_queue_resize, GtkWidget_val, Unit)

/* ========== Destruction ========== */

/* Note: In GTK4, gtk_widget_destroy is deprecated.
 * Widgets are destroyed via container removal or reference counting.
 * We provide this for API compatibility but issue a warning. */
CAMLprim value ml_gtk_widget_destroy(value widget)
{
  CAMLparam1(widget);
  GtkWidget *w = GtkWidget_val(widget);
  GtkWidget *parent;

  /* Security: Check for NULL pointer */
  if (w == NULL) {
    CAMLreturn(Val_unit);
  }

  parent = gtk_widget_get_parent(w);
  if (parent) {
    /* GTK4: widget removal requires container-specific API
     * For now, just unparent if possible */
    gtk_widget_unparent(w);
  }

  CAMLreturn(Val_unit);
}

/* ========== Packing Properties ========== */

ML_1 (gtk_widget_get_hexpand, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_hexpand, GtkWidget_val, Bool_val, Unit)
ML_1 (gtk_widget_get_vexpand, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_vexpand, GtkWidget_val, Bool_val, Unit)

CAMLprim value ml_gtk_widget_get_halign(value widget)
{
  CAMLparam1(widget);
  GtkAlign align = gtk_widget_get_halign(GtkWidget_val(widget));
  CAMLreturn(Val_int((int)align));
}

CAMLprim value ml_gtk_widget_set_halign(value widget, value align)
{
  CAMLparam2(widget, align);
  gtk_widget_set_halign(GtkWidget_val(widget), (GtkAlign)Int_val(align));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_widget_get_valign(value widget)
{
  CAMLparam1(widget);
  GtkAlign align = gtk_widget_get_valign(GtkWidget_val(widget));
  CAMLreturn(Val_int((int)align));
}

CAMLprim value ml_gtk_widget_set_valign(value widget, value align)
{
  CAMLparam2(widget, align);
  gtk_widget_set_valign(GtkWidget_val(widget), (GtkAlign)Int_val(align));
  CAMLreturn(Val_unit);
}

ML_1 (gtk_widget_get_margin_start, GtkWidget_val, Val_int)
ML_2 (gtk_widget_set_margin_start, GtkWidget_val, Int_val, Unit)
ML_1 (gtk_widget_get_margin_end, GtkWidget_val, Val_int)
ML_2 (gtk_widget_set_margin_end, GtkWidget_val, Int_val, Unit)
ML_1 (gtk_widget_get_margin_top, GtkWidget_val, Val_int)
ML_2 (gtk_widget_set_margin_top, GtkWidget_val, Int_val, Unit)
ML_1 (gtk_widget_get_margin_bottom, GtkWidget_val, Val_int)
ML_2 (gtk_widget_set_margin_bottom, GtkWidget_val, Int_val, Unit)

/* ========== GtkBox ========== */

CAMLprim value ml_gtk_box_new(value orientation, value spacing)
{
  CAMLparam2(orientation, spacing);
  GtkWidget *box = gtk_box_new((GtkOrientation)Int_val(orientation), Int_val(spacing));
  CAMLreturn(Val_GtkWidget(box));
}

CAMLprim value ml_gtk_box_append(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_append(GTK_BOX(GtkWidget_val(box)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_box_prepend(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_prepend(GTK_BOX(GtkWidget_val(box)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_box_insert_child_after(value box, value child, value sibling)
{
  CAMLparam3(box, child, sibling);

  GtkWidget *sibling_widget = NULL;
  if (Is_some(sibling)) {
    sibling_widget = GtkWidget_val(Some_val(sibling));
  }

  gtk_box_insert_child_after(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child),
    sibling_widget
  );

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_box_remove(value box, value child)
{
  CAMLparam2(box, child);
  gtk_box_remove(GTK_BOX(GtkWidget_val(box)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_box_reorder_child_after(value box, value child, value sibling)
{
  CAMLparam3(box, child, sibling);

  GtkWidget *sibling_widget = NULL;
  if (Is_some(sibling)) {
    sibling_widget = GtkWidget_val(Some_val(sibling));
  }

  gtk_box_reorder_child_after(
    GTK_BOX(GtkWidget_val(box)),
    GtkWidget_val(child),
    sibling_widget
  );

  CAMLreturn(Val_unit);
}

ML_1 (gtk_box_get_spacing, GTK_BOX(GtkWidget_val), Val_int)
ML_2 (gtk_box_set_spacing, GTK_BOX(GtkWidget_val), Int_val, Unit)
ML_1 (gtk_box_get_homogeneous, GTK_BOX(GtkWidget_val), Val_bool)
ML_2 (gtk_box_set_homogeneous, GTK_BOX(GtkWidget_val), Bool_val, Unit)

CAMLprim value ml_gtk_box_get_baseline_position(value box)
{
  CAMLparam1(box);
  GtkBaselinePosition pos = gtk_box_get_baseline_position(GTK_BOX(GtkWidget_val(box)));
  CAMLreturn(Val_int((int)pos));
}

CAMLprim value ml_gtk_box_set_baseline_position(value box, value pos)
{
  CAMLparam2(box, pos);
  gtk_box_set_baseline_position(GTK_BOX(GtkWidget_val(box)), (GtkBaselinePosition)Int_val(pos));
  CAMLreturn(Val_unit);
}

/* ========== Initialization and Main Loop ========== */

/* GTK4 Note: gtk_init_check() no longer takes argc/argv parameters.
 * Command-line argument parsing is now handled by GtkApplication.
 * We keep the argv parameter for API compatibility but just return it unchanged. */
CAMLprim value ml_gtk_init(value argv)
{
  CAMLparam1(argv);

  /* GTK4: gtk_init_check has signature: gboolean gtk_init_check(void) */
  if (!gtk_init_check()) {
    caml_failwith("GTK initialization failed");
  }

  /* Return argv unchanged (GTK4 doesn't process it) */
  CAMLreturn(argv);
}

/* GTK4 Note: gtk_main/gtk_main_quit were removed.
 * For testing, we use GLib's main loop directly.
 * Production apps should use GtkApplication (Phase 6.2). */

static GMainLoop *main_loop = NULL;

CAMLprim value ml_gtk_main(value unit)
{
  CAMLparam1(unit);

  if (main_loop == NULL) {
    main_loop = g_main_loop_new(NULL, FALSE);
  }

  g_main_loop_run(main_loop);

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_main_quit(value unit)
{
  CAMLparam1(unit);

  if (main_loop != NULL) {
    g_main_loop_quit(main_loop);
  }

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_main_iteration_do(value block)
{
  CAMLparam1(block);
  GMainContext *context = g_main_context_default();
  gboolean result = g_main_context_iteration(context, Bool_val(block));
  CAMLreturn(Val_bool(result));
}

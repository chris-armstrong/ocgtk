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

#define GtkWidget_val(val) ((GtkWidget*)ext_of_val(val))
#define Val_GtkWidget(obj) ((value)(val_of_ext(obj)))

/* Widget type conversions are defined in wrappers.h */

/* ========== Visibility ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
ML_1 (gtk_widget_show, GtkWidget_val, Unit)
ML_1 (gtk_widget_hide, GtkWidget_val, Unit)
ML_1 (gtk_widget_get_visible, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_visible, GtkWidget_val, Bool_val, Unit)
*/

/* ========== Size and Allocation ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
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
*/

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
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
ML_1 (gtk_widget_get_sensitive, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_sensitive, GtkWidget_val, Bool_val, Unit)

CAMLprim value ml_gtk_widget_get_name(value widget)
{
  CAMLparam1(widget);
  CAMLlocal1(result);
  const char *name;

  name = gtk_widget_get_name(GtkWidget_val(widget));

  // Security: Check for NULL pointer
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

  // String_val is safe - no need for NULL check on OCaml strings
  gtk_widget_set_name(GtkWidget_val(widget), String_val(name));

  CAMLreturn(Val_unit);
}
*/

/* ========== Focus ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
ML_1 (gtk_widget_get_focusable, GtkWidget_val, Val_bool)
ML_2 (gtk_widget_set_focusable, GtkWidget_val, Bool_val, Unit)
ML_1 (gtk_widget_has_focus, GtkWidget_val, Val_bool)
ML_1 (gtk_widget_grab_focus, GtkWidget_val, Val_bool)
*/

/* ========== Parent/Root ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
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
  // GtkRoot is a GtkWidget
  CAMLreturn(Val_option(root, Val_GtkWidget));
}
*/

/* ========== CSS Classes ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
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
  // Security: Check for NULL pointer
  if (classes != NULL) {
    // Build list in reverse order
    int i;
    // First count to build list properly
    for (i = 0; classes[i] != NULL; i++) {
      cons = caml_alloc(2, 0);
      Store_field(cons, 0, caml_copy_string(classes[i]));
      Store_field(cons, 1, result);
      result = cons;
    }
  }

  // Note: gtk_widget_get_css_classes returns internal const array,
  //   not to be freed
  CAMLreturn(result);
}
*/

/* ========== State Flags ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
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
*/

/* ========== Queue Draw/Resize ========== */
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
ML_1 (gtk_widget_queue_draw, GtkWidget_val, Unit)
ML_1 (gtk_widget_queue_resize, GtkWidget_val, Unit)
*/

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
/* Commented out - conflicts with generated code in ml_widget_gen.c */
/*
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
*/

/* ========== GtkBox ========== */
/* Commented out - conflicts with generated code in ml_box_gen.c */
/*
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

CAMLprim value ml_gtk_box_get_spacing(value box)
{
  CAMLparam1(box);
  int spacing = gtk_box_get_spacing(GTK_BOX(GtkWidget_val(box)));
  CAMLreturn(Val_int(spacing));
}

CAMLprim value ml_gtk_box_set_spacing(value box, value spacing)
{
  CAMLparam2(box, spacing);
  gtk_box_set_spacing(GTK_BOX(GtkWidget_val(box)), Int_val(spacing));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_box_get_homogeneous(value box)
{
  CAMLparam1(box);
  gboolean homogeneous = gtk_box_get_homogeneous(GTK_BOX(GtkWidget_val(box)));
  CAMLreturn(Val_bool(homogeneous));
}

CAMLprim value ml_gtk_box_set_homogeneous(value box, value homogeneous)
{
  CAMLparam2(box, homogeneous);
  gtk_box_set_homogeneous(GTK_BOX(GtkWidget_val(box)), Bool_val(homogeneous));
  CAMLreturn(Val_unit);
}

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
*/

/* ========== GtkGrid ========== */

CAMLprim value ml_gtk_grid_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *grid = gtk_grid_new();
  CAMLreturn(Val_GtkWidget(grid));
}

CAMLprim value ml_gtk_grid_attach(value grid, value child, value column, value row, value width, value height)
{
  CAMLparam5(grid, child, column, row, width);
  CAMLxparam1(height);
  gtk_grid_attach(
    GTK_GRID(GtkWidget_val(grid)),
    GtkWidget_val(child),
    Int_val(column),
    Int_val(row),
    Int_val(width),
    Int_val(height)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_attach_bc(value *argv, int argn)
{
  return ml_gtk_grid_attach(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLprim value ml_gtk_grid_attach_next_to(value grid, value child, value sibling, value side, value width, value height)
{
  CAMLparam5(grid, child, sibling, side, width);
  CAMLxparam1(height);

  GtkWidget *sibling_widget = NULL;
  if (Is_some(sibling)) {
    sibling_widget = GtkWidget_val(Some_val(sibling));
  }

  gtk_grid_attach_next_to(
    GTK_GRID(GtkWidget_val(grid)),
    GtkWidget_val(child),
    sibling_widget,
    (GtkPositionType)Int_val(side),
    Int_val(width),
    Int_val(height)
  );

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_attach_next_to_bc(value *argv, int argn)
{
  return ml_gtk_grid_attach_next_to(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLprim value ml_gtk_grid_remove(value grid, value child)
{
  CAMLparam2(grid, child);
  gtk_grid_remove(GTK_GRID(GtkWidget_val(grid)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_child_at(value grid, value column, value row)
{
  CAMLparam3(grid, column, row);
  GtkWidget *child = gtk_grid_get_child_at(
    GTK_GRID(GtkWidget_val(grid)),
    Int_val(column),
    Int_val(row)
  );
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_grid_insert_row(value grid, value position)
{
  CAMLparam2(grid, position);
  gtk_grid_insert_row(GTK_GRID(GtkWidget_val(grid)), Int_val(position));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_insert_column(value grid, value position)
{
  CAMLparam2(grid, position);
  gtk_grid_insert_column(GTK_GRID(GtkWidget_val(grid)), Int_val(position));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_insert_next_to(value grid, value sibling, value side)
{
  CAMLparam3(grid, sibling, side);
  gtk_grid_insert_next_to(
    GTK_GRID(GtkWidget_val(grid)),
    GtkWidget_val(sibling),
    (GtkPositionType)Int_val(side)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_remove_row(value grid, value position)
{
  CAMLparam2(grid, position);
  gtk_grid_remove_row(GTK_GRID(GtkWidget_val(grid)), Int_val(position));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_remove_column(value grid, value position)
{
  CAMLparam2(grid, position);
  gtk_grid_remove_column(GTK_GRID(GtkWidget_val(grid)), Int_val(position));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_row_spacing(value grid)
{
  CAMLparam1(grid);
  int spacing = gtk_grid_get_row_spacing(GTK_GRID(GtkWidget_val(grid)));
  CAMLreturn(Val_int(spacing));
}

CAMLprim value ml_gtk_grid_set_row_spacing(value grid, value spacing)
{
  CAMLparam2(grid, spacing);
  gtk_grid_set_row_spacing(GTK_GRID(GtkWidget_val(grid)), Int_val(spacing));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_column_spacing(value grid)
{
  CAMLparam1(grid);
  int spacing = gtk_grid_get_column_spacing(GTK_GRID(GtkWidget_val(grid)));
  CAMLreturn(Val_int(spacing));
}

CAMLprim value ml_gtk_grid_set_column_spacing(value grid, value spacing)
{
  CAMLparam2(grid, spacing);
  gtk_grid_set_column_spacing(GTK_GRID(GtkWidget_val(grid)), Int_val(spacing));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_row_homogeneous(value grid)
{
  CAMLparam1(grid);
  gboolean homogeneous = gtk_grid_get_row_homogeneous(GTK_GRID(GtkWidget_val(grid)));
  CAMLreturn(Val_bool(homogeneous));
}

CAMLprim value ml_gtk_grid_set_row_homogeneous(value grid, value homogeneous)
{
  CAMLparam2(grid, homogeneous);
  gtk_grid_set_row_homogeneous(GTK_GRID(GtkWidget_val(grid)), Bool_val(homogeneous));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_column_homogeneous(value grid)
{
  CAMLparam1(grid);
  gboolean homogeneous = gtk_grid_get_column_homogeneous(GTK_GRID(GtkWidget_val(grid)));
  CAMLreturn(Val_bool(homogeneous));
}

CAMLprim value ml_gtk_grid_set_column_homogeneous(value grid, value homogeneous)
{
  CAMLparam2(grid, homogeneous);
  gtk_grid_set_column_homogeneous(GTK_GRID(GtkWidget_val(grid)), Bool_val(homogeneous));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_grid_get_baseline_row(value grid)
{
  CAMLparam1(grid);
  int row = gtk_grid_get_baseline_row(GTK_GRID(GtkWidget_val(grid)));
  CAMLreturn(Val_int(row));
}

CAMLprim value ml_gtk_grid_set_baseline_row(value grid, value row)
{
  CAMLparam2(grid, row);
  gtk_grid_set_baseline_row(GTK_GRID(GtkWidget_val(grid)), Int_val(row));
  CAMLreturn(Val_unit);
}

/* ========== GtkFixed ========== */

CAMLprim value ml_gtk_fixed_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *fixed = gtk_fixed_new();
  CAMLreturn(Val_GtkWidget(fixed));
}

CAMLprim value ml_gtk_fixed_put(value fixed, value widget, value x, value y)
{
  CAMLparam4(fixed, widget, x, y);
  gtk_fixed_put(
    GTK_FIXED(GtkWidget_val(fixed)),
    GtkWidget_val(widget),
    Double_val(x),
    Double_val(y)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_fixed_remove(value fixed, value widget)
{
  CAMLparam2(fixed, widget);
  gtk_fixed_remove(GTK_FIXED(GtkWidget_val(fixed)), GtkWidget_val(widget));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_fixed_move(value fixed, value widget, value x, value y)
{
  CAMLparam4(fixed, widget, x, y);
  gtk_fixed_move(
    GTK_FIXED(GtkWidget_val(fixed)),
    GtkWidget_val(widget),
    Double_val(x),
    Double_val(y)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_fixed_get_child_position(value fixed, value widget)
{
  CAMLparam2(fixed, widget);
  CAMLlocal1(result);

  /* In GTK4, GtkFixed uses a layout manager and child positions are stored
   * in the GtkFixedLayoutChild transform, not directly retrievable via
   * gtk_fixed_get_child_position (which returns 0,0).
   * We need to use the layout manager API instead. */

  GtkWidget *fixed_widget = GtkWidget_val(fixed);
  GtkWidget *child_widget = GtkWidget_val(widget);

  /* Get the layout manager */
  GtkLayoutManager *layout = gtk_widget_get_layout_manager(fixed_widget);
  GtkLayoutChild *layout_child = gtk_layout_manager_get_layout_child(layout, child_widget);

  float x = 0.0f, y = 0.0f;

  if (GTK_IS_FIXED_LAYOUT_CHILD(layout_child)) {
    GskTransform *transform = gtk_fixed_layout_child_get_transform(GTK_FIXED_LAYOUT_CHILD(layout_child));
    if (transform != NULL) {
      gsk_transform_to_translate(transform, &x, &y);
    }
  }

  result = caml_alloc_tuple(2);
  Store_field(result, 0, caml_copy_double((double)x));
  Store_field(result, 1, caml_copy_double((double)y));
  CAMLreturn(result);
}

/* ========== GtkPaned ========== */

CAMLprim value ml_gtk_paned_new(value orientation)
{
  CAMLparam1(orientation);
  GtkWidget *paned = gtk_paned_new((GtkOrientation)Int_val(orientation));
  CAMLreturn(Val_GtkWidget(paned));
}

CAMLprim value ml_gtk_paned_set_start_child(value paned, value child)
{
  CAMLparam2(paned, child);

  GtkWidget *child_widget = NULL;
  if (Is_some(child)) {
    child_widget = GtkWidget_val(Some_val(child));
  }

  gtk_paned_set_start_child(GTK_PANED(GtkWidget_val(paned)), child_widget);
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_start_child(value paned)
{
  CAMLparam1(paned);
  GtkWidget *child = gtk_paned_get_start_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_paned_set_end_child(value paned, value child)
{
  CAMLparam2(paned, child);

  GtkWidget *child_widget = NULL;
  if (Is_some(child)) {
    child_widget = GtkWidget_val(Some_val(child));
  }

  gtk_paned_set_end_child(GTK_PANED(GtkWidget_val(paned)), child_widget);
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_end_child(value paned)
{
  CAMLparam1(paned);
  GtkWidget *child = gtk_paned_get_end_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_paned_set_position(value paned, value position)
{
  CAMLparam2(paned, position);
  gtk_paned_set_position(GTK_PANED(GtkWidget_val(paned)), Int_val(position));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_position(value paned)
{
  CAMLparam1(paned);
  int position = gtk_paned_get_position(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_int(position));
}

CAMLprim value ml_gtk_paned_set_wide_handle(value paned, value wide)
{
  CAMLparam2(paned, wide);
  gtk_paned_set_wide_handle(GTK_PANED(GtkWidget_val(paned)), Bool_val(wide));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_wide_handle(value paned)
{
  CAMLparam1(paned);
  gboolean wide = gtk_paned_get_wide_handle(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_bool(wide));
}

CAMLprim value ml_gtk_paned_set_resize_start_child(value paned, value resize)
{
  CAMLparam2(paned, resize);
  gtk_paned_set_resize_start_child(GTK_PANED(GtkWidget_val(paned)), Bool_val(resize));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_resize_start_child(value paned)
{
  CAMLparam1(paned);
  gboolean resize = gtk_paned_get_resize_start_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_bool(resize));
}

CAMLprim value ml_gtk_paned_set_resize_end_child(value paned, value resize)
{
  CAMLparam2(paned, resize);
  gtk_paned_set_resize_end_child(GTK_PANED(GtkWidget_val(paned)), Bool_val(resize));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_resize_end_child(value paned)
{
  CAMLparam1(paned);
  gboolean resize = gtk_paned_get_resize_end_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_bool(resize));
}

CAMLprim value ml_gtk_paned_set_shrink_start_child(value paned, value shrink)
{
  CAMLparam2(paned, shrink);
  gtk_paned_set_shrink_start_child(GTK_PANED(GtkWidget_val(paned)), Bool_val(shrink));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_shrink_start_child(value paned)
{
  CAMLparam1(paned);
  gboolean shrink = gtk_paned_get_shrink_start_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_bool(shrink));
}

CAMLprim value ml_gtk_paned_set_shrink_end_child(value paned, value shrink)
{
  CAMLparam2(paned, shrink);
  gtk_paned_set_shrink_end_child(GTK_PANED(GtkWidget_val(paned)), Bool_val(shrink));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_paned_get_shrink_end_child(value paned)
{
  CAMLparam1(paned);
  gboolean shrink = gtk_paned_get_shrink_end_child(GTK_PANED(GtkWidget_val(paned)));
  CAMLreturn(Val_bool(shrink));
}

/* ========== GtkNotebook ========== */

CAMLprim value ml_gtk_notebook_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *notebook = gtk_notebook_new();
  CAMLreturn(Val_GtkWidget(notebook));
}

CAMLprim value ml_gtk_notebook_append_page(value notebook, value child, value tab_label)
{
  CAMLparam3(notebook, child, tab_label);

  GtkWidget *label_widget = NULL;
  if (Is_some(tab_label)) {
    label_widget = GtkWidget_val(Some_val(tab_label));
  }

  int page_num = gtk_notebook_append_page(
    GTK_NOTEBOOK(GtkWidget_val(notebook)),
    GtkWidget_val(child),
    label_widget
  );

  CAMLreturn(Val_int(page_num));
}

CAMLprim value ml_gtk_notebook_prepend_page(value notebook, value child, value tab_label)
{
  CAMLparam3(notebook, child, tab_label);

  GtkWidget *label_widget = NULL;
  if (Is_some(tab_label)) {
    label_widget = GtkWidget_val(Some_val(tab_label));
  }

  int page_num = gtk_notebook_prepend_page(
    GTK_NOTEBOOK(GtkWidget_val(notebook)),
    GtkWidget_val(child),
    label_widget
  );

  CAMLreturn(Val_int(page_num));
}

CAMLprim value ml_gtk_notebook_insert_page(value notebook, value child, value tab_label, value position)
{
  CAMLparam4(notebook, child, tab_label, position);

  GtkWidget *label_widget = NULL;
  if (Is_some(tab_label)) {
    label_widget = GtkWidget_val(Some_val(tab_label));
  }

  int page_num = gtk_notebook_insert_page(
    GTK_NOTEBOOK(GtkWidget_val(notebook)),
    GtkWidget_val(child),
    label_widget,
    Int_val(position)
  );

  CAMLreturn(Val_int(page_num));
}

CAMLprim value ml_gtk_notebook_remove_page(value notebook, value page)
{
  CAMLparam2(notebook, page);
  gtk_notebook_remove_page(GTK_NOTEBOOK(GtkWidget_val(notebook)), Int_val(page));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_detach_tab(value notebook, value child)
{
  CAMLparam2(notebook, child);
  gtk_notebook_detach_tab(GTK_NOTEBOOK(GtkWidget_val(notebook)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_get_current_page(value notebook)
{
  CAMLparam1(notebook);
  int page = gtk_notebook_get_current_page(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_int(page));
}

CAMLprim value ml_gtk_notebook_set_current_page(value notebook, value page)
{
  CAMLparam2(notebook, page);
  gtk_notebook_set_current_page(GTK_NOTEBOOK(GtkWidget_val(notebook)), Int_val(page));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_next_page(value notebook)
{
  CAMLparam1(notebook);
  gtk_notebook_next_page(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_prev_page(value notebook)
{
  CAMLparam1(notebook);
  gtk_notebook_prev_page(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_get_nth_page(value notebook, value page_num)
{
  CAMLparam2(notebook, page_num);
  GtkWidget *page = gtk_notebook_get_nth_page(
    GTK_NOTEBOOK(GtkWidget_val(notebook)),
    Int_val(page_num)
  );
  CAMLreturn(Val_option(page, Val_GtkWidget));
}

CAMLprim value ml_gtk_notebook_get_n_pages(value notebook)
{
  CAMLparam1(notebook);
  int n_pages = gtk_notebook_get_n_pages(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_int(n_pages));
}

CAMLprim value ml_gtk_notebook_page_num(value notebook, value child)
{
  CAMLparam2(notebook, child);
  int page_num = gtk_notebook_page_num(
    GTK_NOTEBOOK(GtkWidget_val(notebook)),
    GtkWidget_val(child)
  );
  CAMLreturn(Val_int(page_num));
}

CAMLprim value ml_gtk_notebook_set_show_tabs(value notebook, value show)
{
  CAMLparam2(notebook, show);
  gtk_notebook_set_show_tabs(GTK_NOTEBOOK(GtkWidget_val(notebook)), Bool_val(show));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_get_show_tabs(value notebook)
{
  CAMLparam1(notebook);
  gboolean show = gtk_notebook_get_show_tabs(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_bool(show));
}

CAMLprim value ml_gtk_notebook_set_show_border(value notebook, value show)
{
  CAMLparam2(notebook, show);
  gtk_notebook_set_show_border(GTK_NOTEBOOK(GtkWidget_val(notebook)), Bool_val(show));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_get_show_border(value notebook)
{
  CAMLparam1(notebook);
  gboolean show = gtk_notebook_get_show_border(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_bool(show));
}

CAMLprim value ml_gtk_notebook_set_scrollable(value notebook, value scrollable)
{
  CAMLparam2(notebook, scrollable);
  gtk_notebook_set_scrollable(GTK_NOTEBOOK(GtkWidget_val(notebook)), Bool_val(scrollable));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_notebook_get_scrollable(value notebook)
{
  CAMLparam1(notebook);
  gboolean scrollable = gtk_notebook_get_scrollable(GTK_NOTEBOOK(GtkWidget_val(notebook)));
  CAMLreturn(Val_bool(scrollable));
}

/* ========== GtkStack ========== */

CAMLprim value ml_gtk_stack_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *stack = gtk_stack_new();
  CAMLreturn(Val_GtkWidget(stack));
}

CAMLprim value ml_gtk_stack_add_named(value stack, value child, value name)
{
  CAMLparam3(stack, child, name);
  gtk_stack_add_named(
    GTK_STACK(GtkWidget_val(stack)),
    GtkWidget_val(child),
    String_val(name)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_add_titled(value stack, value child, value name, value title)
{
  CAMLparam4(stack, child, name, title);
  gtk_stack_add_titled(
    GTK_STACK(GtkWidget_val(stack)),
    GtkWidget_val(child),
    String_val(name),
    String_val(title)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_add_child(value stack, value child)
{
  CAMLparam2(stack, child);
  gtk_stack_add_child(GTK_STACK(GtkWidget_val(stack)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_remove(value stack, value child)
{
  CAMLparam2(stack, child);
  gtk_stack_remove(GTK_STACK(GtkWidget_val(stack)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_get_visible_child(value stack)
{
  CAMLparam1(stack);
  GtkWidget *child = gtk_stack_get_visible_child(GTK_STACK(GtkWidget_val(stack)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_stack_set_visible_child(value stack, value child)
{
  CAMLparam2(stack, child);
  gtk_stack_set_visible_child(GTK_STACK(GtkWidget_val(stack)), GtkWidget_val(child));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_set_visible_child_name(value stack, value name)
{
  CAMLparam2(stack, name);
  gtk_stack_set_visible_child_name(GTK_STACK(GtkWidget_val(stack)), String_val(name));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_get_visible_child_name(value stack)
{
  CAMLparam1(stack);
  const char *name = gtk_stack_get_visible_child_name(GTK_STACK(GtkWidget_val(stack)));
  if (name == NULL) {
    CAMLreturn(Val_none);
  } else {
    CAMLreturn(Val_some(caml_copy_string(name)));
  }
}

CAMLprim value ml_gtk_stack_set_transition_type(value stack, value transition_type)
{
  CAMLparam2(stack, transition_type);
  gtk_stack_set_transition_type(
    GTK_STACK(GtkWidget_val(stack)),
    (GtkStackTransitionType)Int_val(transition_type)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_get_transition_type(value stack)
{
  CAMLparam1(stack);
  GtkStackTransitionType tt = gtk_stack_get_transition_type(GTK_STACK(GtkWidget_val(stack)));
  CAMLreturn(Val_int((int)tt));
}

CAMLprim value ml_gtk_stack_set_transition_duration(value stack, value duration)
{
  CAMLparam2(stack, duration);
  gtk_stack_set_transition_duration(GTK_STACK(GtkWidget_val(stack)), Int_val(duration));
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_stack_get_transition_duration(value stack)
{
  CAMLparam1(stack);
  guint duration = gtk_stack_get_transition_duration(GTK_STACK(GtkWidget_val(stack)));
  CAMLreturn(Val_int(duration));
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

/* ========== Window ========== */
/* Commented out - conflicts with generated code in ml_window_gen.c */
/*
CAMLprim value ml_gtk_window_new(value unit)
{
  CAMLparam1(unit);
  GtkWidget *window = gtk_window_new();
  CAMLreturn(Val_GtkWidget(window));
}

CAMLprim value ml_gtk_window_set_child(value window, value child)
{
  CAMLparam2(window, child);
  GtkWidget *child_widget = NULL;
  if (Is_some(child)) {
    child_widget = GtkWidget_val(Some_val(child));
  }
  gtk_window_set_child(GTK_WINDOW(GtkWidget_val(window)), child_widget);
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_window_get_child(value window)
{
  CAMLparam1(window);
  GtkWidget *child = gtk_window_get_child(GTK_WINDOW(GtkWidget_val(window)));
  CAMLreturn(Val_option(child, Val_GtkWidget));
}

ML_2 (gtk_window_set_title, GtkWindow_val, String_val, Unit)

CAMLprim value ml_gtk_window_get_title(value window)
{
  CAMLparam1(window);
  CAMLlocal1(result);
  const char *title = gtk_window_get_title(GTK_WINDOW(GtkWidget_val(window)));
  result = caml_copy_string(title ? title : "");
  CAMLreturn(result);
}

CAMLprim value ml_gtk_window_set_default_size(value window, value width, value height)
{
  CAMLparam3(window, width, height);
  gtk_window_set_default_size(
    GTK_WINDOW(GtkWidget_val(window)),
    Int_val(width),
    Int_val(height)
  );
  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_window_get_default_size(value window)
{
  CAMLparam1(window);
  CAMLlocal1(result);
  int width, height;
  gtk_window_get_default_size(GTK_WINDOW(GtkWidget_val(window)), &width, &height);
  result = caml_alloc_tuple(2);
  Store_field(result, 0, Val_int(width));
  Store_field(result, 1, Val_int(height));
  CAMLreturn(result);
}

ML_2 (gtk_window_set_resizable, GtkWindow_val, Bool_val, Unit)
ML_1 (gtk_window_get_resizable, GtkWindow_val, Val_bool)
ML_2 (gtk_window_set_modal, GtkWindow_val, Bool_val, Unit)
ML_1 (gtk_window_get_modal, GtkWindow_val, Val_bool)
ML_1 (gtk_window_destroy, GtkWindow_val, Unit)
ML_1 (gtk_window_present, GtkWindow_val, Unit)
ML_1 (gtk_window_close, GtkWindow_val, Unit)
*/

/* ========== ScrolledWindow ========== */

// CAMLprim value ml_gtk_scrolled_window_new(value unit)
// {
//   CAMLparam1(unit);
//   GtkWidget *sw = gtk_scrolled_window_new();
//   CAMLreturn(Val_GtkWidget(sw));
// }

// CAMLprim value ml_gtk_scrolled_window_set_child(value sw, value child)
// {
//   CAMLparam2(sw, child);
//   GtkWidget *child_widget = NULL;
//   if (Is_some(child)) {
//     child_widget = GtkWidget_val(Some_val(child));
//   }
//   gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(GtkWidget_val(sw)), child_widget);
//   CAMLreturn(Val_unit);
// }

// CAMLprim value ml_gtk_scrolled_window_get_child(value sw)
// {
//   CAMLparam1(sw);
//   GtkWidget *child = gtk_scrolled_window_get_child(GTK_SCROLLED_WINDOW(GtkWidget_val(sw)));
//   CAMLreturn(Val_option(child, Val_GtkWidget));
// }

// CAMLprim value ml_gtk_scrolled_window_set_policy(value sw, value hpolicy, value vpolicy)
// {
//   CAMLparam3(sw, hpolicy, vpolicy);
//   gtk_scrolled_window_set_policy(
//     GTK_SCROLLED_WINDOW(GtkWidget_val(sw)),
//     (GtkPolicyType)Int_val(hpolicy),
//     (GtkPolicyType)Int_val(vpolicy)
//   );
//   CAMLreturn(Val_unit);
// }

// CAMLprim value ml_gtk_scrolled_window_get_policy(value sw)
// {
//   CAMLparam1(sw);
//   CAMLlocal1(result);
//   GtkPolicyType hpolicy, vpolicy;
//   gtk_scrolled_window_get_policy(
//     GTK_SCROLLED_WINDOW(GtkWidget_val(sw)),
//     &hpolicy,
//     &vpolicy
//   );
//   result = caml_alloc_tuple(2);
//   Store_field(result, 0, Val_int(hpolicy));
//   Store_field(result, 1, Val_int(vpolicy));
//   CAMLreturn(result);
// }

// CAMLprim value ml_gtk_scrolled_window_get_hscrollbar(value sw)
// {
//   CAMLparam1(sw);
//   GtkWidget *scrollbar = gtk_scrolled_window_get_hscrollbar(GTK_SCROLLED_WINDOW(GtkWidget_val(sw)));
//   CAMLreturn(Val_option(scrollbar, Val_GtkWidget));
// }

// CAMLprim value ml_gtk_scrolled_window_get_vscrollbar(value sw)
// {
//   CAMLparam1(sw);
//   GtkWidget *scrollbar = gtk_scrolled_window_get_vscrollbar(GTK_SCROLLED_WINDOW(GtkWidget_val(sw)));
//   CAMLreturn(Val_option(scrollbar, Val_GtkWidget));
// }

// ML_2 (gtk_scrolled_window_set_min_content_width, GtkScrolledWindow_val, Int_val, Unit)
// ML_1 (gtk_scrolled_window_get_min_content_width, GtkScrolledWindow_val, Val_int)
// ML_2 (gtk_scrolled_window_set_min_content_height, GtkScrolledWindow_val, Int_val, Unit)
// ML_1 (gtk_scrolled_window_get_min_content_height, GtkScrolledWindow_val, Val_int)

/* ========== Frame ========== */

// CAMLprim value ml_gtk_frame_new(value label)
// {
//   CAMLparam1(label);
//   const char *label_str = NULL;
//   if (Is_some(label)) {
//     label_str = String_val(Some_val(label));
//   }
//   GtkWidget *frame = gtk_frame_new(label_str);
//   CAMLreturn(Val_GtkWidget(frame));
// }

// CAMLprim value ml_gtk_frame_set_child(value frame, value child)
// {
//   CAMLparam2(frame, child);
//   GtkWidget *child_widget = NULL;
//   if (Is_some(child)) {
//     child_widget = GtkWidget_val(Some_val(child));
//   }
//   gtk_frame_set_child(GTK_FRAME(GtkWidget_val(frame)), child_widget);
//   CAMLreturn(Val_unit);
// }

// CAMLprim value ml_gtk_frame_get_child(value frame)
// {
//   CAMLparam1(frame);
//   GtkWidget *child = gtk_frame_get_child(GTK_FRAME(GtkWidget_val(frame)));
//   CAMLreturn(Val_option(child, Val_GtkWidget));
// }

// CAMLprim value ml_gtk_frame_set_label(value frame, value label)
// {
//   CAMLparam2(frame, label);
//   const char *label_str = NULL;
//   if (Is_some(label)) {
//     label_str = String_val(Some_val(label));
//   }
//   gtk_frame_set_label(GTK_FRAME(GtkWidget_val(frame)), label_str);
//   CAMLreturn(Val_unit);
// }

// CAMLprim value ml_gtk_frame_get_label(value frame)
// {
//   CAMLparam1(frame);
//   const char *label = gtk_frame_get_label(GTK_FRAME(GtkWidget_val(frame)));
//   CAMLreturn(Val_option_string(label));
// }

// ML_2 (gtk_frame_set_label_align, GtkFrame_val, Double_val, Unit)
// ML_1 (gtk_frame_get_label_align, GtkFrame_val, caml_copy_double)

/* ========== Main Loop ========== */

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

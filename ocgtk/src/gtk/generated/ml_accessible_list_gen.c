/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleList */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

#if GTK_CHECK_VERSION(4,14,0)
/* Conversion functions for GtkAccessibleList (opaque record with hidden fields) */
GtkAccessibleList *GtkAccessibleList_val(value v) {
  return *(GtkAccessibleList **)Data_custom_val(v);
}

value Val_GtkAccessibleList(const GtkAccessibleList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkAccessibleList_option(const GtkAccessibleList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkAccessibleList(ptr));
}
#endif

#if GTK_CHECK_VERSION(4,14,0)


CAMLexport CAMLprim value ml_gtk_accessible_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
    int arg1_length = Wosize_val(arg1);
    GtkAccessible** c_arg1 = (GtkAccessible**)g_malloc(sizeof(GtkAccessible*) * arg1_length);
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = GtkAccessible_val(Field(arg1, i));
    }

GtkAccessibleList *obj = gtk_accessible_list_new_from_array(c_arg1, Long_val(arg2));

    g_free(c_arg1);
CAMLreturn(Val_GtkAccessibleList(obj));
}
#else


CAMLexport CAMLprim value ml_gtk_accessible_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
(void)arg1;
(void)arg2;
caml_failwith("AccessibleList requires GTK >= 4.14");
return Val_unit;
}


#endif

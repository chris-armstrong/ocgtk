/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileList */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include library-specific type conversions and forward declarations */
#include "gdk_decls.h"

#if GTK_CHECK_VERSION(4,6,0)
/* Conversion functions for GdkFileList (opaque record with hidden fields) */
GdkFileList *GdkFileList_val(value v) {
  return *(GdkFileList **)Data_custom_val(v);
}

value Val_GdkFileList(const GdkFileList *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkFileList_option(const GdkFileList *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkFileList(ptr));
}
#endif

#if GTK_CHECK_VERSION(4,6,0)


#if GTK_CHECK_VERSION(4,8,0)

CAMLexport CAMLprim value ml_gdk_file_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
    int arg1_length = Wosize_val(arg1);
    GFile** c_arg1 = (GFile**)g_malloc(sizeof(GFile*) * arg1_length);
    for (int i = 0; i < arg1_length; i++) {
      c_arg1[i] = GFile_val(Field(arg1, i));
    }

GdkFileList *obj = gdk_file_list_new_from_array(c_arg1, Gsize_val(arg2));

    g_free(c_arg1);
CAMLreturn(Val_GdkFileList(obj));
}
#else

CAMLexport CAMLprim value ml_gdk_file_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
(void)arg1;
(void)arg2;
caml_failwith("FileList requires GTK >= 4.8");
return Val_unit;
}
#endif

#else


CAMLexport CAMLprim value ml_gdk_file_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
(void)arg1;
(void)arg2;
caml_failwith("FileList requires GTK >= 4.6");
return Val_unit;
}


#endif

/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DragSurfaceSize */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Conversion functions for GdkDragSurfaceSize (opaque record with hidden fields) */
GdkDragSurfaceSize *GdkDragSurfaceSize_val(value v) {
  return *(GdkDragSurfaceSize **)Data_custom_val(v);
}

value Val_GdkDragSurfaceSize(const GdkDragSurfaceSize *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkDragSurfaceSize_option(const GdkDragSurfaceSize *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkDragSurfaceSize(ptr));
}


CAMLexport CAMLprim value ml_gdk_drag_surface_size_set_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gdk_drag_surface_size_set_size(GdkDragSurfaceSize_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

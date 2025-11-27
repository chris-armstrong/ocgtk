/* Test helpers for GIR record GC finalization */

#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/custom.h>

#include "../src/wrappers.h"

/* Finalization counters */
static int finalized_border = 0;
static int finalized_requisition = 0;
static int finalized_tree_iter = 0;
static int finalized_text_iter = 0;
static int finalized_bitset_iter = 0;

/* Helper to create custom ops with counting finalizer */
#define DECL_RECORD_HELPERS(TYPE, Free_fn, counter_name)              \
  static void finalize_##counter_name(value v)                        \
  {                                                                   \
    TYPE *ptr = *((TYPE **)Data_custom_val(v));                       \
    if (ptr != NULL)                                                  \
    {                                                                 \
      counter_name++;                                                 \
      Free_fn(ptr);                                                   \
    }                                                                 \
  }                                                                   \
                                                                      \
  static struct custom_operations counter_name##_ops = {              \
      "lablgtk4.test." #counter_name,                                 \
      finalize_##counter_name,                                        \
      custom_compare_default,                                         \
      custom_hash_default,                                            \
      custom_serialize_default,                                       \
      custom_deserialize_default,                                     \
      custom_compare_ext_default};                                    \
                                                                      \
  static value alloc_##counter_name(TYPE *ptr)                        \
  {                                                                   \
    CAMLparam0();                                                     \
    CAMLlocal1(v);                                                    \
    if (ptr == NULL)                                                  \
      caml_failwith("alloc_" #counter_name ": NULL");                 \
    v = caml_alloc_custom(&counter_name##_ops, sizeof(TYPE *), 0, 1); \
    *((TYPE **)Data_custom_val(v)) = ptr;                             \
    CAMLreturn(v);                                                    \
  }

DECL_RECORD_HELPERS(GtkBorder, free, finalized_border)
DECL_RECORD_HELPERS(GtkRequisition, free, finalized_requisition)
DECL_RECORD_HELPERS(GtkTreeIter, free, finalized_tree_iter)
DECL_RECORD_HELPERS(GtkTextIter, free, finalized_text_iter)
DECL_RECORD_HELPERS(GtkBitsetIter, free, finalized_bitset_iter)

/* Allocation helpers exposed to OCaml */
CAMLexport CAMLprim value ml_test_alloc_border(value unit)
{
  CAMLparam1(unit);
  GtkBorder *ptr = calloc(1, sizeof(GtkBorder));
  CAMLreturn(alloc_finalized_border(ptr));
}

CAMLexport CAMLprim value ml_test_alloc_requisition(value unit)
{
  CAMLparam1(unit);
  GtkRequisition *ptr = calloc(1, sizeof(GtkRequisition));
  CAMLreturn(alloc_finalized_requisition(ptr));
}

CAMLexport CAMLprim value ml_test_alloc_tree_iter(value unit)
{
  CAMLparam1(unit);
  GtkTreeIter *ptr = calloc(1, sizeof(GtkTreeIter));
  CAMLreturn(alloc_finalized_tree_iter(ptr));
}

CAMLexport CAMLprim value ml_test_alloc_text_iter(value unit)
{
  CAMLparam1(unit);
  GtkTextIter *ptr = calloc(1, sizeof(GtkTextIter));
  CAMLreturn(alloc_finalized_text_iter(ptr));
}

CAMLexport CAMLprim value ml_test_alloc_bitset_iter(value unit)
{
  CAMLparam1(unit);
  GtkBitsetIter *ptr = calloc(1, sizeof(GtkBitsetIter));
  CAMLreturn(alloc_finalized_bitset_iter(ptr));
}

/* Counter helpers */
CAMLexport CAMLprim value ml_test_reset_record_counters(value unit)
{
  CAMLparam1(unit);
  finalized_border = 0;
  finalized_requisition = 0;
  finalized_tree_iter = 0;
  finalized_text_iter = 0;
  finalized_bitset_iter = 0;
  CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_test_get_finalized_border(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_int(finalized_border));
}

CAMLexport CAMLprim value ml_test_get_finalized_requisition(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_int(finalized_requisition));
}

CAMLexport CAMLprim value ml_test_get_finalized_tree_iter(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_int(finalized_tree_iter));
}

CAMLexport CAMLprim value ml_test_get_finalized_text_iter(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_int(finalized_text_iter));
}

CAMLexport CAMLprim value ml_test_get_finalized_bitset_iter(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_int(finalized_bitset_iter));
}

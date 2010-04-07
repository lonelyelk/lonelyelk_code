#include <ruby.h>

VALUE rb_mBlockThread;

/*
 * call-seq:
 *   BlockThread::cycle(interval=5)
 *
 * Блокирует текущий поток на <code>interval</code> секунд.
 *
 */

VALUE bt_cycle(int argc, VALUE *argv, VALUE self) {
  int i, max;
  max = 5;

  if (argc == 1) {
    max = FIX2INT(argv[0]);
  } else if (argc > 1) {
    rb_raise(rb_eArgError, "Неправильное количество аргументов (%d вместо 0 или 1)");
  }
  
  for (i=0; i<max; i++) {
    sleep(1);
  }
  return Qnil;
}

/*
 * call-seq:
 *   BlockThread::cycle_with_schedule(interval=5)
 *
 * Старается не блокирвать текущий поток в течение <code>interval</code> секунд.
 *
 */

VALUE bt_cycle_schedule(int argc, VALUE *argv, VALUE self) {
  int i, max;
  max = 5;

  if (argc == 1) {
    max = FIX2INT(argv[0]);
  } else if (argc > 1) {
    rb_raise(rb_eArgError, "Неправильное количество аргументов (%d вместо 0 или 1)");
  }
  
  for (i=0; i<max; i++) {
    sleep(1);
    if (!rb_thread_alone()) rb_thread_schedule();
  }
  return Qnil;
}

void Init_block_thread() {
  /*
   * Модуль содержит методы для демонстрации работы потока
   */
  rb_mBlockThread = rb_define_module("BlockThread");
  rb_define_module_function(rb_mBlockThread, "cycle", bt_cycle, -1);
  rb_define_module_function(rb_mBlockThread, "cycle_with_schedule", bt_cycle_schedule, -1);
}

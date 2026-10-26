class type io_scheduler_job_t = object
  method as_io_scheduler_job : Io_scheduler_job.t
end

class io_scheduler_job : Io_scheduler_job.t -> io_scheduler_job_t

-- Stop any pending requests

update fnd_concurrent_requests 
   set phase_code =  'C',  
       status_code = 'D'
 where phase_code = 'P'
   and (program_application_id, concurrent_program_id)
       in (select application_id, concurrent_program_id
             from fnd_concurrent_programs 
            where concurrent_program_name in ('GLBSR', 'GLAAR', 'GLPL', 
		'OEPAO', 'INVIA', 'FNDRPR', 'PAPS', 'FNDPSR', 'FNDSPS', 'FNDPPS'));

-- Prevent running requests from resubmitting.

update fnd_concurrent_requests 
   set Resubmit_Time = null, Resubmit_Interval_Type_Code = null,
       Resubmit_Interval_Unit_Code = null, Resubmit_Interval = null
 where phase_code = 'R'
   and (program_application_id, concurrent_program_id)
       in (select application_id, concurrent_program_id
             from fnd_concurrent_programs 
            where concurrent_program_name like ('GLBSR', 'GLAAR', 'GLPL', 
		'OEPAO', 'INVIA', 'FNDRPR', 'PAPS', 'FNDPSR', 'FNDSPS', 'FNDPPS'));

commit;
exit;

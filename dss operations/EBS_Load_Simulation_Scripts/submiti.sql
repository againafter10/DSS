variable msg varchar2(2000);

prompt submitting requests...

declare 
  dummy number;
begin

fnd_global.apps_initialize(0, 20420, 1);

--

dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDPSR',
                                     argument1 => 43200);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--


dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDSPS',
                                     argument1 => 10);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--


dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDSPS',
                                     argument1 => 5);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--

if  not fnd_request.set_repeat_options(repeat_interval => .75,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'OE',
                                     program => 'OEPAO',
                                     argument1 => 20);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--


dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDPSR',
                                     argument1 => 5);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--


dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDPPS',
                                     argument1 => 7);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  

:msg := 'Success!';
end;
/


print msg
commit;
exit;

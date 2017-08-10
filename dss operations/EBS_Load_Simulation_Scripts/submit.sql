variable msg varchar2(2000);

prompt submitting requests...

declare 
  dummy number;
  dbtype varchar2(30);
begin

:msg := 'Success!';

select '&1' into dbtype from sys.dual;

fnd_global.apps_initialize(0, 20420, 1);

--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1048, 20477, 101);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .5,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;


dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLBSR',
                                     argument1 => 3000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1050, 20564, 140);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .15,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLAAR',
                                     argument1 => 2000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1048, 20475, 101);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .5,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLPL',
                                     argument1 => 3000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1054, 20559, 300);
end if;

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
                                     argument1 => 2000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1054, 20634, 401);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .25,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'INV',
                                     program => 'INVIA',
                                     argument1 => 2000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1055, 20420, 1);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .5,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDRPR',
                                     argument1 => 3000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1068, 21249, 178);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .25,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'PA',
                                     program => 'PAPS',
                                     argument1 => 3000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1348, 20434, 101);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .10,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLBSR',
                                     argument1 => 4500);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  



--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1348, 20564, 140);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .15,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLAAR',
                                     argument1 => 6000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  



--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1348, 20475, 101);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .20,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'SQLGL',
                                     program => 'GLPL',
                                     argument1 => 6000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  


--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1054, 20539, 401);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .15,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'INV',
                                     program => 'INVIA',
                                     argument1 => 2500);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  



--
if dbtype = 'vision' then
  fnd_global.apps_initialize(0, 20420, 1);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .40,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'FND',
                                     program => 'FNDRPR',
                                     argument1 => 3500);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  



--
if dbtype = 'vision' then
  fnd_global.apps_initialize(1051, 20433, 275);
end if;

if  not fnd_request.set_repeat_options(repeat_interval => .20,
				  repeat_unit => 'MINUTES',
                                  repeat_type => 'END') 
then
   :msg := fnd_message.get;
   rollback;
   return;
end if;

dummy := fnd_request.submit_request (application => 'PA',
                                     program => 'PAPS',
                                     argument1 => 4000);

if (dummy is null or dummy = 0) then
   :msg := fnd_message.get;
   rollback;
   return;
end if;  

end;
/


print msg
commit;
exit;




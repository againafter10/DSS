<< problemdescription

A valid phone number can be any one of the following two formats:
  (xxx) xxx-xxxx 
    or
  xxx-xxx-xxxx

problemdescription

<<output

[[leetcode]] $grep -E '^([0-9]{3})-|[0-9]{3}[0-9]{3}-[0-9]{4}$' phonenumbers.txt 
987-123-4567
[[leetcode]] $

[[leetcode]] $grep -E '^[0-9]{3}' phonenumbers.txt 
987-123-4567
123 456 7890
[[leetcode]] $

[[leetcode]] $grep -E '\d{3}-|(\(\d{3}\)-)\d{3}-\d{4}$' phonenumbers.txt 
987-123-4567
(123)- 456-7890
(456)378-9808

[[leetcode]] $sh validphones.sh 
987-123-4567
(123)- 456-7890
(456)378-9808
123-456-7891
[[leetcode]] $

output

#grep -E '\d{3}-|(\(\d{3}\)-)\d{3}-\d{4}$' phonenumbers.txt 
grep -E '(\d{3}-|\(\d{3}\) )\d{3}-\d{4}$' phonenumbers.txt 


--- Query the above file from stage

select $1,$2,$3 from @aws_raw_stage/hosts.csv
(file_format => CSV_DATA_FF);

select $1,$2,$3 from @aws_raw_stage/listings.csv
(file_format => CSV_DATA_FF);

select $1,$2,$3 from @aws_raw_stage/bookings.csv
(file_format => CSV_DATA_FF);

----

copy into BNB_HOSTS
from @aws_raw_stage/hosts.csv
file_format = (format_name = CSV_DATA_FF )
on_error = 'CONTINUE';

copy into BNB_LISTINGS
from @aws_raw_stage/listings.csv
file_format = (format_name = CSV_DATA_FF )
on_error = 'CONTINUE';

copy into BNB_BOOKINGS
from @aws_raw_stage/bookings.csv
file_format = (format_name = CSV_DATA_FF )
on_error = 'CONTINUE';

----- Now check after Data got loaded

select * from BNB_HOSTS;

select * from BNB_LISTINGS;

select * from BNB_BOOKINGS;
